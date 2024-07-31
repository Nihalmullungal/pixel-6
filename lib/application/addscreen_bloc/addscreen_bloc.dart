import 'package:customer_app/application/addscreen_bloc/addscreen_event.dart';
import 'package:customer_app/application/addscreen_bloc/addscreen_state.dart';
import 'package:customer_app/application/homescreen_bloc/homescreen_bloc.dart';
import 'package:customer_app/application/homescreen_bloc/homescreen_event.dart';
import 'package:customer_app/domain/functions/api_functions.dart';
import 'package:customer_app/domain/models/customer_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddScreenBloc extends Bloc<AddScreenEvent, AddScreenState> {
  AddScreenBloc() : super(AddScreenInitialState()) {
    on<AddScreenPinCheckClickedEvent>((event, emit) async {
      await getPost(postcode: pinController.text);
    });
    on<AddScreenSubmitClickedEvent>(
      (event, emit) {
        if (panController.text.isEmpty || panController.text.length != 10) {
          emit(AddScreenPanErrorState());
        } else if (nameController.text.isEmpty ||
            nameController.text.contains(RegExp(r'[0-9]'))) {
          emit(AddScreenNameErrorState());
        } else if (emailController.text.isEmpty ||
            !emailController.text.contains("@")) {
          emit(AddScreenEmailErrorState());
        } else if (mobileController.text.isEmpty ||
            mobileController.text.length != 10) {
          emit(AddScreenMobileErrorState());
        } else if (address1Controller.text.isEmpty) {
          emit(AddScreenAddressErrorState());
        } else if (pinController.text.isEmpty ||
            pinController.text.length != 6) {
          emit(AddScreenPinErrorkState());
        } else {
          final homeContr = BlocProvider.of<HomeScreenBloc>(event.ctx);
          final obj = CustomerModal(
            panNumber: panController.text.trim(),
            fullName: nameController.text.trim(),
            email: emailController.text.trim(),
            mobile: int.parse(mobileController.text),
            address1: address1Controller.text.trim(),
            address2: address2Controller.text.trim(),
            city: cityController.text.trim(),
            pinCode: pinController.text.trim(),
            state: stateController.text.trim(),
          );
          if (customerToEdit == -1) {
            obj.id = customerId;

            homeContr.allCustomer.add(obj);
            homeContr.add(CustomerAddedEvent());
            customerId++;
            clearAllController();
            emit(AddScreenCustomerAddedState());
          } else {
            obj.id = customerToEdit;
            homeContr.allCustomer[homeContr.allCustomer
                .indexWhere((element) => customerToEdit == element.id)] = obj;
            emit(EditCustomerSuccessState());
            homeContr.add(CustomerUpdatedEvent());
            clearAllController();
            customerToEdit = -1;
          }
        }
      },
    );
    on<EditScreenClickedEvent>(
      (event, emit) {
        panController.text = event.customer.panNumber;
        nameController.text = event.customer.fullName;
        emailController.text = event.customer.email;
        mobileController.text = event.customer.mobile.toString();
        address1Controller.text = event.customer.address1;
        event.customer.address2 == null
            ? address2Controller.text = ""
            : address2Controller.text = event.customer.address2.toString();
        pinController.text = event.customer.pinCode;
        cityController.text = event.customer.city;
        stateController.text = event.customer.state;
        customerToEdit = event.customer.id as int;
        BlocProvider.of<HomeScreenBloc>(event.ctx).add(HomeEditClickedEvent());
      },
    );
  }

  TextEditingController panController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController cityController = TextEditingController(text: "pune");
  TextEditingController stateController =
      TextEditingController(text: "maharashtra");
  int customerId = 0;
  int customerToEdit = -1;
  void clearAllController() {
    panController.clear();
    nameController.clear();
    emailController.clear();
    mobileController.clear();
    address1Controller.clear();
    address2Controller.clear();
    pinController.clear();
  }
}
