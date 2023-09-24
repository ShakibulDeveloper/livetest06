import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScreenState(),
      title: "Counter App",
      theme: ThemeData(
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 39, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

}

class CounterScreenState extends StatefulWidget{
  const CounterScreenState({super.key});

  @override
  State<StatefulWidget> createState() {
    return CounterScreenUI();
  }

}

class CounterScreenUI extends State<CounterScreenState>{
  int count = 0;

  appAlertDialog(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        content: Text("Button pressed $count times."),
        actions: [
          TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Close"))
        ],
      );
    });
  }

  void incrementOnClick(int value){
    if(value > 3){
      count++;
      appAlertDialog();

    }else{
      count++;
    }
    setState(() {});
  }

  void decrementOnClick(int value){
    if(value > 0){
      count--;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Count:", style: Theme.of(context).textTheme.bodyMedium,),
          Text('$count', style: Theme.of(context).textTheme.bodyLarge,),
          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 12,
                ),
                child: ElevatedButton(
                    onPressed: (){
                      incrementOnClick(count);
                    },
                    child: Icon(Icons.add)
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                    decrementOnClick(count);
                  },
                  child: Icon(Icons.remove)
              ),
            ],
          ),
        ],
      ),
    );
  }

}