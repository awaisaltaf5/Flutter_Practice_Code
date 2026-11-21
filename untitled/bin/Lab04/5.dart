void main() {
  double num1 = 20;
  double num2 = 5;
  String operator = "*";

  switch (operator) {
    case "+":
      print("Result: ${num1 + num2}");
      break;

    case "-":
      print("Result: ${num1 - num2}");
      break;

    case "*":
      print("Result: ${num1 * num2}");
      break;

    case "/":
      print("Result: ${num1 / num2}");
      break;

    default:
      print("Invalid operator");
  }
}