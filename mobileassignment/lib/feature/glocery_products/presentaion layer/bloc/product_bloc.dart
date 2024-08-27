// lib/feature/glocery_products/presentation/bloc/grocery_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:mobileassignment/feature/glocery_products/domain/usecases/get_all_gloceries.dart';
import 'package:mobileassignment/feature/glocery_products/domain/usecases/get_glocery_byid.dart';
import 'package:mobileassignment/feature/glocery_products/presentaion%20layer/bloc/product_event.dart';
import 'package:mobileassignment/feature/glocery_products/presentaion%20layer/bloc/product_state.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  final GetAllProductsusecase getAllProductsusecase;
  final GetProductByIdusecase getProductById;

  GroceryBloc({
    required this.getAllProductsusecase,
    required this.getProductById,
  }) : super(GroceryInitialState()) {
    on<LoadAllGroceriesEvent>(_onLoadAllGroceriesEvent);
    on<LoadGroceryByIdEvent>(_onLoadGroceryByIdEvent);
  }

  Future<void> _onLoadAllGroceriesEvent(LoadAllGroceriesEvent event, Emitter<GroceryState> emit) async {
    emit(GroceryLoadingState());
    final result = await getAllProductsusecase.getAllProducts();
    result.fold(
      (failure) => emit(GroceryErrorState(failure)),
      (products) => emit(GroceryLoadedState(products)),
    );
  }

  Future<void> _onLoadGroceryByIdEvent(LoadGroceryByIdEvent event, Emitter<GroceryState> emit) async {
    emit(GroceryLoadingState());
    final result = await getProductById.getProductById(event.id);
    result.fold(
      (failure) => emit(GroceryErrorState(failure)),
      (product) => emit(GroceryByIdLoadedState(product)),
    );
  }
}
