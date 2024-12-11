import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final _textController = TextEditingController();
  List<String> lstSymbols = [
    "C",
    "*",
    "/",
    "<-",
    "1",
    "2",
    "3",
    "+",
    "4",
    "5",
    "6",
    "-",
    "7",
    "8",
    "9",
    "*",
    "%",
    "0",
    ".",
    "=",
  ];

  final _key = GlobalKey<FormState>();
  int first = 0;
  int second = 0;
  String operation = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                textDirection: TextDirection.rtl,
                controller: _textController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: lstSymbols.length,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      onPressed: () {
                        final symbol = lstSymbols[index];
setState(() {
  if (symbol == "C") {
    _textController.text = "";
    first = 0;
    second = 0;
    operation = "";
  } else if (symbol == "<-") {
    if (_textController.text.isNotEmpty) {
      _textController.text = _textController.text.substring(0, _textController.text.length - 1);
    }
  } else if (symbol == "+" || symbol == "-" || symbol == "*" || symbol == "/" || symbol == "%") {
    first = int.tryParse(_textController.text) ?? 0;
    operation = symbol;
    _textController.text = "";
  } else if (symbol == "=") {
    second = int.tryParse(_textController.text) ?? 0;
    int result;
    switch (operation) {
      case "+":
        result = first + second;
        break;
      case "-":
        result = first - second;
        break;
      case "*":
        result = first * second;
        break;
      case "/":
        result = second != 0 ? first ~/ second : 0; // Avoid division by zero
        break;
      case "%":
        result = second != 0 ? first % second : 0;
        break;
      default:
        result = 0;
    }
    _textController.text = result.toString();
    operation = "";
  } else {
    _textController.text += symbol;
  }
});


                      },
                      child: Text(
                        lstSymbols[index],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}