import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int firstNumber = 0;
  int secondNumber = 0;
  String operation = "";
  String history = ""; 

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
    "0",
    "%",
    ".",
    "=",
  ];

  List<String> operationList = [
    "C",
    "*",
    "/",
    "<-",
    "-",
    "*",
    "%",
    ".",
    "=",
    "+",
  ];



  final _key = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Samman Calculator App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
          child: Column(
            children: [
              Text(history,style: TextStyle(fontSize: 16,color: Color.fromARGB(164, 16, 26, 89)),),
              TextFormField(
                textDirection: TextDirection.rtl,
                controller: _textController,
                decoration:  InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(9),),
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
                        backgroundColor:operationList.contains(lstSymbols[index])?Color.fromARGB(255, 198, 185, 147): Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                        

                      ),
                      onPressed: () {
                        switch(lstSymbols[index]){
                          case "1":
                          _textController.text= _textController.text + "1";
                          case "2":
                          _textController.text= _textController.text + "2";
                          case "3":
                          _textController.text= _textController.text + "3";
                              case "4":
                          _textController.text= _textController.text + "4";
                              case "5":
                          _textController.text= _textController.text + "5";
                              case "6":
                          _textController.text= _textController.text + "6";
                              case "7":
                          _textController.text= _textController.text + "7";
                              case "8":
                          _textController.text= _textController.text + "8";
                              case "9":
                          _textController.text= _textController.text + "9";
                              case "0":
                          _textController.text= _textController.text + "0";
                          case "+":
                          setState(() {
                            firstNumber = int.parse(_textController.text);
                            operation = "+";
                            history = "$firstNumber $operation";
                          });
                          _textController.text = "";
                            case "-":
                          setState(() {
                            firstNumber = int.parse(_textController.text);
                            operation = "-";
                           history = "$firstNumber $operation";

                          });
                          _textController.text = "";

                          case "%":
                          setState(() {
                            firstNumber = int.parse(_textController.text);
                             operation = "%";
                            history = "$firstNumber $operation";

                          });
                          _textController.text = "";

                         case "<-":
                        if (_textController.text.isNotEmpty) {
                        _textController.text = _textController.text.substring(0, _textController.text.length - 1);
                        }

                          case "/":
                          setState(() {
                            firstNumber = int.parse(_textController.text);
                             operation = "/";
                              history = "$firstNumber $operation";

                          });
                          _textController.text = "";


                          case "*":
                          setState(() {
                            firstNumber = int.parse(_textController.text);
                            operation = "*";
                             history = "$firstNumber $operation";

                          });
                          _textController.text = "";

                          case "=":
                          secondNumber = int.parse(_textController.text);
                          setState(() {
                            history = "$firstNumber $operation $secondNumber = ";

                          });


                          switch(operation){

                            case "+":
                            _textController.text=(firstNumber+secondNumber).toString();
                            case "-":
                             _textController.text=(firstNumber-secondNumber).toString();

                            case "*":
                             _textController.text=(firstNumber * secondNumber).toString();

                            case "/":
                            _textController.text=(firstNumber/secondNumber).toString();
                            case "%":
                            _textController.text=(firstNumber%secondNumber).toString();
                           

                          }
                          

                          case "C":
                          _textController.text = "";
               
                        }
                   
                       
                      },
                      child: Text(
                        lstSymbols[index],
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 250, 249, 249),
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