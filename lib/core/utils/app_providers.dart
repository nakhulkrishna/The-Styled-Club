// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// // Auth
// import 'package:clothingstore/features/authentication/data/datasources/firebase_auth_datasource.dart';
// import 'package:clothingstore/features/authentication/data/repository/auth_repositories_impl.dart';
// import 'package:clothingstore/features/authentication/domain/repositories/auth_repositories.dart';
// import 'package:clothingstore/features/authentication/domain/usecases/sign_in_usecases.dart';
// import 'package:clothingstore/features/authentication/domain/usecases/sign_up_usecases.dart';
// import 'package:clothingstore/features/authentication/presentation/bloc/auth_bloc.dart';

// // Banner
// import 'package:clothingstore/features/home/data/datasources/banner/banner_romote_data_source.dart';
// import 'package:clothingstore/features/home/data/repositories/banner/banner_repositories_impl.dart';
// import 'package:clothingstore/features/home/domain/usecases/banner/get_banner_usecases.dart';
// import 'package:clothingstore/features/home/presentation/bloc/banner/banner_cubit.dart';

// // Categories
// import 'package:clothingstore/features/products/data/data_sources/categories_remote_data_sources.dart';
// import 'package:clothingstore/features/products/data/repositories/categories_repositories_impl.dart';
// import 'package:clothingstore/features/products/domain/usecases/categorie_usecases.dart';
// import 'package:clothingstore/features/products/presentation/bloc/categories/categorie_cubit.dart';

// // Products
// import 'package:clothingstore/features/products/data/data_sources/product_remote_data_sources.dart';
// import 'package:clothingstore/features/products/data/repositories/products_repositories_impl.dart';
// import 'package:clothingstore/features/products/domain/usecases/product_usecases.dart';
// import 'package:clothingstore/features/products/presentation/bloc/product/product_cubit.dart';

// class AppProviders {
//   static List<RepositoryProvider> repositoryProviders = [
//     RepositoryProvider(create: (_) => FirebaseAuthDataSource()),
//     RepositoryProvider<AuthRepository>(
//       create:
//           (context) =>
//               AuthRepositoryImpl(context.read<FirebaseAuthDataSource>()),
//     ),
//     RepositoryProvider(
//       create: (context) => SignInUseCase(context.read<AuthRepository>()),
//     ),
//     RepositoryProvider(
//       create: (context) => SignUpUseCase(context.read<AuthRepository>()),
//     ),
//   ];

//   static List<BlocProvider> blocProviders = [
//     BlocProvider(
//       create:
//           (context) => AuthBloc(
//             signInUseCase: context.read<SignInUseCase>(),
//             signUpUseCase: context.read<SignUpUseCase>(),
//           ),
//     ),
//     BlocProvider(
//       create:
//           (context) => BannerCubit(
//             GetBannersUseCase(
//               BannerRepositoriesImpl(
//                 remoteDataSource: BannerRemoteDataSource(
//                   firestore: FirebaseFirestore.instance,
//                 ),
//               ),
//             ),
//           ),
//     ),
//     BlocProvider(
//       create:
//           (context) => NormalCategorieCubit(
//             CategorieUsecases(
//               CategoriesRepositoriesImpl(
//                 categoriesRemoteDataSources: CategoriesRemoteDataSources(
//                   firestore: FirebaseFirestore.instance,
//                 ),
//               ),
//             ),
//           ),
//     ),
//     BlocProvider(
//       create:
//           (context) => MinimalStyleCategoriesCubit(
//             CategorieUsecases(
//               CategoriesRepositoriesImpl(
//                 categoriesRemoteDataSources: CategoriesRemoteDataSources(
//                   firestore: FirebaseFirestore.instance,
//                 ),
//               ),
//             ),
//           ),
//     ),
//     BlocProvider(
//       create:
//           (context) => SharpDressingStyleCubit(
//             CategorieUsecases(
//               CategoriesRepositoriesImpl(
//                 categoriesRemoteDataSources: CategoriesRemoteDataSources(
//                   firestore: FirebaseFirestore.instance,
//                 ),
//               ),
//             ),
//           ),
//     ),
//     BlocProvider(
//       create:
//           (context) => ProductCubit(
//             ProductUsecases(
//               ProductsRepositoriesImpl(
//                 productRemoteDataSources: ProductRemoteDataSources(
//                   firestore: FirebaseFirestore.instance,
//                 ),
//               ),
//             ),
//           ),
//     ),
//     BlocProvider(
//       create:
//           (context) => TopPickedCubit(
//             ProductUsecases(
//               ProductsRepositoriesImpl(
//                 productRemoteDataSources: ProductRemoteDataSources(
//                   firestore: FirebaseFirestore.instance,
//                 ),
//               ),
//             ),
//           ),
//     ),
//   ];
// }
