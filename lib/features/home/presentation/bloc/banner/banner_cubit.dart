import 'package:clothingstore/features/home/domain/usecases/banner/get_banner_usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'banner_state.dart';

/// Men Banner Cubit
class MenBannerCubit extends Cubit<MenBannerState> {
  final GetBannersUseCase getBanners;

  MenBannerCubit(this.getBanners) : super(MenBannerInitial()) {
    loadMenBanners();
  }

  Future<void> loadMenBanners() async {
    emit(MenBannerLoading());
    try {
      final banners = await getBanners.callGetAllMenbanner();
      emit(MenBannerLoaded(banners));
    } catch (e) {
      emit(MenBannerError(e.toString()));
    }
  }
}

/// Women Banner Cubit
class WomenBannerCubit extends Cubit<WomenBannerState> {
  final GetBannersUseCase getBanners;

  WomenBannerCubit(this.getBanners) : super(WomenBannerInitial()) {
    loadWomenBanners();
  }

  Future<void> loadWomenBanners() async {
    emit(WomenBannerLoading());
    try {
      final banners = await getBanners.callGetAllWomenbanner();
      emit(WomenBannerLoaded(banners));
    } catch (e) {
      emit(WomenBannerError(e.toString()));
    }
  }
}

/// Adornments Banner Cubit
class AdornmentsBannerCubit extends Cubit<AdornmentsBannerState> {
  final GetBannersUseCase getBanners;

  AdornmentsBannerCubit(this.getBanners) : super(AdornmentsBannerInitial()) {
    loadAdornmentsBanners();
  }

  Future<void> loadAdornmentsBanners() async {
    emit(AdornmentsBannerLoading());
    try {
      final banners = await getBanners.callGetAllAdornmentsbanner();
      emit(AdornmentsBannerLoaded(banners));
    } catch (e) {
      emit(AdornmentsBannerError(e.toString()));
    }
  }
}
