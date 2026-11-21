void main() {
  var student = {
    'name': 'Awais',
    'age': 20,
    'marks': 85
  };

  print("Keys:");
  print(student.keys);

  print("Values:");
  print(student.values);

  student['marks'] = 90;

  print("\nAfter updating marks:");
  print(student);
}