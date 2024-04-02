import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter',
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter =0;
  
  void incrementCounter() {
    setState(() {
      counter++;
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Counter'),
      ),
      body: Center( 
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.blue[100],
              padding: const EdgeInsets.all(20.0),
              child:const  Text(
                'My Home Page ',
                style: TextStyle( 
                  fontSize: 24.0

                ),),
            ),
          const SizedBox(height: 20.0,),
           CounterA(count: counter,increment:incrementCounter),
          const SizedBox(height: 20.0,),
           Middle(counter: counter,),
          ],
        ),
      ),
    );
  }
}

class CounterA extends StatelessWidget {

  const CounterA({super.key,required this.count,required this.increment});
  final int count;
  final void Function() increment;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[100],
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [ 
           Text(
            '$count',
            style: const TextStyle(fontSize: 48.0),
          ),
          ElevatedButton(
            onPressed: increment,
            child: const Text('Increment',
            style: TextStyle(fontSize: 20.0),),
          ),
        ],
      ),
    );
  }
}
class Middle extends StatelessWidget {
  const Middle({super.key,required this.counter});

  final int counter ;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(20.0),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [ 
          CounterB(counter: counter,),
          const SizedBox(width: 20.0,),
          Sibling(counter: counter,)
        ],
      ),
    );
  }
}

class CounterB extends StatelessWidget {
  const CounterB({super.key, required this.counter});
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[100],
      padding: const EdgeInsets.all(10.0),
      child:  Text(
        '$counter',
        style: const TextStyle(fontSize: 24.0),
      ),
    );
  }
}

class Sibling extends StatelessWidget {
  const Sibling({super.key,required this.counter});
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[100],
      padding: const EdgeInsets.all(10.0),
      child:  Text(
        '$counter',
        style:const  TextStyle(fontSize: 24.0),
      ),
    );
  }
}