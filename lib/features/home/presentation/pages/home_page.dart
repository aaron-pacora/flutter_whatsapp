import 'package:flutter/material.dart';
import 'package:flutter_whatsapp/features/home/presentation/widgets/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("WhatsApp", style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 22),),
        elevation: 0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: (){}),
        ],
      ),
      body: Center(child: Text("Contacts")),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.camera_alt, color: Theme.of(context).primaryColor, size: 28),
      ),
      bottomNavigationBar: BottonNavBar(),
    );
  }
}