import 'package:cached_network_image/cached_network_image.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_whatsapp/features/home/presentation/widgets/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Iterable<Contact> contacts = [];

  @override
  void initState() {
    _getContacts();
    super.initState();
  }

  void _getContacts() async {
    contacts = await ContactsService.getContacts(withThumbnails: false);
    setState(() {
      contacts = contacts;
    });
  }

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
        bottom: PreferredSize(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 90),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 15),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _getAddToStory(),
                _getItemStatus(),
                _getItemStatus(),
                _getItemStatus(),
                _getItemStatus(),
                _getItemStatus(),
                _getItemStatus(),
                _getItemStatus(),
              ]
            ),
          ),
          preferredSize: Size.fromHeight(100),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10),
        children: contacts.map((Contact item){
          String name = item.displayName;
          if(item.displayName == null){
            name = item.phones.elementAt(0).value;
          }
          return _getItemChatContact(names: name, message: "Hey! What's up?", time: "7:50 PM");
        }).toList()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.camera_alt, color: Theme.of(context).primaryColor, size: 28),
      ),
      bottomNavigationBar: BottonNavBar(),
    );
  }

  Widget _getAddToStory(){
    return Padding(
      padding: EdgeInsets.all(2),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Theme.of(context).accentColor,
            ),
            width: 60,
            height: 60,
            child: Center(child: Icon(Icons.add, color: Theme.of(context).primaryColor, size: 28,)),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text("Your Story", style: TextStyle(fontSize: 12, color: Theme.of(context).primaryColor),),
          )
        ],
      ),
    );
  }
  Widget _getItemStatus(){
    return Padding(
      padding: EdgeInsets.all(2),
      child: Column(
        children: <Widget>[
          _getAvatarImage(),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text("Swiss", style: TextStyle(fontSize: 12),),
          )
        ],
      ),
    );
  }
  Widget _getItemChatContact({@required String names, @required String message, @required String time}){
    return ListTile(
      leading: _getAvatarImage(shadow: false),
      title: Text(names),
      subtitle: Text(message, style: TextStyle(color: Theme.of(context).primaryColor),),
      trailing: Text(time, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 12)),
    );
  }

  Widget _getAvatarImage({bool shadow:true, bool connected:false}){
    Container container = Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.transparent,
        boxShadow: shadow ? [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 1,
            spreadRadius: 0.0,
            offset: Offset(2,1),
          )
        ] : null,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(
          "https://lh3.googleusercontent.com/proxy/fTyL_qObVPQNTANONRqzbt_TikyxPii1Z7nT0v14rYNXrN4QG7XoBt9mUiItjlfwMobxYzabqGnaiv_E2jYNQY2soJ7bFWD5OsdW_jVAmA"
        ))
      )
    );
    if(connected){
      return container;
    }
    return Stack(
      children: <Widget>[
        container,
        Positioned(
          bottom: 5,
          right: 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.green,
            ),
            width: 10,
            height: 10,
          ),
        )
      ],
    );
  }
}