part of 'home_cubit_test_cubit.dart';

@immutable
sealed class HomeCubitTestState {}

final class HomeCubitTestInitial extends HomeCubitTestState {}

final class HomeBannersLoadingState extends HomeCubitTestState{}
final class HomeBannersSuccessState extends HomeCubitTestState {
BannerModel bannerModel;
  HomeBannersSuccessState({required this.bannerModel});
}
final class HomeBannersErrorState extends HomeCubitTestState {}


final class HomeProductsLoadingState extends HomeCubitTestState {}
final class HomeProductsSuccessState extends HomeCubitTestState {}
final class HomeProductsErrorState extends HomeCubitTestState{}