import 'package:api/API/photos_api_provider/photo.dart';
import 'package:api/API/photos_api_provider/photos_api_provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Photos API'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _photoApiProvider = PhotosApiProvider();
  late List<Photo> data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.blueGrey.shade100),
        ),
      ),
      body: Center(
          child: FutureBuilder(
        future: _photoApiProvider.fetchPhotos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return const CircularProgressIndicator(
              color: Colors.blueGrey,
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(
              color: Colors.blueGrey,
            );
          } else {
            data = snapshot.data!;
            return ListView.custom(
                padding: const EdgeInsets.all(20),
                itemExtent: 90,
                childrenDelegate: SliverChildBuilderDelegate(
                    childCount: snapshot.data!.length, (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black38,
                                blurRadius: 10,
                                offset: Offset(2, 2))
                          ],
                          color: Colors.blueGrey.shade100,
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(360),
                              image: DecorationImage(
                                  image:
                                      NetworkImage(data[index].thumbnailUrl))),
                        ),
                        title: Text(data[index].title),
                        titleTextStyle: const TextStyle(color: Colors.blueGrey),
                        subtitle: Text(data[index].albumId.toString()),
                      ),
                    ),
                  );
                }));
          }
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {}),
        tooltip: 'Increment',
        backgroundColor: Colors.blueGrey,
        child: Icon(
          Icons.add,
          color: Colors.blueGrey.shade100,
        ),
      ),
    );
  }
}
