import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ProductImageSection extends StatelessWidget {
  const ProductImageSection({
    super.key,
    required this.screenHeight,
    required this.imageUrls,
    this.imageScrollController,
  });

  final double screenHeight;
  final List<String> imageUrls;
  final PageController? imageScrollController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.65,
      child: Stack(
        children: [
          SizedBox(height: 10),
          // Image carousel
          PageView.builder(
            itemCount: imageUrls.length,
            controller: imageScrollController,
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl: imageUrls[index],
                fit: BoxFit.cover,
                width: double.infinity,
                height: screenHeight * 0.65,
                errorWidget: (context, url, error) => const Icon(Icons.error),
                placeholder:
                    (context, url) => Center(
                      child: SizedBox(
                        height: screenHeight * 0.03,
                        child: const LoadingIndicator(
                          indicatorType: Indicator.lineSpinFadeLoader,
                          colors: [Colors.white],
                          strokeWidth: 2,
                        ),
                      ),
                    ),
              );
            },
          ),

          // Back button overlay
          Positioned(
            top: 40,
            left: 16,
            child: GestureDetector(
              onTap: () => context.go('/home'),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.5),
                ),
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
