import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide debug banner
      title: 'Vertical Scroll View Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Availabilities'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.purple[100],
                  ),
                  height: 200.0,
                  child: const Center(
                      child: Padding(
                    padding: EdgeInsets.all(40.0),
                    child: Image(image: AssetImage("assets/demo/pumpkin.png")),
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.purple[100],
                    ),
                    height: 200.0,
                    child: const Center(
                        child: Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Image(image: AssetImage("assets/demo/onion.png")),
                    )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.purple[100],
                    ),
                    height: 200.0,
                    child: const Center(
                        child: Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Image(
                          image: AssetImage("assets/demo/vegetables.png")),
                    )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.purple[100],
                    ),
                    height: 200.0,
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(40.0),
                        child:
                            Image(image: AssetImage("assets/demo/tomato.png")),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.purple[100],
                    ),
                    height: 200.0,
                    child: const Center(
                        child: Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Image(image: AssetImage("assets/demo/potato.png")),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
