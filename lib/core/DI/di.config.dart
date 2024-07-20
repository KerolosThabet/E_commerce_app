// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/dataSource_contract/brandes_dataSource.dart' as _i11;
import '../../data/dataSource_contract/categories_dataSource.dart' as _i7;
import '../../data/dataSource_contract/product_dataSource.dart' as _i5;
import '../../data/dataSource_impl/brandes_DataSource_imp.dart' as _i12;
import '../../data/dataSource_impl/Categories_DataSource_impl.dart' as _i8;
import '../../data/dataSource_impl/Product_DataSource_Impl.dart' as _i6;
import '../../data/repositry_impl/Brands_repo_imp.dart' as _i16;
import '../../data/repositry_impl/Categories_repo_imp.dart' as _i14;
import '../../data/repositry_impl/Product_repo_impl.dart' as _i10;
import '../../domain/repository_contracts/Brandes_repo.dart' as _i15;
import '../../domain/repository_contracts/Categories_repo.dart' as _i13;
import '../../domain/repository_contracts/Products_repo.dart' as _i9;
import '../../domain/usecases/brands_Usecase.dart' as _i19;
import '../../domain/usecases/Categories_Usecase.dart' as _i18;
import '../../domain/usecases/Most_Selling_product_UseCase.dart' as _i17;
import '../../presentation/home/Home_ViewModel.dart' as _i3;
import '../../presentation/home/tabs/Categories_tab/Categories_ViewModel.dart'
    as _i20;
import '../../presentation/home/tabs/Home_tab/Home_tab_view_model.dart' as _i21;
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
    gh.factory<_i5.ProductDataSource>(
        () => _i6.ProductDatasourceImpl(gh<_i4.ApiManager>()));
    gh.factory<_i7.CategoriesDataSource>(
        () => _i8.CategoriesDataSourceImpl(gh<_i4.ApiManager>()));
    gh.factory<_i9.ProductRepo>(
        () => _i10.ProductRepoImpl(gh<_i5.ProductDataSource>()));
    gh.factory<_i11.BrandsDatasource>(
        () => _i12.BrandsDatasourceImp(gh<_i4.ApiManager>()));
    gh.factory<_i13.CategoriesRepo>(
        () => _i14.CategoriesRepoImp(gh<_i7.CategoriesDataSource>()));
    gh.factory<_i15.BrandesRepo>(
        () => _i16.BrandsRepoImp(gh<_i11.BrandsDatasource>()));
    gh.factory<_i17.MostSellingProductUseCase>(
        () => _i17.MostSellingProductUseCase(gh<_i9.ProductRepo>()));
    gh.factory<_i18.CategoriesUseCase>(
        () => _i18.CategoriesUseCase(gh<_i13.CategoriesRepo>()));
    gh.factory<_i19.BrandsUseCase>(
        () => _i19.BrandsUseCase(gh<_i15.BrandesRepo>()));
    gh.factory<_i20.CategoriesViewmodel>(
        () => _i20.CategoriesViewmodel(gh<_i18.CategoriesUseCase>()));
    gh.factory<_i21.HomeTabViewModel>(() => _i21.HomeTabViewModel(
          gh<_i18.CategoriesUseCase>(),
          gh<_i19.BrandsUseCase>(),
          gh<_i17.MostSellingProductUseCase>(),
        ));
    return this;
  }
}
