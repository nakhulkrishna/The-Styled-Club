import 'package:clothingstore/features/home/data/datasources/banner/banner_romote_data_source.dart';
import 'package:clothingstore/features/home/domain/entities/banner/banner_entites.dart';
import 'package:clothingstore/features/home/domain/repositories/banner/banner_repositories.dart';

class BannerRepositoriesImpl implements BannerRepositories {
  final BannerRemoteDataSource remoteDataSource;

  BannerRepositoriesImpl({required this.remoteDataSource});

  @override
  Future<List<BannerEntity>> getAllMenBanner()async {
        final modelList = await remoteDataSource.fecthManBanners();
    return modelList.map((e) => e.toEntity()).toList(); 
  }

   @override
     Future<List<BannerEntity>> getAllWomenBanner() async {
    final modelList = await remoteDataSource.fetchWomenBanners();
    return modelList.map((e) => e.toEntity()).toList();
  }
   Future<List<BannerEntity>> getAllAdornmentBanner() async {
    final modelList = await remoteDataSource.fecthAdornmentBanners();
    return modelList.map((e) => e.toEntity()).toList();
  }
  
 
}
