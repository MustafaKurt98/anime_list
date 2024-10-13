// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:anime_list/core/network/api_service.dart' as _i3;
import 'package:anime_list/view/anime_detail/data/datasources/anime_detail_remote_data_source.dart'
    as _i4;
import 'package:anime_list/view/anime_detail/data/repositories/anime_detail_repository_impl.dart'
    as _i6;
import 'package:anime_list/view/anime_detail/domain/repositories/anime_detail_repository.dart'
    as _i5;
import 'package:anime_list/view/anime_detail/domain/usecases/get_anime_detail.dart'
    as _i10;
import 'package:anime_list/view/anime_detail/presentation/bloc/anime_detail_bloc.dart'
    as _i12;
import 'package:anime_list/view/anime_list/data/datasources/anime_remote_data_source.dart'
    as _i7;
import 'package:anime_list/view/anime_list/data/repositories/anime_repository_impl.dart'
    as _i9;
import 'package:anime_list/view/anime_list/domain/repositories/anime_repository.dart'
    as _i8;
import 'package:anime_list/view/anime_list/domain/usecases/get_top_anime.dart'
    as _i11;
import 'package:anime_list/view/anime_list/presentation/bloc/anime_list_bloc.dart'
    as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

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
    gh.factory<_i3.ApiService>(() => _i3.ApiService.create());
    gh.factory<_i4.AnimeDetailRemoteDataSource>(
        () => _i4.AnimeDetailRemoteDataSourceImpl(gh<_i3.ApiService>()));
    gh.factory<_i5.AnimeDetailRepository>(() =>
        _i6.AnimeDetailRepositoryImpl(gh<_i4.AnimeDetailRemoteDataSource>()));
    gh.factory<_i7.AnimeRemoteDataSource>(
        () => _i7.AnimeRemoteDataSourceImpl(gh<_i3.ApiService>()));
    gh.factory<_i8.AnimeRepository>(
        () => _i9.AnimeRepositoryImpl(gh<_i7.AnimeRemoteDataSource>()));
    gh.factory<_i10.GetAnimeDetail>(
        () => _i10.GetAnimeDetail(gh<_i5.AnimeDetailRepository>()));
    gh.factory<_i11.GetTopAnime>(
        () => _i11.GetTopAnime(gh<_i8.AnimeRepository>()));
    gh.factory<_i12.AnimeDetailBloc>(
        () => _i12.AnimeDetailBloc(getAnimeDetail: gh<_i10.GetAnimeDetail>()));
    gh.factory<_i13.AnimeListBloc>(
        () => _i13.AnimeListBloc(getTopAnime: gh<_i11.GetTopAnime>()));
    return this;
  }
}
