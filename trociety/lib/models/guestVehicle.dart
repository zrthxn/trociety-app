class GuestVehicle {
  final String numberPlate;
  final String ownerName;
  bool isInside;
  final String type;
  final DateTime incoming;
  final DateTime outgoing;

  GuestVehicle(
      {this.ownerName,
      this.numberPlate,
      this.incoming,
      this.outgoing,
      this.isInside,
      this.type});
}
