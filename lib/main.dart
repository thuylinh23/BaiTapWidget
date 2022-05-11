import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController mathPointController = TextEditingController();
  TextEditingController literaryPointController = TextEditingController();
  TextEditingController englishPointController = TextEditingController();
  double mediumPoint = 0.0;
  String servey = "Đánh giá";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Demo Widget App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            inputTextField(
                hintText: "point",
                labelText: "Math Point",
                controller: mathPointController),
            inputTextField(
                hintText: "point",
                labelText: "Literary Point",
                controller: literaryPointController),
            inputTextField(
                hintText: "point",
                labelText: "English Point",
                controller: englishPointController),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  mediumPoint = (double.parse(mathPointController.text) +
                          double.parse(literaryPointController.text) +
                          double.parse(englishPointController.text)) /
                      3;
                  servey = serVey().toString();
                  print(servey);
                  // serVey();
                });
              },
              child: const Text("Medium Point"),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              mediumPoint.toString(),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              servey,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  String serVey() {
    if (mediumPoint <= 10.0 && mediumPoint >= 8.0) {
      return "Xếp loại giỏi";
    } else if (mediumPoint <= 8.0 && mediumPoint >= 6.5) {
      return "Xếp loại khá";
    } else if (mediumPoint <= 6.5 && mediumPoint >= 5.0) {
      return "Xếp loại trung bình";
    } else {
      return "Xếp loại yếu";
    }
  }

  Widget inputTextField(
      {required String hintText,
      required String labelText,
      required controller}) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mathPointController.dispose();
    literaryPointController.dispose();
    englishPointController.dispose();
  }
}
