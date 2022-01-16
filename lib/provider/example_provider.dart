import 'package:flutter/cupertino.dart';

class ExampleProvider extends ChangeNotifier {
   String text = "Hello";

  void doSomething() {
    text = "World";
    notifyListeners();
    print(text);
  }
}
