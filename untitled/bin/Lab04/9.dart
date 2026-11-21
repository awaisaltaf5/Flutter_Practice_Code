void main() {
  List<String> cities = ["Lahore", "Islamabad", "Karachi", "Peshawar"];

  String city = "Islamabad";

  if (cities.contains(city)) {
    print("$city exists in the list.");
  } else {
    print("$city does not exist in the list.");
  }
}