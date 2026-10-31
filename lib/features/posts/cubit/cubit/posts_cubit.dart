import 'package:dio/dio.dart';
import 'package:e_commerce/features/posts/model/Posts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());
 
List <PostsModel> posts=[];
Future <void> fetchPosts() async {
  try {
    emit(PostsLoadingState());
  final response =await Dio().get("https://dummyjson.com/docs/posts");
    List apiList =response.data["users"]; 
    posts =apiList.map((e) =>PostsModel.fromJson(e)).toList();
   emit(PostsSuccessState());
  }
  catch(e){
    emit(PostsErrorState());
    print(e);
  }
}
}


