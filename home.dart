import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heightVal = 170;
  int weight = 55;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Body Mass index'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      m1Extanded(context, 'male'),
                      SizedBox(width: 15),
                      m1Extanded(context, 'female'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Height',
                            style: Theme.of(context).textTheme.headline1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(heightVal.toStringAsFixed(1),
                                style: Theme.of(context).textTheme.headline1),
                            Text('cm',
                                style: Theme.of(context).textTheme.bodyText1)
                          ],
                        ),
                        Slider(
                          min: 90,
                          max: 220,
                          value: heightVal,
                          onChanged: (newValue) =>
                              setState(() => heightVal = newValue),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      m2Extanded(context, 'weight'),
                      SizedBox(width: 15),
                      m2Extanded(context, 'age'),
                    ],
                  ),
                ),
              ),
              Container(
                  color: Colors.pink,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 16,
                  child: TextButton(
                      onPressed: () {
                        var result = weight / pow(heightVal / 100, 2);
                        ;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Result(
                                result: result, isMale: isMale, age: age),
                          ),
                        );
                      },
                      child: Text('Calculate',
                          style: Theme.of(context).textTheme.headline2)))
            ],
          ),
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Expanded m1Extanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => isMale = (type == 'male') ? true : false),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (isMale && type == 'male') || (!isMale && type == 'female')
                ? Colors.blueGrey
                : Colors.pink,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                type == 'male' ? Icons.male : Icons.female,
                size: 90,
              ),
              SizedBox(height: 15),
              Text(
                type == 'male' ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2Extanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 15),
              Text(
                type == 'age' ? 'Age' : 'Weight',
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                type == 'age' ? '$age' : '$weight',
                style: Theme.of(context).textTheme.headline1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: type == 'age'
                        ? 'age--'
                        : 'weight--', //address for floating
                    onPressed: () {
                      setState(() {
                        type == 'age' ? age-- : weight--;
                      });
                    },
                    child: Icon(Icons.remove),
                    mini: true,
                  ),
                  SizedBox(width: 8),
                  FloatingActionButton(
                    heroTag: type == 'age'
                        ? 'age++'
                        : 'weight++', //address for floating
                    onPressed: () {
                      setState(() {
                        type == 'age' ? age++ : weight++;
                      });
                    },
                    child: Icon(Icons.add),
                    mini: true,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
