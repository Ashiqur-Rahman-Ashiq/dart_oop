
import 'package:dart_programming/OOP/Day2/p2.dart';

void main() {

  User customer = User(
  'Ashiqur rahman',
   DateTime(2000, 12, 31),
  );


  CreditCard card =CreditCard(
    500,
    DateTime(2027, 12, 31),
    01,
    500
  );

  customer.assignCreditCard(card);

  customer._card?.withdrawBalance(50);

  print(customer._card?._availableCredit);
}




class User {
  String? _name;
  CreditCard? _card;
  DateTime? _dateOfBirth;

  User(this._name, this._dateOfBirth);

  bool assignCreditCard(CreditCard card) {
    if(isAdult(_dateOfBirth!)) {
      _card = card;
      return true;
    }
    return false;
  }

  bool isAdult(DateTime dateOfBirth) {
    final now = DateTime.now();
    final hasBirthdayPassed = now.month > dateOfBirth.month ||
        (now.month == dateOfBirth.month && now.day >= dateOfBirth.day);
    return (now.year - dateOfBirth.year) - (hasBirthdayPassed ? 0 : 1) >= 18;
  }
}



class CreditCard{
  int? _cardNumber;
  DateTime? _expireDate;
  double? _cardLimit;
  double? _availableCredit;

  CreditCard(this._cardLimit, this._expireDate, this._cardNumber, this._availableCredit);

  bool withdrawBalance(double amount) {
    if(_expireDate!.isAfter(DateTime.now()) && _availableCredit! > amount) {
      _availableCredit = _availableCredit! - amount;
      return true;
    }
    return false;
  }
}
