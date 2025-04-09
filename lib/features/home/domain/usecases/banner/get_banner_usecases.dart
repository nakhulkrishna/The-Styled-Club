import 'package:clothingstore/features/home/domain/entities/banner/banner_entites.dart';
import 'package:clothingstore/features/home/domain/repositories/banner/banner_repositories.dart';



class GetBannersUseCase {
  final BannerRepositories repository;

  GetBannersUseCase(this.repository);

  Future<List<BannerEntity>> callGetAllMenbanner() {
    return repository.getAllMenBanner();
  }
   Future<List<BannerEntity>> callGetAllWomenbanner() {
    return repository.getAllWomenBanner();
  }
   Future<List<BannerEntity>> callGetAllAdornmentsbanner() {
    return repository.getAllAdornmentBanner();
  }
}
