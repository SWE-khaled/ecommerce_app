import 'package:e_commerce/features/posts/cubit/cubit/posts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostsCubit,PostsState>(
        builder: (context,state){
           final cubit = context.read<PostsCubit>();
           if(state is PostsLoadingState){
            return Center(child: CircularProgressIndicator(),);
           }else if (state is PostsErrorState)
           {
            return Center(child: Text("there's an error"),);
           }
           return ListView.builder(
            itemCount: cubit.posts.length,
          itemBuilder: (
        (context, index) =>
         ListTile(
          title: Text(cubit.posts[index].title??""),
          subtitle: Text(cubit.posts[index].body??""),
          )
         )
         );
          }
        ),
    );
  }
}
