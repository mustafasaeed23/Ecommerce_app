import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/theme/assets.dart';
import 'package:ecommerce/core/widgets/loading_widget.dart';
import 'package:ecommerce/featuers/home/presentation/cubit/home_cubit.dart';
import 'package:ecommerce/featuers/home/presentation/cubit/home_state.dart';
import 'package:ecommerce/featuers/home/presentation/widgets/brand_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsSection extends StatelessWidget {
  const BrandsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator.get<HomeCubit>()..getBrands(),
      child: SizedBox(
        height: 300.h,
        child: BlocBuilder<HomeCubit, HomeState>(
         
          builder: (context, state) {
            if (state is BrandsLoading) {
              return LoadingWidget();
            } else if (state is BrandsLoaded) {
              var brands = state.brands;
              return GridView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                padding: const EdgeInsets.all(10),
                itemCount: brands.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 100.h,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 100 / 144,
                ),
                itemBuilder: (context, index) =>
                    BrandItemWidget(brandEntity: brands[index]),
              );
            } else if (state is BrandsError) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: Text("Error"));
            }
          },
        ),
      ),
    );
  }
}
