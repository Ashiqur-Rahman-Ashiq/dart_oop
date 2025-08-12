void main() {
  CreditCard creditCard = CreditCard();

  creditCard.balance = 500;
  creditCard.dailyWithdarwAmount = 0;
  creditCard.maxLimit = 500;
  creditCard.billPayLimit= 500;
  creditCard.dailyLimit= 100;
  creditCard.perTransactionLimit= 20;

}

class CreditCard {
  double? balance;
  double? dailyWithdarwAmount;
  int? maxLimit;
  int? dailyLimit;
  int? perTransactionLimit;
  int? billPayLimit;


  bool withdraw(double amount) {
    if(dailyWithdarwAmount! < dailyLimit! && amount <= perTransactionLimit!) {
      balance =- amount;
      dailyWithdarwAmount = dailyWithdarwAmount! + amount;
      return true;
    } else {
      return false;
    }
  }


  bool payBill(double amount) {
    if(amount< balance! && amount <= billPayLimit!){
      balance =- amount;
      return true;
    } else {
      return false;
    }
  }

}