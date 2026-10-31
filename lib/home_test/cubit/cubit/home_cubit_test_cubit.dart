import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/core/helpers/network/api_const.dart';
import 'package:e_commerce/core/helpers/network/network_helper.dart';
import 'package:e_commerce/home_test/model/banner_model.dart';
import 'package:e_commerce/home_test/model/product_model.dart';

part 'home_cubit_test_state.dart';

class HomeCubitTestCubit extends Cubit<HomeCubitTestState> {
  HomeCubitTestCubit() : super(HomeCubitTestInitial());

  BannerModel bannerModel = BannerModel();
  ProductModel productModel = ProductModel();

  void fetchBanners() async {
    emit(HomeBannersLoadingState());

    try {
      final result = await NetworkHelper.getData(path: ApiConst.banners);
      bannerModel = BannerModel.fromJson(result.data);
      if (bannerModel.statusCode == 200) {
        emit(HomeBannersSuccessState(bannerModel: bannerModel));
      } else {
        emit(HomeBannersErrorState());
      }
    } catch (e) {
      emit(HomeBannersErrorState());
    }
  }

  void fetchProducts() async {
    emit(HomeProductsLoadingState());
    try {
      final result = await NetworkHelper.getData(path: ApiConst.products);
      productModel = ProductModel.fromJson(result.data);
      if (productModel.statusCode == 200) {
        emit(HomeProductsSuccessState());
      } else {
        emit(HomeProductsErrorState());
      }
    } catch (e) {
      emit(HomeProductsErrorState());
    }
  }
}
