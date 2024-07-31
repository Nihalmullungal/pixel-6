import 'package:customer_app/domain/models/customer_modal.dart';

abstract class HomeScreenEvent {}

class SplashScreenStartedevent extends HomeScreenEvent {}

class CustomerAddedEvent extends HomeScreenEvent {}

class HomeScreenDeleteClickedEvent extends HomeScreenEvent {
  final CustomerModal customer;

  HomeScreenDeleteClickedEvent({required this.customer});
}

class HomeEditClickedEvent extends HomeScreenEvent {}

class CustomerUpdatedEvent extends HomeScreenEvent {}
