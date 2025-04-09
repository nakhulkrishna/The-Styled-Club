import 'package:clothingstore/features/home/domain/entities/banner/banner_entites.dart';

import 'package:clothingstore/features/home/domain/entities/banner/banner_entites.dart';

abstract class MenBannerState {}

class MenBannerInitial extends MenBannerState {}

class MenBannerLoading extends MenBannerState {}

class MenBannerLoaded extends MenBannerState {
  final List<BannerEntity> banners;
  MenBannerLoaded(this.banners);
}

class MenBannerError extends MenBannerState {
  final String message;
  MenBannerError(this.message);
}


abstract class WomenBannerState {}

class WomenBannerInitial extends WomenBannerState {}

class WomenBannerLoading extends WomenBannerState {}

class WomenBannerLoaded extends WomenBannerState {
  final List<BannerEntity> banners;
  WomenBannerLoaded(this.banners);
}

class WomenBannerError extends WomenBannerState {
  final String message;
  WomenBannerError(this.message);
}



abstract class AdornmentsBannerState {}

class AdornmentsBannerInitial extends AdornmentsBannerState {}

class AdornmentsBannerLoading extends AdornmentsBannerState {}

class AdornmentsBannerLoaded extends AdornmentsBannerState {
  final List<BannerEntity> banners;
  AdornmentsBannerLoaded(this.banners);
}

class AdornmentsBannerError extends AdornmentsBannerState {
  final String message;
  AdornmentsBannerError(this.message);
}
