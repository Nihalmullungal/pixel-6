import 'dart:async';
import 'package:customer_app/application/homescreen_bloc/homescreen_event.dart';
import 'package:customer_app/application/homescreen_bloc/homescreen_state.dart';
import 'package:customer_app/domain/models/customer_modal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitialState()) {
    on<SplashScreenStartedevent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 4), () {
        emit(SplashScreenFInishedState());
      });
    });
    on<CustomerAddedEvent>(
      (event, emit) {
        emit(CustomerAddedState());
      },
    );
    on<HomeScreenDeleteClickedEvent>(
      (event, emit) {
        allCustomer.remove(event.customer);
        emit(HomeScreenDeleteDoneState());
      },
    );
    on<HomeEditClickedEvent>(
      (event, emit) {
        emit(HomeEditClickedState());
      },
    );
    on<CustomerUpdatedEvent>(
      (event, emit) {
        emit(CustomerUpdatedState());
      },
    );
  }
  List<CustomerModal> allCustomer = [];
}
