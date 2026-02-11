

void main() {

  final price = [100,20, 40, 300, 200, 89];
  // final budgetPrice = price.where((price) => price <= 100).toList();
  // print(budgetPrice);

  // final budgetPrice2 = price.map((price) => price > 100 ? 'Expensive: $price' : 'Affordable: $price').toList();
  // print(budgetPrice2);


  //Fold
  final totalPrice = price.fold(0.0, (a, b) => a + b);
  print(totalPrice);

  //reduce
  final totalPrice2 = price.reduce((a, b) => a + b);
  print(totalPrice2); 

}

