part of 'auth_test_cubit.dart';

@immutable
sealed class AuthTestState {}

final class AuthTestInitial extends AuthTestState {}
final class AuthErrorState extends AuthTestState {}
final class AuthloadingState extends AuthTestState {}
final class AuthSuccessState extends AuthTestState {}
