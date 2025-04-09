import 'dart:developer';

import 'package:clothingstore/features/profile/presentation/pages/addresPages/pages/addres_list_page.dart';
import 'package:clothingstore/features/profile/presentation/widgets/profile_section.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/features/data/repositories/user_registeration/user_registration.dart';

import 'package:clothingstore/features/order/presentation/pages/orders_page.dart';

import 'package:clothingstore/features/profile/presentation/pages/profile_add_update/pages/profile_data_pages.dart';
import 'package:shimmer/shimmer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth user = FirebaseAuth.instance;

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    List<String> profileItems = [
      'Profile',
      'MY Orders',
      'Address Book',
      'Gitf Vouchers',
    ];
    final UserRegistration userRegistration = UserRegistration();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: Text("MY ACCOUNT", style: GoogleFonts.poppins(fontSize: 14)),
      ),

      body: Column(
        children: [
          Divider(color: GColors.gery),
          ProfileSection(
            phone: "",
            userName: "",
            screenWidth: screenWidth,
            screenHeight: screenHeight,
          ),
          Divider(color: GColors.buttonPrimary),

          Expanded(
            child: ListView.builder(
              itemCount: profileItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      // log("${user.currentUser!.uid} heyy not get ");

                      // context.read<UserProfileBloc>().add(
                      //   FetchUserProfileEvent(user.currentUser!.uid),
                      // );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileDataPages(),
                        ),
                      );
                    } else if (index == 1) {
                      // Navigate to My Orders Screen

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OrdersPage(),
                        ),
                      );
                    } else if (index == 2) {
                      
                      // Navigate to Address Book Screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddresListPage(),
                        ),
                      );
                    } else if (index == 3) {
                      // Navigate to Gift Vouchers Screen
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const GiftVouchersScreen(),
                      //   ),
                      // );
                    }
                  },
                  child: Container(
                    height: screenHeight * .072,
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: GColors.gery)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * .04,
                      ),
                      child: Row(
                        children: [
                          Text(
                            profileItems[index],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          Icon(Iconsax.arrow_right_3),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * .04),
            child: SizedBox(
              width: screenWidth,
              height: screenHeight * .065,
              child: ElevatedButton(
                onPressed: () {
                  userRegistration.logout();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: GColors.error,
                  foregroundColor: GColors.light,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text("Log out"),
              ),
            ),
          ),
          SizedBox(height: screenHeight * .01),
        ],
      ),
    );
  }
}

