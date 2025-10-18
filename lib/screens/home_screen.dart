import 'package:demo1/components/video_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        automaticallyImplyLeading: false,
      ),

      body: Container(
        margin: const EdgeInsets.all(50.0),

        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.black, width: 2.0),
                ),
                child: VideoCategoryCard(
                  icon: Icons.movie,
                  categoryName: "LiveTV",
                  videoCount: 1234,
                ),
              ),
            ),
            SizedBox(width: 10),

            Expanded(
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.black, width: 2.0),
                ),
                child: VideoCategoryCard(
                  icon: Icons.movie,
                  categoryName: "Movies",
                  videoCount: 1234,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.black, width: 2.0),
                ),
                child: VideoCategoryCard(
                  icon: Icons.movie,
                  categoryName: "Series",
                  videoCount: 1234,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.black, width: 2.0),
                ),
                height: 200,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text('Playlists'),
                    ),
                    ListTile(leading: Icon(Icons.home), title: Text('Home')),
                    ListTile(leading: Icon(Icons.home), title: Text('Home')),
                    ListTile(leading: Icon(Icons.home), title: Text('Home')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
