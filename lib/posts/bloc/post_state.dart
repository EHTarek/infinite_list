part of 'post_bloc.dart';

abstract class PostState extends Equatable {}

class PostInitialState extends PostState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class PostLoadedState extends PostState {
  PostLoadedState({
    this.posts = const <Post>[],
    this.hasReachedMax = false,
  });

  final List<Post> posts;
  final bool hasReachedMax;

  @override
  List<Object> get props => [posts, hasReachedMax];
}
