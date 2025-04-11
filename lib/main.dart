// Platform detection
import 'package:clothingstore/common/bloc/products_size_cubit.dart';
import 'package:clothingstore/core/router/go_route.dart';
import 'package:clothingstore/features/cart/data/datasource/cart_remote_data_source.dart';
import 'package:clothingstore/features/cart/data/repository/cart_repository_impl.dart';
import 'package:clothingstore/features/cart/domain/repositories/cart_repository.dart';
import 'package:clothingstore/features/cart/domain/usecases/cart_usecases.dart';
import 'package:clothingstore/features/cart/presentation/bloc/cubit/cart_cubit.dart';

import 'package:clothingstore/features/home/data/datasources/banner/banner_romote_data_source.dart';
import 'package:clothingstore/features/home/data/repositories/banner/banner_repositories_impl.dart';
import 'package:clothingstore/features/home/domain/usecases/banner/get_banner_usecases.dart';
import 'package:clothingstore/features/home/presentation/bloc/banner/banner_cubit.dart';
import 'package:clothingstore/features/order/data/data_sources/order_remote_data_source.dart';
import 'package:clothingstore/features/order/data/repositories/order_repository_impl.dart';
import 'package:clothingstore/features/order/domain/repositories/order_repository.dart';
import 'package:clothingstore/features/order/presentation/bloc/cubit/order_cubit.dart';
import 'package:clothingstore/features/products/data/data_sources/categories_remote_data_sources.dart';
import 'package:clothingstore/features/products/data/data_sources/product_remote_data_sources.dart';
import 'package:clothingstore/features/products/data/repositories/categories_repositories_impl.dart';
import 'package:clothingstore/features/products/data/repositories/products_repositories_impl.dart';
import 'package:clothingstore/features/products/domain/usecases/categorie_usecases.dart';
import 'package:clothingstore/features/products/domain/usecases/product_usecases.dart';
import 'package:clothingstore/features/products/presentation/bloc/categories/categorie_cubit.dart';
import 'package:clothingstore/features/products/presentation/bloc/product/product_cubit.dart';
import 'package:clothingstore/features/profile/data/datasource/delivery_address_remote_source.dart';
import 'package:clothingstore/features/profile/data/repositories/delivery_addresss_repository_impl.dart';
import 'package:clothingstore/features/profile/domain/repositories/delivery_repository.dart';
import 'package:clothingstore/features/profile/domain/usecases/delivery_usecases.dart';
import 'package:clothingstore/features/profile/presentation/bloc/cubit/address_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

// Core
import 'firebase_options.dart';
import 'package:clothingstore/core/constants/colors.dart';

// Auth Features
import 'package:clothingstore/features/authentication/data/datasources/firebase_auth_datasource.dart';
import 'package:clothingstore/features/authentication/data/repository/auth_repositories_impl.dart';
import 'package:clothingstore/features/authentication/domain/repositories/auth_repositories.dart';
import 'package:clothingstore/features/authentication/domain/usecases/sign_in_usecases.dart';
import 'package:clothingstore/features/authentication/domain/usecases/sign_up_usecases.dart';
import 'package:clothingstore/features/authentication/presentation/bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return BouncingScrollPhysics().applyTo(ClampingScrollPhysics());
  }

  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => FirebaseAuthDataSource()),
        RepositoryProvider<AuthRepository>(
          create:
              (context) =>
                  AuthRepositoryImpl(context.read<FirebaseAuthDataSource>()),
        ),
        RepositoryProvider(
          create: (context) => SignInUseCase(context.read<AuthRepository>()),
        ),
        RepositoryProvider(
          create: (context) => SignUpUseCase(context.read<AuthRepository>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SizeSelectionCubit(),
            child: Container(),
          ),
          BlocProvider(
            create: (context) => QuantitySelectionCubit(),
            child: Container(),
          ),

          BlocProvider(
            create:
                (context) => AuthBloc(
                  signInUseCase: context.read<SignInUseCase>(),
                  signUpUseCase: context.read<SignUpUseCase>(),
                ),
          ),
          BlocProvider(
            create:
                (context) => MenBannerCubit(
                  GetBannersUseCase(
                    BannerRepositoriesImpl(
                      remoteDataSource: BannerRemoteDataSource(
                        firestore: FirebaseFirestore.instance,
                      ),
                    ),
                  ),
                ),
          ),
          BlocProvider(
            create:
                (context) => WomenBannerCubit(
                  GetBannersUseCase(
                    BannerRepositoriesImpl(
                      remoteDataSource: BannerRemoteDataSource(
                        firestore: FirebaseFirestore.instance,
                      ),
                    ),
                  ),
                ),
          ),
          BlocProvider(
            create:
                (context) => AdornmentsBannerCubit(
                  GetBannersUseCase(
                    BannerRepositoriesImpl(
                      remoteDataSource: BannerRemoteDataSource(
                        firestore: FirebaseFirestore.instance,
                      ),
                    ),
                  ),
                ),
          ),
          BlocProvider(
            create:
                (context) => CartCubit(
                  CartUsecases(
                    cartRepository: CartRepositoryImpl(
                      dataSource: CartRemoteDataSource(),
                    ),
                  ),
                ),
          ),
          BlocProvider(
            create:
                (context) => FetchCartItemsCubit(
                  CartUsecases(
                    cartRepository: CartRepositoryImpl(
                      dataSource: CartRemoteDataSource(),
                    ),
                  ),
                ),
          ),
          BlocProvider(
            create:
                (context) => NormalCategorieCubit(
                  CategorieUsecases(
                    CategoriesRepositoriesImpl(
                      categoriesRemoteDataSources: CategoriesRemoteDataSources(
                        firestore: FirebaseFirestore.instance,
                      ),
                    ),
                  ),
                ),
          ),
          BlocProvider(
            create:
                (context) => DeliveryCubit(
                  DeliveryUsecases(
                    repository: DeliveryAddresssRepositoryImpl(
                      deliveryAddressRemoteSource:
                          DeliveryAddressRemoteSource(),
                    ),
                  ),
                ),
          ),
          BlocProvider(
            create:
                (context) => MinimalStyleCategoriesCubit(
                  CategorieUsecases(
                    CategoriesRepositoriesImpl(
                      categoriesRemoteDataSources: CategoriesRemoteDataSources(
                        firestore: FirebaseFirestore.instance,
                      ),
                    ),
                  ),
                ),
          ),
          BlocProvider(create: (context) => AddressTypeCubit()),
          BlocProvider(
            create:
                (context) => SharpDressingStyleCubit(
                  CategorieUsecases(
                    CategoriesRepositoriesImpl(
                      categoriesRemoteDataSources: CategoriesRemoteDataSources(
                        firestore: FirebaseFirestore.instance,
                      ),
                    ),
                  ),
                ),
          ),
          BlocProvider(
            create:
                (context) => WomenNormalCategorieCubit(
                  CategorieUsecases(
                    CategoriesRepositoriesImpl(
                      categoriesRemoteDataSources: CategoriesRemoteDataSources(
                        firestore: FirebaseFirestore.instance,
                      ),
                    ),
                  ),
                ),
          ),
          BlocProvider(
            create:
                (context) => WomenMinimalStyleCategoriesCubit(
                  CategorieUsecases(
                    CategoriesRepositoriesImpl(
                      categoriesRemoteDataSources: CategoriesRemoteDataSources(
                        firestore: FirebaseFirestore.instance,
                      ),
                    ),
                  ),
                ),
          ),
          BlocProvider(
            create:
                (context) => WomenSharpDressingStyleCubit(
                  CategorieUsecases(
                    CategoriesRepositoriesImpl(
                      categoriesRemoteDataSources: CategoriesRemoteDataSources(
                        firestore: FirebaseFirestore.instance,
                      ),
                    ),
                  ),
                ),
          ),
          BlocProvider(
            create:
                (context) => ProductCubit(
                  ProductUsecases(
                    ProductsRepositoriesImpl(
                      productRemoteDataSources: ProductRemoteDataSources(
                        firestore: FirebaseFirestore.instance,
                      ),
                    ),
                  ),
                ),
          ),
          BlocProvider(
            create:
                (context) => WomenTopPickedCubit(
                  ProductUsecases(
                    ProductsRepositoriesImpl(
                      productRemoteDataSources: ProductRemoteDataSources(
                        firestore: FirebaseFirestore.instance,
                      ),
                    ),
                  ),
                ),
          ),
          BlocProvider(
            create:
                (context) => TopPickedCubit(
                  ProductUsecases(
                    ProductsRepositoriesImpl(
                      productRemoteDataSources: ProductRemoteDataSources(
                        firestore: FirebaseFirestore.instance,
                      ),
                    ),
                  ),
                ),
          ),
          BlocProvider(
            create:
                (context) => CategoryBasedCubit(
                  ProductUsecases(
                    ProductsRepositoriesImpl(
                      productRemoteDataSources: ProductRemoteDataSources(
                        firestore: FirebaseFirestore.instance,
                      ),
                    ),
                  ),
                ),
          ),
          BlocProvider(
            create:
                (context) => MinimalCategoryBasedCubit(
                  ProductUsecases(
                    ProductsRepositoriesImpl(
                      productRemoteDataSources: ProductRemoteDataSources(
                        firestore: FirebaseFirestore.instance,
                      ),
                    ),
                  ),
                ),
          ),
          BlocProvider(
            create:
                (context) => SearchCubit(
                  ProductUsecases(
                    ProductsRepositoriesImpl(
                      productRemoteDataSources: ProductRemoteDataSources(
                        firestore: FirebaseFirestore.instance,
                      ),
                    ),
                  ),
                ),
          ),
          BlocProvider(
            create:
                (context) => OrderCubit(
                  orderRepository: OrderRepositoryImpl(
                    orderRemoteDataSource: OrderRemoteDataSource(),
                  ),
                ),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Clothing Store',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.white,
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.transparent,
            ),
            snackBarTheme: SnackBarThemeData(
              backgroundColor: GColors.darkergray,
              contentTextStyle: GoogleFonts.poppins(
                color: GColors.textWhite,
                fontSize: 14,
              ),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: CustomScrollBehavior(),
              child: child!,
            );
          },
          routerConfig: appRouter,
        ),
      ),
    );
  }
}
