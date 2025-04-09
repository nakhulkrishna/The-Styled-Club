import 'package:clothingstore/core/utils/bottombar.dart';
import 'package:clothingstore/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:clothingstore/features/authentication/presentation/pages/user_registration_page.dart';
import 'package:clothingstore/features/authentication/presentation/pages/user_sign_in_page.dart';
import 'package:clothingstore/features/home/presentation/pages/home_screen.dart';
import 'package:clothingstore/common/widgets/wrapper.dart';
import 'package:clothingstore/features/home/presentation/widgets/sharp_dressing_list.dart';
import 'package:clothingstore/features/products/data/data_sources/product_remote_data_sources.dart';
import 'package:clothingstore/features/products/data/models/products_model/product_model.dart';
import 'package:clothingstore/features/products/data/repositories/products_repositories_impl.dart';
import 'package:clothingstore/features/products/domain/entites/product_entity.dart';
import 'package:clothingstore/features/products/domain/repositories/product_repositories.dart';
import 'package:clothingstore/features/products/domain/usecases/product_usecases.dart';
import 'package:clothingstore/features/products/presentation/bloc/product/product_cubit.dart';
import 'package:clothingstore/features/products/presentation/pages/categoriesed_products/pages/categoried_products_list.dart';
import 'package:clothingstore/features/products/presentation/pages/minimal_style_products/minimal_style_products_list.dart';
import 'package:clothingstore/features/products/presentation/pages/shapr_dressing_products/pages/sharp_dressing_products_list.dart';
import 'package:clothingstore/features/products/presentation/pages/single_product/single_product_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/initialRoute',
  routes: [
    GoRoute(
      path: '/initialRoute',
      builder:
          (context, state) => BlocProvider(
            create:
                (context) => AuthBloc(
                  signInUseCase: context.read(),
                  signUpUseCase: context.read(),
                ),
            child: Wrapper(),
          ),
    ),
    GoRoute(
      path: '/signup',
      builder:
          (context, state) => BlocProvider(
            create:
                (context) => AuthBloc(
                  signInUseCase: context.read(),
                  signUpUseCase: context.read(),
                ),
            child: UserRegistrationPage(),
          ),
    ),
    GoRoute(
      path: '/signin',
      builder:
          (context, state) => BlocProvider(
            create:
                (context) => AuthBloc(
                  signInUseCase: context.read(),
                  signUpUseCase: context.read(),
                ),
            child: UserSignInPage(),
          ),
    ),
    GoRoute(
      path: '/category/:categoryId/:itemCategory',
      name: 'categoryProducts',
      pageBuilder: (context, state) {
        final categoryId = state.pathParameters['categoryId']!;
        final itemCategory = state.pathParameters['itemCategory']!;

        return MaterialPage(
          child: BlocProvider(
            create:
                (context) => CategoryBasedCubit(
                  ProductUsecases(
                    ProductsRepositoriesImpl(
                      productRemoteDataSources: ProductRemoteDataSources(
                        firestore: FirebaseFirestore.instance,
                      ),
                    ),
                  ),
                )..fetchCategoryBasedProducts(categoryId, itemCategory),
            child: CategoriedProductsList(
              categoryId: categoryId,
              itemCategory: itemCategory,
            ),
          ),
        );
      },
    ),
    GoRoute(
      path: '/SharpDressing/:categoryId/:itemCategory',
      name: 'SharpDressingProducts',
      pageBuilder: (context, state) {
        final categoryId = state.pathParameters['categoryId']!;
        final itemCategory = state.pathParameters['itemCategory']!;

        return MaterialPage(
          child: BlocProvider(
            create:
                (context) => SharpDressingCategoryBasedCubit(
                  ProductUsecases(
                    ProductsRepositoriesImpl(
                      productRemoteDataSources: ProductRemoteDataSources(
                        firestore: FirebaseFirestore.instance,
                      ),
                    ),
                  ),
                )..fetchSharpDressingCategoryBasedProducts(categoryId, itemCategory),
            child: SharpDressingProductsList(
              categoryid: categoryId,
              itemCategory: itemCategory,
            ),
          ),
        );
      },
    ),
GoRoute(
      path: '/Minimalcategory/:categoryId/:itemCategory',
      name: 'MinimalcategoryProducts',
      pageBuilder: (context, state) {
        final categoryId = state.pathParameters['categoryId']!;
        final itemCategory = state.pathParameters['itemCategory']!;

        return MaterialPage(
          child: BlocProvider(
            create:
                (context) => MinimalCategoryBasedCubit(
                  ProductUsecases(
                    ProductsRepositoriesImpl(
                      productRemoteDataSources: ProductRemoteDataSources(
                        firestore: FirebaseFirestore.instance,
                      ),
                    ),
                  ),
                )..fetchMinimalCategoryBasedProducts(categoryId, itemCategory),
            child: MinimalStyleProductsList(
              categoryId: categoryId,
              itemCategory: itemCategory,
            ),
          ),
        );
      },
    ),

    GoRoute(
      path: '/singleProducts',
      name: 'singleProducts',
      builder: (context, state) {
        final product = state.extra as ProductEntity;
        return SingleProductsScreen(productModel: product);
      },
    ),

    GoRoute(path: '/home', builder: (context, state) => const BottomNavBar()),
  ],
);
