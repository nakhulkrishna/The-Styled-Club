import 'package:clothingstore/features/home/domain/entities/banner/banner_entites.dart';

abstract class BannerRepositories {
  Future<List<BannerEntity>> getAllMenBanner();
  Future<List<BannerEntity>> getAllWomenBanner();
  Future<List<BannerEntity>> getAllAdornmentBanner();
}
