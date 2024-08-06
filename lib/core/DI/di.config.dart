// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/dataSource_contract/brandes_dataSource.dart' as _i13;
import '../../data/dataSource_contract/categories_dataSource.dart' as _i9;
import '../../data/dataSource_contract/product_dataSource.dart' as _i7;
import '../../data/dataSource_contract/subCategory_dataSource.dart' as _i5;
import '../../data/dataSource_impl/brandes_DataSource_imp.dart' as _i14;
import '../../data/dataSource_impl/Categories_DataSource_impl.dart' as _i10;
import '../../data/dataSource_impl/Product_DataSource_Impl.dart' as _i8;
import '../../data/dataSource_impl/subCategories_DataSource_impl.dart' as _i6;
import '../../data/repositry_impl/Brands_repo_imp.dart' as _i18;
import '../../data/repositry_impl/Categories_repo_imp.dart' as _i16;
import '../../data/repositry_impl/Product_repo_impl.dart' as _i12;
import '../../data/repositry_impl/subCategories_repo_Impl.dart' as _i21;
import '../../domain/repository_contracts/Brandes_repo.dart' as _i17;
import '../../domain/repository_contracts/Categories_repo.dart' as _i15;
import '../../domain/repository_contracts/Products_repo.dart' as _i11;
import '../../domain/repository_contracts/SubCategoreis_repo.dart' as _i20;
import '../../domain/usecases/brands_Usecase.dart' as _i25;
import '../../domain/usecases/Categories_Usecase.dart' as _i22;
import '../../domain/usecases/Most_Selling_product_UseCase.dart' as _i19;
import '../../domain/usecases/SubCategoreis_UseCase.dart' as _i23;
import '../../presentation/home/Home_ViewModel.dart' as _i3;
import '../../presentation/home/tabs/Categories_tab/Categories_ViewModel.dart'
    as _i24;
import '../../presentation/home/tabs/Home_tab/Home_tab_view_model.dart' as _i26;
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
    gh.factory<_i7.ProductDataSource>(
        () => _i8.ProductDatasourceImpl(gh<_i4.ApiManager>()));
    gh.factory<_i9.CategoriesDataSource>(
        () => _i10.CategoriesDataSourceImpl(gh<_i4.ApiManager>()));
    gh.factory<_i11.ProductRepo>(
        () => _i12.ProductRepoImpl(gh<_i7.ProductDataSource>()));
    gh.factory<_i13.BrandsDatasource>(
        () => _i14.BrandsDatasourceImp(gh<_i4.ApiManager>()));
    gh.factory<_i15.CategoriesRepo>(
        () => _i16.CategoriesRepoImp(gh<_i9.CategoriesDataSource>()));
    gh.factory<_i17.BrandesRepo>(
        () => _i18.BrandsRepoImp(gh<_i13.BrandsDatasource>()));
    gh.factory<_i19.MostSellingProductUseCase>(
        () => _i19.MostSellingProductUseCase(gh<_i11.ProductRepo>()));
    gh.factory<_i20.SubCategoriesRepo>(
        () => _i21.SubCategoriesRepoImpl(gh<_i5.SubcategoryDatasource>()));
    gh.factory<_i22.CategoriesUseCase>(
        () => _i22.CategoriesUseCase(gh<_i15.CategoriesRepo>()));
    gh.factory<_i23.SubCategoriesUseCase>(
        () => _i23.SubCategoriesUseCase(gh<_i20.SubCategoriesRepo>()));
    gh.factory<_i24.CategoriesViewmodel>(() => _i24.CategoriesViewmodel(
          gh<_i22.CategoriesUseCase>(),
          gh<_i23.SubCategoriesUseCase>(),
        ));
    gh.factory<_i25.BrandsUseCase>(
        () => _i25.BrandsUseCase(gh<_i17.BrandesRepo>()));
    gh.factory<_i26.HomeTabViewModel>(() => _i26.HomeTabViewModel(
          gh<_i22.CategoriesUseCase>(),
          gh<_i25.BrandsUseCase>(),
          gh<_i19.MostSellingProductUseCase>(),
        ));
    return this;
  }
}
