import 'package:clothingstore/core/constants/colors.dart';

import 'package:clothingstore/features/home/presentation/pages/adornments_tab_screen/adornments_tab_screen.dart';
import 'package:clothingstore/features/home/presentation/pages/cart_screen/cart_page.dart';
import 'package:clothingstore/features/home/presentation/pages/men_tab_screen/man_tab_screen.dart';
import 'package:clothingstore/features/home/presentation/pages/search_screen/search_screen.dart';
import 'package:clothingstore/features/home/presentation/pages/women_tab_screen/women_tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
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
              physics:BouncingScrollPhysics().applyTo(ClampingScrollPhysics()),
              child: MenTabScreen(),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics().applyTo(ClampingScrollPhysics()),
              child: WomenTabScreen(),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics().applyTo(ClampingScrollPhysics()),
              child: AdornmentsTabScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
