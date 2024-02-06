import 'package:dio/dio.dart';
import 'package:ecommerce_pro/controller/Home/categoriesController..dart';
import 'package:ecommerce_pro/controller/Home/itemscubit.dart';
import 'package:ecommerce_pro/controller/Search/search_controller.dart';
import 'package:ecommerce_pro/controller/auth/VerifyCode/verifyCubit.dart';
import 'package:ecommerce_pro/controller/auth/forgetpassword/forgetcubit.dart';
import 'package:ecommerce_pro/controller/auth/resetpassword/resetpasswordcubit.dart';
import 'package:ecommerce_pro/controller/cart/add_delete_cart_controller.dart';
import 'package:get_it/get_it.dart';

import '../../controller/Favourite/Add_deleteItem.dart';
import '../../controller/Favourite/GetFav.dart';
import '../../controller/auth/Login/LoginCubit.dart';
import '../../controller/auth/SignUp/SignupCubit.dart';
import '../../controller/cart/Get_Cart.dart';
import '../../data/DataSource/api_factory.dart';
import '../../data/DataSource/web.dart';
import '../../data/repo/Categories/repoCateg.dart';
import '../../data/repo/auth/Signin/Login.dart';
import '../../data/repo/auth/Signin/forgetpassword.dart';
import '../../data/repo/auth/Signin/resetpassword.dart';
import '../../data/repo/auth/Signup/Signuprepo.dart';
import '../../data/repo/auth/Signup/VerifyCoderepo.dart';
import '../../data/repo/cart/cart_repo.dart';
import '../../data/repo/coupon/coupon_repo.dart';
import '../../data/repo/favourite/favourite.dart';
import '../../data/repo/items/Items_repo.dart';
import '../../data/repo/search/search_repo.dart';

final getIt = GetIt.instance;
Future<void> setupGetit() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio: dio));

  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(apiServices: getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  getIt.registerLazySingleton<SignUpRepo>(
      () => SignUpRepo(apiServices: getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  getIt.registerLazySingleton<ForgetPasswordRepo>(
      () => ForgetPasswordRepo(apiServices: getIt()));
  getIt.registerFactory<ForgetPassswordCubit>(
      () => ForgetPassswordCubit(getIt()));

  getIt.registerLazySingleton<ResetPasswordRepo>(
      () => ResetPasswordRepo(apiServices: getIt()));
  getIt.registerFactory<ResetPasswordCubit>(() => ResetPasswordCubit(getIt()));

  getIt.registerLazySingleton<VerifyCodeRepo>(
      () => VerifyCodeRepo(apiServices: getIt()));
  getIt.registerFactory<VerifyCodeCubit>(() => VerifyCodeCubit(getIt()));

  getIt.registerLazySingleton<CartRepo>(() => CartRepo(apiServices: getIt()));
  getIt.registerFactory<GetCartCubit>(() => GetCartCubit(getIt()));
  getIt.registerFactory<AddCartCubit>(() => AddCartCubit(getIt()));

  getIt.registerLazySingleton<CategoriesReop>(
      () => CategoriesReop(apiServices: getIt()));
  getIt.registerFactory<CategoriesCubit>(() => CategoriesCubit(getIt()));

  getIt.registerLazySingleton<CouponReop>(
      () => CouponReop(apiServices: getIt()));

  getIt.registerLazySingleton<FavouriteRepo>(() => FavouriteRepo(apiServices: getIt()));
  getIt.registerFactory<AddAndDeleteFavouriteCubit>(() => AddAndDeleteFavouriteCubit(getIt()));
  getIt.registerFactory<GetAllFavouriteCubit>(() => GetAllFavouriteCubit(getIt()));

  getIt.registerLazySingleton<ItemsRepo>(() => ItemsRepo(apiServices: getIt()));
  getIt.registerFactory<ItemsCubit>(() => ItemsCubit(getIt()));

  getIt.registerLazySingleton<SearchRepo>(() => SearchRepo(apiServices: getIt()));
  getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt()));



}
