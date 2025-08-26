import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/cubit/search_cubit.dart';
import 'package:ecommerce/featuers/home/domain/usecases/brands_use_case.dart';
import 'package:ecommerce/featuers/home/domain/usecases/categories_use_case.dart';
import 'package:ecommerce/featuers/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.brandsUseCase, this.categoriesUseCase) : super(HomeInitial());

  final CategoriesUseCase categoriesUseCase;
  final BrandsUseCase brandsUseCase;

  Future<void> getCategories(BuildContext context) async {
    emit(CategoriesLoading());
    final result = await categoriesUseCase.getCategories();
    result.fold(
      (failure) {
        emit(CategoriesError(failure.message));
        print("error ${failure.message}");
      },
      (categories) {
        emit(CategoriesLoaded(categories));
        final searchCubit = context.read<SearchCubit>();
        final names = categories.map((e) => e.name).toList();
        searchCubit.setItems(names);
      },
    );
  }

  Future<void> getBrands() async {
    emit(BrandsLoading());
    final result = await brandsUseCase.getBrands();
    result.fold(
      (failure) => emit(BrandsError(failure.message)),
      (brands) => emit(BrandsLoaded(brands)),
    );
  }
}
