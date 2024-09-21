// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/dataSource_contract/Auth_dataSource.dart' as _i7;
import '../../data/dataSource_contract/brandes_dataSource.dart' as _i15;
import '../../data/dataSource_contract/categories_dataSource.dart' as _i11;
import '../../data/dataSource_contract/product_dataSource.dart' as _i9;
import '../../data/dataSource_contract/subCategory_dataSource.dart' as _i5;
import '../../data/dataSource_impl/Auth_DataSource_Impl.dart' as _i8;
import '../../data/dataSource_impl/brandes_DataSource_imp.dart' as _i16;
import '../../data/dataSource_impl/Categories_DataSource_impl.dart' as _i12;
import '../../data/dataSource_impl/Product_DataSource_Impl.dart' as _i10;
import '../../data/dataSource_impl/subCategories_DataSource_impl.dart' as _i6;
import '../../data/repositry_impl/Auth_repo_impl.dart' as _i27;
import '../../data/repositry_impl/Brands_repo_imp.dart' as _i20;
import '../../data/repositry_impl/Categories_repo_imp.dart' as _i18;
import '../../data/repositry_impl/Product_repo_impl.dart' as _i14;
import '../../data/repositry_impl/subCategories_repo_Impl.dart' as _i23;
import '../../domain/repository_contracts/Auth_repo.dart' as _i26;
import '../../domain/repository_contracts/Brandes_repo.dart' as _i19;
import '../../domain/repository_contracts/Categories_repo.dart' as _i17;
import '../../domain/repository_contracts/Products_repo.dart' as _i13;
import '../../domain/repository_contracts/SubCategoreis_repo.dart' as _i22;
import '../../domain/usecases/brands_Usecase.dart' as _i31;
import '../../domain/usecases/Categories_Usecase.dart' as _i24;
import '../../domain/usecases/Most_Selling_product_UseCase.dart' as _i21;
import '../../domain/usecases/SignIn_Usecase.dart' as _i29;
import '../../domain/usecases/SignuUp_Usecase.dart' as _i28;
import '../../domain/usecases/SubCategoreis_UseCase.dart' as _i25;
import '../../presentation/home/Home_ViewModel.dart' as _i3;
import '../../presentation/home/tabs/Categories_tab/Categories_ViewModel.dart'
    as _i30;
import '../../presentation/home/tabs/Home_tab/Home_tab_view_model.dart' as _i32;
import '../../presentation/signin_user/ViewModel/sign_in_veiw_model_cubit.dart'
    as _i33;
import '../../presentation/signup_user/ViewModel/sign_up_view_model_cubit.dart'
    as _i34;
import '../api/api_manager.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.HomeViewModel>(() => _i3.HomeViewModel());
    gh.singleton<_i4.ApiManager>(() => _i4.ApiManager());
    gh.factory<_i5.SubcategoryDatasource>(
        () => _i6.SubcategoriesDatasourceImpl(gh<_i4.ApiManager>()));
    gh.factory<_i7.AuthDatasource>(
        () => _i8.AuthDataSourceImpl(gh<_i4.ApiManager>()));
    gh.factory<_i9.ProductDataSource>(
        () => _i10.ProductDatasourceImpl(gh<_i4.ApiManager>()));
    gh.factory<_i11.CategoriesDataSource>(
        () => _i12.CategoriesDataSourceImpl(gh<_i4.ApiManager>()));
    gh.factory<_i13.ProductRepo>(
        () => _i14.ProductRepoImpl(gh<_i9.ProductDataSource>()));
    gh.factory<_i15.BrandsDatasource>(
        () => _i16.BrandsDatasourceImp(gh<_i4.ApiManager>()));
    gh.factory<_i17.CategoriesRepo>(
        () => _i18.CategoriesRepoImp(gh<_i11.CategoriesDataSource>()));
    gh.factory<_i19.BrandesRepo>(
        () => _i20.BrandsRepoImp(gh<_i15.BrandsDatasource>()));
    gh.factory<_i21.MostSellingProductUseCase>(
        () => _i21.MostSellingProductUseCase(gh<_i13.ProductRepo>()));
    gh.factory<_i22.SubCategoriesRepo>(
        () => _i23.SubCategoriesRepoImpl(gh<_i5.SubcategoryDatasource>()));
    gh.factory<_i24.CategoriesUseCase>(
        () => _i24.CategoriesUseCase(gh<_i17.CategoriesRepo>()));
    gh.factory<_i25.SubCategoriesUseCase>(
        () => _i25.SubCategoriesUseCase(gh<_i22.SubCategoriesRepo>()));
    gh.factory<_i26.AuthRepo>(
        () => _i27.AuthRepoImpl(gh<_i7.AuthDatasource>()));
    gh.factory<_i28.SignUpUseCase>(
        () => _i28.SignUpUseCase(gh<_i26.AuthRepo>()));
    gh.factory<_i29.SignInUseCase>(
        () => _i29.SignInUseCase(gh<_i26.AuthRepo>()));
    gh.factory<_i30.CategoriesViewmodel>(() => _i30.CategoriesViewmodel(
          gh<_i24.CategoriesUseCase>(),
          gh<_i25.SubCategoriesUseCase>(),
        ));
    gh.factory<_i31.BrandsUseCase>(
        () => _i31.BrandsUseCase(gh<_i19.BrandesRepo>()));
    gh.factory<_i32.HomeTabViewModel>(() => _i32.HomeTabViewModel(
          gh<_i24.CategoriesUseCase>(),
          gh<_i31.BrandsUseCase>(),
          gh<_i21.MostSellingProductUseCase>(),
        ));
    gh.factory<_i33.SignInViewModel>(
        () => _i33.SignInViewModel(gh<_i29.SignInUseCase>()));
    gh.factory<_i34.SignUpViewModel>(
        () => _i34.SignUpViewModel(gh<_i28.SignUpUseCase>()));
    return this;
  }
}
