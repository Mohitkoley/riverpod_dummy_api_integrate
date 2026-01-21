import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'post_model.g.dart';

@JsonSerializable()
class Post extends Equatable {
  final int id;
  final int userId;
  final String title;
  final String body;

  const Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  @override
  List<Object?> get props => [id, userId, title, body];
}
