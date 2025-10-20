import 'dart:io';

void main() {
  List<double> expenses = [];
  
  print("Enter your expenses (type 'done' to finish):");
  
  while (true) {
    String? input = stdin.readLineSync();
    if (input == null || input.toLowerCase() == 'done') {
      break;
    }
    double? amount = double.tryParse(input);
    if (amount != null) {
      expenses.add(amount);
    } else {
      print("Please enter a valid number.");
    }
  }
  
  double total = expenses.fold(0, (sum, item) => sum + item);
  print("Total Expenses: $total");
}
