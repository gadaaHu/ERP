import 'package:intl/intl.dart'; 
void main() { 
  print(NumberFormat.simpleCurrency(name: 'ETB').format(100.0));
  print(DateFormat.yMMMd().format(DateTime.now()));
}
