import 'package:riverpod_api_integrate/core/network/dio_client.dart';
import 'package:riverpod_api_integrate/data/models/post_model.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
}

class PostRepositoryImpl implements PostRepository {
  final DioClient _dioClient;

  PostRepositoryImpl(this._dioClient);

  @override
  Future<List<Post>> getPosts() async {
    try {
      final response = await _dioClient.get('/posts');
      final List<dynamic> data = response.data;
      return data.map((json) => Post.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load posts: $e');
    }
  }
}
