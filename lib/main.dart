
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whine_app/services/users_services.dart';

import 'models.dart/users.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Users',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: ' Flutter Users'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late Future<List<Users>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = fetchUsers();
  }

 

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: FutureBuilder<List<Users>>(
          future: futureUsers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Users>? data = snapshot.data; 
              return ListView.builder( itemCount: data?.length, itemBuilder: 
                (BuildContext context, int index){ 
                // return Container( height: 75, color: Colors.white, child: 
                //   Center(child: 
                //     Text(data![index].title), 
                //   ),
                // );
                return Card(child:ListTile( title: Text(data![index].name), subtitle: Text(data[index].email),leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://inews.gtimg.com/newsapp_bt/0/14724928253/1000")),
                ));
                });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        )
      )
    );
  }
}

