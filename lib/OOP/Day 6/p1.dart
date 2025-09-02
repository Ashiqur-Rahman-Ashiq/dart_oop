/*
The vehicle rental company rents out Cars, Bikes, and Trucks.
All vehicles share some common characteristics: Brand, Model and Year of Manufacture.

Base rental prices per day:
- Cars: $50 per day
- Bikes: $15 per day
- Trucks: $100 per day

Rental calculation rules:
- Cars: If a car is older than 5 years, a 10% discount is applied to the base rental price.
- Bikes: A 15% discount is applied to the total rental cost if the rental period is more than 7 days.
- Trucks: Trucks have an additional fee of $100 per day due to higher maintenance costs.
*/

class Vehicle {
  String? brand;
  String? model;
  int? yearOfManufacture;
  double? basePrice;

  Vehicle({
    required this.brand,
    required this.model,
    required this.yearOfManufacture,
    required this.basePrice,
  });


  double calculateTotalRent(int days) {
    return basePrice! * days;
  }
}

class Car extends Vehicle {
  Car({
    required String brand,
    required String model,
    required int yearOfManufacture,
  }) : super(
    brand: brand,
    model: model,
    yearOfManufacture: yearOfManufacture,
    basePrice: 50,
  );

  @override
  double calculateTotalRent(int days) {
    int currentYear = DateTime.now().year;
    int age = currentYear - yearOfManufacture!;

    double cost = basePrice! * days;

    // Apply 10% discount if older than 5 years
    if (age > 5) {
      cost *= 0.90;
    }

    return cost;
  }
}


class Bike extends Vehicle {
  Bike({
    required String brand,
    required String model,
    required int yearOfManufacture,
  }) : super(
    brand: brand,
    model: model,
    yearOfManufacture: yearOfManufacture,
    basePrice: 15,
  );

  @override
  double calculateTotalRent(int days) {
    double cost = basePrice! * days;

    // Apply 15% discount if rented for more than 7 days
    if (days > 7) {
      cost *= 0.85;
    }

    return cost;
  }
}


class Truck extends Vehicle {
  Truck({
    required String brand,
    required String model,
    required int yearOfManufacture,
  }) : super(
    brand: brand,
    model: model,
    yearOfManufacture: yearOfManufacture,
    basePrice: 100,
  );


  @override
  double calculateTotalRent(int days) {
    double cost = (basePrice! + 100) * days;
    return cost;
  }
}

void main() {
  Car car = Car(brand: "Toyota", model: "Corolla", yearOfManufacture: 2015);
  Bike bike = Bike(brand: "Yamaha", model: "R15", yearOfManufacture: 2021);
  Truck truck = Truck(brand: "Volvo", model: "FH16", yearOfManufacture: 2020);

  print("Car Rent (10 days): \$${car.calculateTotalRent(10)}\n");


  print("Bike Rent (10 days): \$${bike.calculateTotalRent(10)}\n");


  print("Truck Rent (5 days): \$${truck.calculateTotalRent(5)}\n");
}