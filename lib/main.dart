import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String number = '0';
  double firstNumber = 0.0;
  String operation = '';

  void calculate(String key) {
    switch (key) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case '.':
        setState(() {
          number += key;

          if (number.contains('.')) {
          } else {
            int numberInt = int.parse(number);
            number = numberInt.toString();
          }
        });
        break;
      case '+':
      case '-':
      case '*':
      case '/':
        operation = key;
        firstNumber = double.parse(number);
        number = '0';
        break;
      case '=':
        double result = 0.0;
        if (operation == '/') {
          if (double.parse(number) * 1 == 0) {
            return;
          }
        }
        if (operation == '+') {
          result = firstNumber + double.parse(number);
        }
        if (operation == '-') {
          result = firstNumber - double.parse(number);
        }
        if (operation == '*') {
          result = firstNumber * double.parse(number);
        }
        if (operation == '/') {
          result = firstNumber / double.parse(number);
        }
        String stringResult = result.toString();
        List<String> resultParts = stringResult.split('.');
        if (int.parse(resultParts[1]) * 1 == 0) {
          setState(() => number = int.parse(resultParts[0]).toString());
        } else {
          setState(() => number = result.toString());
        }
        break;
      case '<x':
        setState(() {
          if (number.isNotEmpty) {
            number = number.substring(0, number.length - 1);
          }
        });
        break;
      default:
        setState(() => number = '0');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  number,
                  style: const TextStyle(fontSize: 72),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => calculate('AC'),
                  child: const Text(
                    'AC',
                    style: TextStyle(fontSize: 36),
                  ),
                ),
                const Text(''),
                const Text(''),
                GestureDetector(
                  onTap: () => calculate('<x'),
                  child: const Text(
                    '<x',
                    style: TextStyle(fontSize: 36),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => calculate('7'),
                  child: const Text(
                    '7',
                    style: TextStyle(fontSize: 36),
                  ),
                ),
                GestureDetector(
                  onTap: () => calculate('8'),
                  child: const Text(
                    '8',
                    style: TextStyle(fontSize: 36),
                  ),
                ),
                GestureDetector(
                  onTap: () => calculate('9'),
                  child: const Text(
                    '9',
                    style: TextStyle(fontSize: 36),
                  ),
                ),
                GestureDetector(
                  onTap: () => calculate('/'),
                  child: const Text(
                    '/',
                    style: TextStyle(fontSize: 36),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => calculate('4'),
                  child: const Text(
                    '4',
                    style: TextStyle(fontSize: 36),
                  ),
                ),
                GestureDetector(
                  onTap: () => calculate('5'),
                  child: const Text(
                    '5',
                    style: TextStyle(fontSize: 36),
                  ),
                ),
                GestureDetector(
                  onTap: () => calculate('6'),
                  child: const Text(
                    '6',
                    style: TextStyle(fontSize: 36),
                  ),
                ),
                GestureDetector(
                  onTap: () => calculate('*'),
                  child: const Text(
                    '*',
                    style: TextStyle(fontSize: 36),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => calculate('1'),
                  child: const Text(
                    '1',
                    style: TextStyle(fontSize: 36),
                  ),
                ),
                GestureDetector(
                  onTap: () => calculate('2'),
                  child: const Text(
                    '2',
                    style: TextStyle(fontSize: 36),
                  ),
                ),
                GestureDetector(
                  onTap: () => calculate('3'),
                  child: const Text(
                    '3',
                    style: TextStyle(fontSize: 36),
                  ),
                ),
                GestureDetector(
                  onTap: () => calculate('-'),
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 36),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => calculate('0'),
                  child: const Text(
                    '0',
                    style: TextStyle(fontSize: 36),
                  ),
                ),
                GestureDetector(
                  onTap: () => calculate('.'),
                  child: const Text(
                    '.',
                    style: TextStyle(fontSize: 36),
                  ),
                ),
                GestureDetector(
                  onTap: () => calculate('='),
                  child: const Text(
                    '=',
                    style: TextStyle(fontSize: 36),
                  ),
                ),
                GestureDetector(
                  onTap: () => calculate('+'),
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 36),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
