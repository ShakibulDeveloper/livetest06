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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Count:", style: TextStyle(fontSize: 18),),
          Text('$count', style: TextStyle(fontSize: 39, fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 12,
                ),
                child: ElevatedButton(
                    onPressed: (){
                      if(count > 3){
                        count++;
                        showDialog(context: context, builder: (context){
                          return AlertDialog(
                           content: Text("Button pressed $count times."),
                            actions: [
                              TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Close"))
                            ],
                          );
                        });
                        setState(() {});
                      }else{
                        count++;
                        setState(() {});
                      }
                    },
                    child: Icon(Icons.add)
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                    if(count > 0){
                      count--;
                      setState(() {});
                    }
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