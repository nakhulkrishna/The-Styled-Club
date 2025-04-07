import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/features/data/repositories/CategoriesRepository/categories_repository.dart';
import 'package:clothingstore/features/data/repositories/bannerRepositorys/banners_repositorys.dart';
import 'package:clothingstore/features/data/repositories/user_registeration/user_registration.dart';
import 'package:clothingstore/features/presentation/logic/address_cubit/address_bloc.dart';
import 'package:clothingstore/features/presentation/logic/authentication/auth_bloc.dart';
import 'package:clothingstore/features/presentation/logic/banner/banner_bloc.dart';
import 'package:clothingstore/features/presentation/logic/products/bloc/products_bloc.dart';
import 'package:clothingstore/features/presentation/logic/user_profile/user_profile_bloc.dart';
import 'package:clothingstore/features/presentation/logic/categories/categories_bloc.dart';
import 'package:clothingstore/features/presentation/logic/focusNode/focus_node.dart';
import 'package:clothingstore/features/presentation/logic/indicators/carousel_indicator_cubit.dart';
import 'package:clothingstore/features/presentation/logic/radio_button/radio_button.dart';
import 'package:clothingstore/features/presentation/pages/splash/splash_page.dart';
import 'package:clothingstore/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io'; // For platform detection

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    // Set global scroll physics based on platform
    return Platform.isIOS ? BouncingScrollPhysics() : ClampingScrollPhysics();
  }

  @override
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserProfileBloc(UserRegistration())),
        BlocProvider(create: (context) => AddressBloc()),
        BlocProvider(create: (context) => ProductBloc()),
        BlocProvider(create: (context) => RadioButtonCubit()),
        BlocProvider(create: (context) => AuthBloc(UserRegistration())),
        BlocProvider(create: (context) => CarouselIndicatorCubit()),
        BlocProvider(create: (context) => FocusCubit(), child: Container()),
        BlocProvider(
          create: (context) => CategoriesBloc(CategoriesRepository()),
        ),
        BlocProvider(
          create:
              (context) => BannerBloc(bannersRepository: BannersRepositorys()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          snackBarTheme: SnackBarThemeData(
            backgroundColor: GColors.darkergray, // Background color of SnackBar
            contentTextStyle: GoogleFonts.poppins(
              color: GColors.textWhite,
              fontSize: 14,
            ),
            behavior:
                SnackBarBehavior.floating, // Optional: floating SnackBar style
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ), // Shape and border radius
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
          ),

          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
          ),
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),

        // Apply custom scroll behavior globally
        home: SplashPage(),
      ),
    );
  }
}
