import 'package:course_flutter_database_skeleton/model/todo.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  Stream<List<Todo>> generateDummyData = (() async* {

    List<Todo> list = [
      Todo(title: "Testeintrag 1", done: false, dueDate: "morgen"),
      Todo(title: "Testeintrag 2", done: false, dueDate: "morgen"),
      Todo(title: "Testeintrag 3", done: false, dueDate: "morgen"),
    ];

    yield list;
  })();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<List<Todo>>(
        stream: generateDummyData,
        builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          switch (snapshot.connectionState) {
            //case ConnectionState.waiting:
            // return const Text('Loading...');
            default:
              if (!snapshot.hasData || snapshot.data?.length == 0) {
                return Text("Empty");
              }
              return Scrollbar(
                child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final todo = snapshot.data![index];

                      debugPrint(todo.title);

                      return Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.access_alarm),
                              title: Text(todo.title),
                              subtitle: Text(todo.dueDate),
                            ),
                          ],
                        ),
                      );
                    }),
              );
          }
        },
      ),
    );
  }
}
