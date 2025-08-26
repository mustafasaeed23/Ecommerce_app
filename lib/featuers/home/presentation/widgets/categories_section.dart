import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/widgets/loading_widget.dart';
import 'package:ecommerce/featuers/home/presentation/cubit/home_cubit.dart';
import 'package:ecommerce/featuers/home/presentation/cubit/home_state.dart';
import 'package:ecommerce/featuers/home/presentation/widgets/category_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          serviceLocator.get<HomeCubit>()..getCategories(context),
      child: SizedBox(
        height: 300.h,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is CategoriesLoading) {
              return LoadingWidget();
            } else if (state is CategoriesLoaded) {
              var categories = state.categories;
              return GridView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                padding: const EdgeInsets.all(10),
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 100.h,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 13,
                  childAspectRatio: 100 / 70,
                ),
                itemBuilder: (context, index) =>
                    CategoryItemWidget(categoryEntity: categories[index]),
              );
            } else if (state is CategoriesError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
