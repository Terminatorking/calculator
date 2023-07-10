import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDark = false;
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
                margin: EdgeInsets.only(
                  left: size.width / 2.9,
                  top: 30,
                ),
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
                      color: isDark
                          ? Colors.white
                          : Colors.grey.withOpacity(0.8),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
