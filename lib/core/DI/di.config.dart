// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/dataSource_contract/brandes_dataSource.dart' as _i8;
import '../../data/dataSource_contract/categories_dataSource.dart' as _i4;
import '../../data/dataSource_impl/brandes_DataSource_imp.dart' as _i9;
import '../../data/dataSource_impl/Categories_DataSource_impl.dart' as _i5;
import '../../data/repositry_impl/Brands_repo_imp.dart' as _i12;
import '../../data/repositry_impl/Categories_repo_imp.dart' as _i7;
import '../../domain/repository_contracts/Brandes_repo.dart' as _i11;
import '../../domain/repository_contracts/Categories_repo.dart' as _i6;
import '../../domain/usecases/brands_Usecase.dart' as _i13;
import '../../domain/usecases/Categories_Usecase.dart' as _i10;
import '../../presentation/home/tabs/view_model/Home_tab_view_model.dart'
    as _i14;
import '../api/api_manager.dart' as _i3;

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
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.CategoriesDataSource>(
        () => _i5.CategoriesDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.CategoriesRepo>(
        () => _i7.CategoriesRepoImp(gh<_i4.CategoriesDataSource>()));
    gh.factory<_i8.BrandesDatasource>(
        () => _i9.BrandesDatasourceImp(gh<_i3.ApiManager>()));
    gh.factory<_i10.CategoriesUseCase>(
        () => _i10.CategoriesUseCase(gh<_i6.CategoriesRepo>()));
    gh.factory<_i11.BrandesRepo>(
        () => _i12.BrandsRepoImp(gh<_i8.BrandesDatasource>()));
    gh.factory<_i13.BrandsUseCase>(
        () => _i13.BrandsUseCase(gh<_i11.BrandesRepo>()));
    gh.factory<_i14.HomeTabViewModel>(() => _i14.HomeTabViewModel(
          gh<_i10.CategoriesUseCase>(),
          gh<_i13.BrandsUseCase>(),
        ));
    return this;
  }
}
