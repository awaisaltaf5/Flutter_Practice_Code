void main() {
  List<int> numbers = [2, 4, 6, 8, 10];

  int sum = 0;

  for (int number in numbers) {
    print(number);
    sum = sum + number;
  }

  print("Sum: $sum");
}