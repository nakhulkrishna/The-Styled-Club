import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
      height: screenHeight * 0.55,
      child: Column(
        children: [
          Spacer(),
          Container(
            height: screenHeight * 0.5,
            color: Colors.blueGrey,

            child: PageView.builder(
              itemCount: imageUrls.length,
              controller: imageScrollController,
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  imageUrl: imageUrls[index],
                  fit: BoxFit.cover, // Ensure the image covers the container
                  width: double.infinity, // Take up full width
                  height: screenHeight * 0.5, // Take up desired height
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  placeholder:
                      (context, url) => Center(
                        child: SizedBox(
                          height: screenHeight * 0.03,
                          child: LoadingIndicator(
                            indicatorType: Indicator.lineSpinFadeLoader,
                            colors: const [Colors.white],
                            strokeWidth: 2,
                          ),
                        ),
                      ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
