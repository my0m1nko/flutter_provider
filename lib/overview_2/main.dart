import 'package:flutter/material.dart';
import 'package:state_provider/model/dog.dart';
import 'package:provider/provider.dart';
  

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Dog>(
      create : (context) => Dog(name: 'Fido', bread: 'Labrador'),
      child: MaterialApp(
        title: 'Provider Overview 2',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Overview 2'),

      ),
      body:  Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [ 
            Text(
              '-name : ${context.watch<Dog>().name}',
              // '-name : ${Provider.of<Dog>(context).name}',
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
           const  SizedBox(height: 10.0,),
           const  BreedAndAge()
          ],
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(
          '-bread : ${context.select<Dog ,String>((Dog dog) => dog.bread)}',
          style: const  TextStyle(
            fontSize: 20.0,
          ),
        ),
        const SizedBox(height: 10.0,),
       const  Age()
        
      ],
    );
  }
}

class Age extends StatefulWidget {
  const Age({super.key});

  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(
          '-age : ${context.select<Dog,int>((Dog dog)=> dog.age)}',
          style: const TextStyle(
            fontSize: 20.0,
          ),
        ),
        const SizedBox(height: 10.0,),
        ElevatedButton(
          onPressed: () => context.read<Dog>().increaseAge(),
          child: const Text('Increase Age'),
        )
        
      ],
    );
  }
}