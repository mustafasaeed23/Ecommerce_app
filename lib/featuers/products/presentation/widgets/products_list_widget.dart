import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/widgets/loading_widget.dart';
import 'package:ecommerce/featuers/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce/featuers/products/presentation/cubit/products_cubit.dart';
import 'package:ecommerce/featuers/products/presentation/cubit/products_state.dart';
import 'package:ecommerce/featuers/products/presentation/widgets/product_item_widget.dart';
import 'package:ecommerce/featuers/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              serviceLocator.get<ProductsCubit>()..getProducts(),
        ),
        BlocProvider(create: (context) => serviceLocator.get<CartCubit>()),
        BlocProvider(create: (context) => serviceLocator.get<WishlistCubit>()),
      ],
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return LoadingWidget();
          } else if (state is ProductsSuccess) {
            var products = state.products;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 100 / 135,
              ),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.productDetailsScreen,
                      arguments: state.products[index],
                    );
                  },
                  child: ProductItemWidget(productEntity: products[index]),
                );
              },
              itemCount: products.length,
            );
          } else if (state is ProductsError) {
            return ErrorWidget(state.message);
          } else {
            return Center(child: Text("error"));
          }
        },
      ),
    );
  }
}
