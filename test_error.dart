void main() {
  try {
    dynamic x = "hello";
    var y = x["data"];
  } catch (e) {
    print("Test 1: $e");
  }
  
  try {
    dynamic x = [1, 2, 3];
    var y = x["data"];
  } catch (e) {
    print("Test 2: $e");
  }
}
