import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api_integrate/data/models/post_model.dart';
import 'package:riverpod_api_integrate/repositories/post_repository.dart';
import 'package:riverpod_api_integrate/core/network/dio_client.dart';

final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient();
});

final postRepositoryProvider = Provider<PostRepository>((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return PostRepositoryImpl(dioClient);
});

final postProvider = AsyncNotifierProvider<PostNotifier, List<Post>>(() {
  return PostNotifier();
});

class PostNotifier extends AsyncNotifier<List<Post>> {
  @override
  Future<List<Post>> build() async {
    return _fetchPosts();
  }

  Future<List<Post>> _fetchPosts() async {
    final repository = ref.read(postRepositoryProvider);
    return repository.getPosts();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchPosts());
  }
}
