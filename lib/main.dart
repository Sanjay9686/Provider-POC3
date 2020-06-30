import 'dart:async';

import 'package:POC3/add_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:ChangeNotifierProvider(
        create: (_)=>AddList(),
          child: MyHomePage(title: 'Flutter Demo Home Page')));

  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
//  List<ItemModel> list = [
//    ItemModel(name: "HP", price: 20000),
//    ItemModel(name: "DELL", price: 30000),
//    ItemModel(name: "LENOVA", price: 40000),
//    ItemModel(name: "MAC", price: 50000),
//  ];

  // ignore: close_sinks
//  final StreamController<AddList> streamController = StreamController<AddList>();
 // ignore: close_sinks
// StreamController<ItemModel> streamController;
 // ignore: close_sinks
// StreamController<> sc;

//  final model=AddList();
////  ItemModel itemModel=ItemModel();
//var stream;
//  var data=Provider.of<AddList>(context,listen: false);

  @override
  void initState(){
    super.initState();

//    myClass = Provider.of<MyClass>(context);
  }
//  void intState(){
////    _streamController.close();
//  counterClass.closeStream();
//    super.dispose();
//  }

  void _item(){
//    return 0;
  }
  

  @override
  Widget build(BuildContext context) {
 final model=Provider.of<AddList>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<List<String>>
              (

              stream:model.itemData,
              initialData:[],
              builder: (BuildContext context,snapshot){
                print("${snapshot.data}");
                List<String> items=snapshot.data;


                return   Expanded(
                  child:  ListView.separated(
                    itemCount:snapshot.data.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        child: Container(
                          height: 50,
                          width: 60,
                          decoration: BoxDecoration(
//                 color: Colors.black38,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
//                 boxShadow: Box
                          ),
                          child: Consumer<AddList>(
                            builder: (context,value,child){

                              return ListTile(
                                title: Text("${items[index]}",
                                  style: TextStyle(color: Colors.red),
                                ),
                                subtitle: Text(
                                  "${items[index]}",
                                  style: TextStyle(color: Colors.indigoAccent),
                                ),
                                trailing: GestureDetector(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.indigo,
                                  ),
                                  onTap: (){
//                                    sc.increment();
                                  },
                                ),
                              );
                            },

                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                  ),
                );
              },
            ),
            RaisedButton(
              child: Text("reset"),
              onPressed:(){
//                sc.listClear();
              } ,
            )
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );

  }
}
