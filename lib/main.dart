import 'package:flutter/material.dart';
import 'package:whats_app/tabs/call.dart';
import 'package:whats_app/tabs/camera.dart';
import 'package:whats_app/tabs/chats.dart';
import 'package:whats_app/tabs/status.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: const Color(0xff075e54),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xff25d366))),
    home: MyHomePage(),
  ));
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              // Add your search functionality here
            },
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {
              // Add your more options functionality here
            },
          )
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: 'CHATS',
            ),
            Tab(
              text: 'STATUS',
            ),
            Tab(
              text: 'CALL',
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Camera(),
            Chats(),
            Status(),
            Call(),
          ],
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildFloatingActionButton() {
    Color fabColor = Colors.green;
    if (_tabController.index == 0) {
      return FloatingActionButton(
        onPressed: () {
          // Add your camera functionality here
        },
        backgroundColor: fabColor,
        child: Icon(Icons.camera, color: Colors.white),
      );
    } else if (_tabController.index == 1) {
      return FloatingActionButton(
        onPressed: () {
          // Add your message functionality here
        },
        backgroundColor: fabColor,
        child: Icon(Icons.message, color: Colors.white),
      );
    } else if (_tabController.index == 2) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(
            height: 45.0,
            width: 45.0,
            child: FloatingActionButton(
              onPressed: () {
                // Add your edit functionality here
              },
              backgroundColor: fabColor,
              child: Icon(Icons.edit, color: Colors.blueGrey),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          FloatingActionButton(
            onPressed: () {
              // Add your camera functionality here
            },
            backgroundColor: fabColor,
            child: Icon(Icons.camera_alt, color: Colors.white),
          )
        ],
      );
    } else if (_tabController.index == 3) {
      return FloatingActionButton(
        onPressed: () {
          // Add your add call functionality here
        },
        backgroundColor: fabColor,
        child: Icon(Icons.add_call, color: Colors.white),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
