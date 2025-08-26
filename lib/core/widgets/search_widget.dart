import 'package:ecommerce/core/cubit/search_cubit.dart';
import 'package:ecommerce/core/cubit/search_state.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/theme/assets.dart';
import 'package:ecommerce/core/theme/fonts_style.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchWidget extends StatelessWidget {
  final String hintText;
  final bool readOnly;

  const SearchWidget({
    super.key,
    this.hintText = "What do you search for?",
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Search Bar + Cart Icon
        Row(
          children: [
            Expanded(
              flex: 9,
              child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  border: Border.all(color: AppColors.mainColor, width: 1.w),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    children: [
                      SvgPicture.asset(Assets.searchIcon),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: TextField(
                          readOnly: readOnly,
                          onChanged: (value) {
                            context.read<SearchCubit>().search(value);
                          },
                          style: FontsStyle.regular.copyWith(
                            fontSize: 14.r,
                            color: AppColors.mainColor,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: hintText,
                            hintStyle: FontsStyle.regular.copyWith(
                              fontSize: 14.r,
                              color: AppColors.mainColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, Routes.cartScreen),
                child: SvgPicture.asset(Assets.cartIcon),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),

        /// Search Results
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.errorMessage != null) {
              return Center(
                child: Text(
                  state.errorMessage!,
                  style: FontsStyle.regular.copyWith(color: Colors.red),
                ),
              );
            }

            if (state.hasSearched && state.searchResults.isEmpty) {
              return const Center(child: Text("No results found"));
            }

            if (!state.hasSearched) {
              return const SizedBox.shrink();
            }

            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.searchResults.length,
              separatorBuilder: (_, __) =>
                  Divider(color: AppColors.mainColor.withOpacity(0.3)),
              itemBuilder: (context, index) {
                final item = state.searchResults[index];
                return ListTile(
                  title: Text(
                    item,
                    style: FontsStyle.regular.copyWith(
                      fontSize: 14.r,
                      color: AppColors.mainColor,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
