void main() {

  Car car = Car(
    'Toyota',
    DateTime(2015, 12, 31)
  );

  NumberPlate numberPlate = NumberPlate(
    '001', DateTime(2024, 12, 31), DateTime.now()
  );

  car.assignNumberPlate(numberPlate);



}



class Car{
  String? model;
  DateTime yearOfManufacture;
  NumberPlate? numberPlate;
  Car(this.model, this.yearOfManufacture);


  bool assignNumberPlate(NumberPlate _numberPlate) {
    numberPlate = _numberPlate;
    return true;
  }
}


class NumberPlate{
  String? plateNumber;
  DateTime? regDate;
  DateTime? expDate;

  NumberPlate(this.plateNumber, this.regDate, this.expDate);


  bool renewNumberPlate(DateTime carAge) {
    if(calculateAge(carAge) < 20 ) {
      DateTime today = DateTime.now();
      expDate =  DateTime(today.year + 3, today.month, today.day);
      return true;
    }
    return false;
  }


  int calculateAge(DateTime birthDate) {
    DateTime today = DateTime.now();

    int age = today.year - birthDate.year;

    if (today.month < birthDate.month ||
      (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }
}