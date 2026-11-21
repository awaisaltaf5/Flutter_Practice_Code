void main() {
  Map<String, int> students = {
    'Awais': 85,
    'Ahmed': 92,
    'Usman': 78
  };

  int highestMarks = 0;

  for (var student in students.entries) {
    print("${student.key}: ${student.value}");
    if (student.value > highestMarks) {
      highestMarks = student.value;
    }
  }

  print("Highest Marks: $highestMarks");
}