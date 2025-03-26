import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/features/presentation/logic/indicators/adornments_new_arrivels.dart';
import 'package:clothingstore/features/presentation/logic/indicators/adornments_poppular.dart';
import 'package:clothingstore/features/presentation/logic/indicators/men_minimal_style_dot_indicator.dart';
import 'package:clothingstore/features/presentation/logic/indicators/men_new_arrivels_dot_indicator.dart';
import 'package:clothingstore/features/presentation/logic/indicators/women_minimal_styel_dot_indicator.dart';
import 'package:clothingstore/features/presentation/logic/indicators/women_new_arrivels_dot_indicator.dart';
import 'package:clothingstore/features/presentation/pages/cart/cart_page.dart';
import 'package:clothingstore/features/presentation/pages/home/search_screen/search_page.dart';
import 'package:clothingstore/features/presentation/pages/home/tabs/adornments_tab_screen.dart';
import 'package:clothingstore/features/presentation/pages/home/tabs/men_tab_screen.dart';
import 'package:clothingstore/features/presentation/pages/home/tabs/women_tab_screen.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController newArrivelsscrollController = ScrollController();
    final ScrollController minimalStylecrollController = ScrollController();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  MenNewArrivelsDotIndicator(newArrivelsscrollController),
        ),
        BlocProvider(
          create:
              (context) =>
                  MenMinimalStyleDotIndicator(minimalStylecrollController),
        ),
        BlocProvider(
          create:
              (context) =>
                  WomenNewArrivelsDotIndicator(newArrivelsscrollController),
        ),
        BlocProvider(
          create:
              (context) =>
                  WomenMinimalStyelDotIndicator(minimalStylecrollController),
        ),
        BlocProvider(
          create:
              (context) => AdornmentsNewArrivels(newArrivelsscrollController),
        ),
        BlocProvider(
          create: (context) => AdornmentsPoppular(minimalStylecrollController),
        ),
      ],

      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => SearchPage()),
                  );
                },
                icon: Icon(Iconsax.search_normal_1),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
                icon: Icon(Iconsax.bag),
              ),
            ],
            centerTitle: true,
            title: Image.asset("assets/images/logo.png", height: 60),
            leading: IconButton(onPressed: () {}, icon: Icon(Iconsax.menu)),
            bottom: TabBar(
              isScrollable: false,

              enableFeedback: false,
              overlayColor: WidgetStatePropertyAll(Colors.transparent),
              dividerColor: Colors.transparent,
              labelStyle: GoogleFonts.poppins(color: GColors.black),
              unselectedLabelStyle: GoogleFonts.poppins(color: GColors.black),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: GColors.buttonPrimary,
              tabs: [
                Tab(text: "MEN"),
                Tab(text: "WOMEN"),
                Tab(text: "ADORNMENT"),
              ],
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics().applyTo(
                  ClampingScrollPhysics(),
                ),
                child: MenTabScreen(
                  newArrivelsSrollController: newArrivelsscrollController,
                  minimalStyleSrollController: minimalStylecrollController,
                ),
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics().applyTo(
                  ClampingScrollPhysics(),
                ),
                child: WomenTabScreen(
                  newArrivelsSrollController: newArrivelsscrollController,
                  minimalStyleSrollController: minimalStylecrollController,
                ),
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics().applyTo(
                  ClampingScrollPhysics(),
                ),
                child: AdornmentsTabScreen(
                  newArrivelsSrollController: newArrivelsscrollController,
                  minimalStyleSrollController: minimalStylecrollController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
