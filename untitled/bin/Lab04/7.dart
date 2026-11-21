void main() {
  int n = 10;
  int i = 1;
  int sum = 0;

  while (i <= n) {
    sum = sum + i;
    i++;
  }

  print("Sum of first $n natural numbers: $sum");
}