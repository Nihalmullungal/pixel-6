class CustomerModal {
  final String panNumber;
  final String fullName;
  final String email;
  final int mobile;
  final String address1;
  final String? address2;
  final String pinCode;
  final String city;
  final String state;
  int? id;

  CustomerModal(
      {this.id,
      required this.panNumber,
      required this.fullName,
      required this.email,
      required this.mobile,
      required this.address1,
      this.address2,
      required this.pinCode,
      required this.city,
      required this.state});
}
