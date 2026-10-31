import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/helpers/hive_helper.dart';
import 'package:e_commerce/core/helpers/network/api_const.dart';
import 'package:e_commerce/core/helpers/network/network_helper.dart';
import 'package:e_commerce/features/auth_test/model/LoginModel.dart';
import 'package:e_commerce/features/posts/view/posts_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'auth_test_state.dart';

class AuthTestCubit extends Cubit<AuthTestState> {
  AuthTestCubit() : super(AuthTestInitial());
  LoginModel loginModel = LoginModel();

  void Login (String email ,String pass)async{
    emit(AuthloadingState());
    try{
    final result = await NetworkHelper.postData(
      path: ApiConst.login,
      body : {"email":email,"passsword":pass},
      );
      loginModel =LoginModel.fromJson(result.data);
     
     if(loginModel.statusCode==200){
      HiveHelper.setToken(loginModel.data?.token??"");
      Get.offAll(PostsPage());
      emit(AuthSuccessState());
     }else {
       Get.snackbar(
          "Error",
          loginModel.message ?? "",
          backgroundColor: Colors.red,
        );
        emit(AuthErrorState());
     }
    }catch(e){
     print(e.toString());
     emit(AuthErrorState());
    }
  }
}
