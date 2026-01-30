import 'package:drift/drift.dart';
import 'package:riverpod_api_integrate/core/database/app_database.dart';
import 'package:riverpod_api_integrate/core/network/dio_client.dart';
import 'package:riverpod_api_integrate/data/models/post_model.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
}

class PostRepositoryImpl implements PostRepository {
  final DioClient _dioClient;
  final AppDatabase _db;

  PostRepositoryImpl(this._dioClient, this._db);

  @override
  Future<List<Post>> getPosts() async {
    try {
      final response = await _dioClient.get('/posts');
      final List<dynamic> data = response.data;
      final posts = data.map((json) => Post.fromJson(json)).toList();

      // Cache posts
      await _db.clearPosts();
      await _db.insertPosts(
        posts
            .map(
              (p) => PostsTableCompanion.insert(
                id: Value(p.id),
                userId: p.userId,
                title: p.title,
                body: p.body,
              ),
            )
            .toList(),
      );

      return posts;
    } catch (e) {
      // Fetch from cache on error
      final cachedPosts = await _db.getAllPosts();
      if (cachedPosts.isNotEmpty) {
        return cachedPosts
            .map(
              (p) => Post(
                id: p.id,
                userId: p.userId,
                title: p.title,
                body: p.body,
              ),
            )
            .toList();
      }
      throw Exception('Failed to load posts and no cached data: $e');
    }
  }
}
