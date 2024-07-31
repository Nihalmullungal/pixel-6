import 'package:customer_app/domain/models/customer_modal.dart';
import 'package:flutter/material.dart';

abstract class AddScreenEvent {}

class AddScreenPinCheckClickedEvent extends AddScreenEvent {}

class AddScreenSubmitClickedEvent extends AddScreenEvent {
  AddScreenSubmitClickedEvent({required this.ctx});
  final BuildContext ctx;
}

class EditScreenClickedEvent extends AddScreenEvent {
  final CustomerModal customer;
  final BuildContext ctx;
  EditScreenClickedEvent({required this.customer, required this.ctx});
}
