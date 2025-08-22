import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/assets.dart';
import 'package:ecommerce/core/widgets/favourite_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductImageCarousel extends StatefulWidget {
  final List<String> imageUrls;

  const ProductImageCarousel({super.key, required this.imageUrls});

  @override
  _ProductImageCarouselState createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  int _currentIndex = 0; // To track the current carousel image index

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.imageUrls.length,
          itemBuilder: (context, index, realIndex) {
            return Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 300.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(color: AppColors.mainColor, width: 1.w),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image.network(
                      widget.imageUrls[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.0.w,
                    vertical: 12.h,
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: FavouriteIconWidget(),
                  ),
                ),
              ],
            );
          },
          options: CarouselOptions(
            height: 250,
            autoPlay: false,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            viewportFraction: 1, // Makes the images fill the screen
            enableInfiniteScroll: true, // Infinite scrolling
            pauseAutoPlayOnTouch: true, // Pause autoplay on touch
            scrollPhysics: BouncingScrollPhysics(), // Bouncy scrolling
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        SizedBox(height: 8.h),
        // Dots indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imageUrls.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = entry.key;
                });
              },
              child: Container(
                width: _currentIndex == entry.key ? 30.0 : 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  borderRadius: _currentIndex == entry.key
                      ? BorderRadius.circular(30.0)
                      : BorderRadius.circular(8.0),
                  color: _currentIndex == entry.key
                      ? AppColors
                            .mainColor // Active dot color
                      : Colors.grey, // Inactive dot color
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}


