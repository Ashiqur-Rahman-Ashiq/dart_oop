class Item {
  final String id;
  final int quantity;
  final double price;

  Item({required this.id, required this.quantity, required this.price});

  @override
  String toString() {
    return 'Item(id: $id, quantity: $quantity, price: $price)';
  }
}

void main() {
  
  List<Item> items = [
    Item(id: "item-937", quantity: 12, price: 230.5),
    Item(id: "item-432", quantity: 3, price: 120.0),
    Item(id: "item-431", quantity: 1, price: 1230.0),
    Item(id: "item-098", quantity: 5, price: 12.5),
    Item(id: "item-133", quantity: 8, price: 30.0),
    Item(id: "item-133", quantity: 8, price: 30.0)
  ];




  bool checkDuplicateItem(List<Item> items) {
    Set<String> uniqueIds = {};
    for (var item in items) {
      if (!uniqueIds.add(item.id)) {
        return true;    }
    }
    return false;
  }

  double calculateItemPrice(double price, int quantity) {
    return price*quantity;
  }

  double calculateTax (double amount, double taxRate) {
    return (amount/100) * taxRate;
  }


  double calculateGrandTotal (List<Item> items) {
    double subTotal = 0;
    for (var item in items) {
      subTotal += calculateItemPrice(item.price, item.quantity);
    }
    return subTotal;
  }

  double grandTotal = calculateGrandTotal(items);
  double tax = calculateTax(grandTotal, 5);


  if(checkDuplicateItem(items)) {
    print("Duplicate Item found");
  } else {
    print("Item id \t   Qty \t unit price \t total");
    print("\n");
    for (var item in items) {
      print("${item.id} \t   ${item.quantity} \t ${item.price} \t \t ${calculateItemPrice(item.price, item.quantity)}");
    }

    print("\n");
    print('------------------------------------------------------');

    print("Grand Total \t $grandTotal");
    print("Tax(5%) \t $tax");
    print("Net Total \t ${grandTotal+tax}");
  }
}
