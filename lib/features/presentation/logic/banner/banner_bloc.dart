import 'dart:async';
import 'package:clothingstore/features/data/repositories/bannerRepositorys/banners_repositorys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'banner_event.dart';
import 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannersRepositorys bannersRepository;

  BannerBloc({required this.bannersRepository}) : super(BannerInitial()) {
    on<FetchBanners>(_onFetchBanners);
  }

  Future<void> _onFetchBanners(
    FetchBanners event,
    Emitter<BannerState> emit,
  ) async {
    emit(BannerLoading());
    try {
      final banners = await bannersRepository.fecthBanner();
      emit(BannerLoaded(banners));
    } catch (e) {
      emit(BannerError(e.toString()));
    }
  }
}
