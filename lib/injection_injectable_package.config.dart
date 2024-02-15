// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:flutter/widgets.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i8;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import 'core/network/network_info.dart' as _i11;
import 'Features/auth/data/datasources/user_local_data_source.dart' as _i13;
import 'Features/auth/data/datasources/user_remote_data_source.dart' as _i14;
import 'Features/auth/data/repositories/user_repository_impl.dart' as _i16;
import 'Features/auth/domain/repositories/user_repository.dart' as _i15;
import 'Features/auth/domain/usecases/sign_in_usecase.dart' as _i30;
import 'Features/auth/domain/usecases/sign_out_usecase.dart' as _i31;
import 'Features/auth/domain/usecases/sign_up_usecase.dart' as _i32;
import 'Features/auth/presentation/blocs/signin_signup/signin_signup_bloc.dart'
    as _i33;
import 'Features/cart/data/datasources/item_remote_data_source.dart' as _i9;
import 'Features/cart/data/repositories/item_repositories_impl.dart' as _i29;
import 'Features/cart/domain/repositories/items_cart_repositories.dart' as _i28;
import 'Features/cart/domain/usecases/add_order_usecase.dart' as _i35;
import 'Features/cart/presentation/blocs/add_delete_item/add_delete_item_bloc.dart'
    as _i3;
import 'Features/cart/presentation/blocs/add_item_firestore/add_item_firestore_bloc.dart'
    as _i40;
import 'Features/favorite/presentation/blocs/bloc/favorite_bloc.dart' as _i38;
import 'Features/home/data/datasources/category_local_data_source.dart' as _i21;
import 'Features/home/data/datasources/category_remote_data_source.dart' as _i5;
import 'Features/home/data/repositories/category_repositories_impl.dart'
    as _i20;
import 'Features/home/domain/repositories/category_repositories.dart' as _i19;
import 'Features/home/domain/usecases/get_all_categories.dart' as _i23;
import 'Features/home/domain/usecases/get_first_list_view_usecase.dart' as _i24;
import 'Features/home/domain/usecases/get_second_list_view_usecase.dart.dart'
    as _i25;
import 'Features/home/domain/usecases/get_third_list_view_usecase.dart' as _i26;
import 'Features/home/domain/usecases/update_favorite_use_case.dart' as _i34;
import 'Features/home/presentation/blocs/home/home_bloc.dart' as _i39;
import 'Features/profile/data/datasources/added_items_remote_datasource.dart'
    as _i4;
import 'Features/profile/data/repositories/added_items_repositories_impl.dart'
    as _i18;
import 'Features/profile/domain/repositories/added_items_repositories.dart'
    as _i17;
import 'Features/profile/domain/usecases/add_profile_image.dart' as _i36;
import 'Features/profile/domain/usecases/get_orders_list.dart' as _i22;
import 'Features/profile/domain/usecases/get_user.dart' as _i27;
import 'Features/profile/presentation/blocs/added_items/added_items_bloc.dart'
    as _i37;
import 'Features/welcoming/presentation/blocs/login_logout_cache_helper/login_logout_cache_helper_bloc.dart'
    as _i10;
import 'injection_injectable_package.dart' as _i41;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AddDeleteItemBloc>(() => _i3.AddDeleteItemBloc());
  gh.lazySingleton<_i4.AddedItemsRemoteDataSource>(
      () => _i4.AddedItemsRemoteDataSourceImpl());
  gh.lazySingleton<_i5.CategoryRemoteDataSource>(
      () => _i5.CategoryRemoteDataSourceImpl());
  gh.lazySingleton<_i6.FirebaseAuth>(() => registerModule.prefs1);
  gh.lazySingleton<_i7.GlobalKey<_i7.NavigatorState>>(
      () => registerModule.navigatorKey);
  gh.lazySingleton<_i8.InternetConnectionChecker>(() => registerModule.prefs);
  gh.lazySingleton<_i9.ItemRemoteDataSource>(
      () => _i9.ItemRemoteDataSourceImpl());
  gh.lazySingleton<_i10.LoginLogoutCacheHelperBloc>(
      () => _i10.LoginLogoutCacheHelperBloc());
  gh.lazySingleton<_i11.NetworkInfo>(
      () => _i11.NetworkInfoImpl(gh<_i8.InternetConnectionChecker>()));
  gh.lazySingletonAsync<_i12.SharedPreferences>(
      () => registerModule.sharedPreferences);
  gh.lazySingleton<_i13.UserLocalDataSource>(
      () => _i13.UserLocalDataSourceImpl());
  gh.lazySingleton<_i14.UserRemoteDataSource>(() =>
      _i14.UserRemoteDataSourceImpl(firebaseAuth: gh<_i6.FirebaseAuth>()));
  gh.lazySingleton<_i15.UserRepository>(() => _i16.UserRepositoryImp(
        localDataSource: gh<_i13.UserLocalDataSource>(),
        remoteDataSource: gh<_i14.UserRemoteDataSource>(),
        networkInfo: gh<_i11.NetworkInfo>(),
      ));
  gh.lazySingleton<_i17.AddedItemsRepository>(
      () => _i18.AddedItemsRepositoryImpl(
            remoteDataSource: gh<_i4.AddedItemsRemoteDataSource>(),
            networkInfo: gh<_i11.NetworkInfo>(),
          ));
  gh.lazySingleton<_i19.CategoriesRepository>(
      () => _i20.CategoriesRepositoryImpl(
            remoteDataSource: gh<_i5.CategoryRemoteDataSource>(),
            networkInfo: gh<_i11.NetworkInfo>(),
          ));
  gh.lazySingletonAsync<_i21.CategoryLocalDataSource>(() async =>
      _i21.CategoryLocalDataSourceImpl(
          prefs: await gh.getAsync<_i12.SharedPreferences>()));
  gh.lazySingleton<_i22.GetAddedOrdersUsecase>(
      () => _i22.GetAddedOrdersUsecase(gh<_i17.AddedItemsRepository>()));
  gh.lazySingleton<_i23.GetAllCategoriesUseCase>(
      () => _i23.GetAllCategoriesUseCase(gh<_i19.CategoriesRepository>()));
  gh.lazySingleton<_i24.GetFirstListViewUseCase>(
      () => _i24.GetFirstListViewUseCase(gh<_i19.CategoriesRepository>()));
  gh.lazySingleton<_i25.GetSecondListViewUseCase>(
      () => _i25.GetSecondListViewUseCase(gh<_i19.CategoriesRepository>()));
  gh.lazySingleton<_i26.GetThirdListViewUseCase>(
      () => _i26.GetThirdListViewUseCase(gh<_i19.CategoriesRepository>()));
  gh.lazySingleton<_i27.GetUserUsecase>(
      () => _i27.GetUserUsecase(gh<_i17.AddedItemsRepository>()));
  gh.lazySingleton<_i28.ItemsRepository>(() => _i29.ItemsRepositoryImpl(
        remoteDataSource: gh<_i9.ItemRemoteDataSource>(),
        networkInfo: gh<_i11.NetworkInfo>(),
      ));
  gh.lazySingleton<_i30.SignInUseCase>(
      () => _i30.SignInUseCase(repository: gh<_i15.UserRepository>()));
  gh.lazySingleton<_i31.SignOutUseCase>(
      () => _i31.SignOutUseCase(repository: gh<_i15.UserRepository>()));
  gh.lazySingleton<_i32.SignUpUseCase>(
      () => _i32.SignUpUseCase(repository: gh<_i15.UserRepository>()));
  gh.lazySingleton<_i33.SigninSignupBloc>(() => _i33.SigninSignupBloc(
        signIn: gh<_i30.SignInUseCase>(),
        signUp: gh<_i32.SignUpUseCase>(),
        signOut: gh<_i31.SignOutUseCase>(),
      ));
  gh.lazySingleton<_i34.UpdateFevoriteUsecase>(
      () => _i34.UpdateFevoriteUsecase(gh<_i19.CategoriesRepository>()));
  gh.lazySingleton<_i35.AddOrderUseCase>(
      () => _i35.AddOrderUseCase(gh<_i28.ItemsRepository>()));
  gh.lazySingleton<_i36.AddProfileImageUsecase>(
      () => _i36.AddProfileImageUsecase(gh<_i17.AddedItemsRepository>()));
  gh.lazySingleton<_i37.AddedItemsBloc>(() => _i37.AddedItemsBloc(
        getAddedOrders: gh<_i22.GetAddedOrdersUsecase>(),
        getUser: gh<_i27.GetUserUsecase>(),
        addImage: gh<_i36.AddProfileImageUsecase>(),
      ));
  gh.lazySingleton<_i38.FavoriteBloc>(() => _i38.FavoriteBloc(
        getThirdListView: gh<_i26.GetThirdListViewUseCase>(),
        updateFevorite: gh<_i34.UpdateFevoriteUsecase>(),
      ));
  gh.lazySingleton<_i39.HomeBloc>(() => _i39.HomeBloc(
        getCategories: gh<_i23.GetAllCategoriesUseCase>(),
        getFirstListView: gh<_i24.GetFirstListViewUseCase>(),
        getSecondListView: gh<_i25.GetSecondListViewUseCase>(),
        getThirdListView: gh<_i26.GetThirdListViewUseCase>(),
        updateFevorite: gh<_i34.UpdateFevoriteUsecase>(),
      ));
  gh.lazySingleton<_i40.AddItemFirestoreBloc>(
      () => _i40.AddItemFirestoreBloc(addOrder: gh<_i35.AddOrderUseCase>()));
  return getIt;
}

class _$RegisterModule extends _i41.RegisterModule {}
