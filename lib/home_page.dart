import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDark = false;
  String input = "";
  String result = "0";
  String input2 = "";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(
                  () {
                    isDark = !isDark;
                  },
                );
              },
              child: Container(
                width: size.width / 3,
                height: size.height / 10,
                margin: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(35),
                  ),
                  color: isDark
                      ? ProjectColors.colorOfContainerDark
                      : ProjectColors.colorOfContainerLight,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.light_mode,
                      size: 40,
                      color: isDark ? Colors.grey[700] : Colors.yellow,
                    ),
                    Icon(
                      Icons.dark_mode,
                      size: 40,
                      color:
                          isDark ? Colors.white : Colors.grey.withOpacity(0.8),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: size.width,
              margin: const EdgeInsets.only(top: 30),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      input,
                      style: TextStyle(
                        color: isDark ? Colors.white : Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      result,
                      style: TextStyle(
                        color: isDark ? Colors.white : Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  color: isDark
                      ? ProjectColors.colorOfContainerDark
                      : ProjectColors.colorOfContainerLight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    button("AC", "CE", "%", "÷"),
                    button("7", "8", "9", "×"),
                    button("4", "5", "6", "-"),
                    button("1", "2", "3", "+"),
                    button("00", "0", ".", "=")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget button(
    String text1,
    String text2,
    String text3,
    String text4,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 75,
          height: 75,
          child: ElevatedButton(
            onPressed: () {
              setState(
                () {
                  if (text1 != "AC") {
                    input = input + text1;
                    input2 = input2 + text1;
                  } else {
                    input = "";
                    input2 = "";
                    result = "0";
                  }
                },
              );
            },
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(
                isDark ? Colors.black : Colors.white,
              ),
            ),
            child: Text(
              text1,
              style: TextStyle(
                color: text1 == "AC"
                    ? ProjectColors.green
                    : isDark
                        ? Colors.white
                        : Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 75,
          width: 75,
          child: ElevatedButton(
            onPressed: () {
              setState(
                () {
                  if (text2 != "CE") {
                    input += text2;
                    input2 += text2;
                  } else {
                    if (input.isNotEmpty) {
                      input = input.substring(0, input.length - 1);
                      input2 = input2.substring(0, input2.length - 1);
                    }
                  }
                },
              );
            },
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(
                isDark ? Colors.black : Colors.white,
              ),
            ),
            child: Text(
              text2,
              style: TextStyle(
                color: text2 == "CE"
                    ? ProjectColors.green
                    : isDark
                        ? Colors.white
                        : Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 75,
          height: 75,
          child: ElevatedButton(
            onPressed: () {
              setState(
                () {
                  input += text3;
                  input2 += text3;
                },
              );
            },
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(
                isDark ? Colors.black : Colors.white,
              ),
            ),
            child: Text(
              text3,
              style: TextStyle(
                color: text3 == "%"
                    ? ProjectColors.green
                    : isDark
                        ? Colors.white
                        : Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 75,
          height: 75,
          child: ElevatedButton(
            onPressed: () {
              setState(
                () {
                  if (text4 != "=") {
                    input = input + text4;
                    if (text4 == "÷") {
                      input2 = "$input2/";
                    } else if (text4 == "×") {
                      input2 = "$input2*";
                    } else {
                      input2 = input2 + text4;
                    }
                  }

                  print(input2);
                  if (text4 == "=") {
                    Parser parser = Parser();
                    Expression expression = parser.parse(input2);
                    ContextModel contextModel = ContextModel();
                    double eval = expression.evaluate(
                      EvaluationType.REAL,
                      contextModel,
                    );

                    result = eval.toString();
                  }
                },
              );
            },
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(
                isDark ? Colors.black : Colors.white,
              ),
            ),
            child: Text(
              text4,
              style: TextStyle(
                color: ProjectColors.red,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
