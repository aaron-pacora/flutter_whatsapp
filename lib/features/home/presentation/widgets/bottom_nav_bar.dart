import 'package:flutter/material.dart';

class BottonNavBar extends StatefulWidget {
  BottonNavBar({Key key}) : super(key: key);

  @override
  _BottonNavBarState createState() => _BottonNavBarState();
}

class _BottonNavBarState extends State<BottonNavBar> {

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.message),
      title: Text("Messages"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.people),
      title: Text("Groups")
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.call),
      title: Text("Call"),
    )
  ];

  double heigthUnderline = 10;
  double width = 0;
  double _getIndicatorPosition(int index) => (-1 + (2 / (items.length - 1) * index));

  Duration duration = Duration(milliseconds: 270);

  int currentPosition = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    double widthItem = width / items.length;

    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(25),
        topLeft: Radius.circular(25),
      ),
      child: Stack(
        children: <Widget>[
          BottomNavigationBar(
            backgroundColor: Theme.of(context).accentColor,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: 28,
            items: items,
            unselectedItemColor: Theme.of(context).primaryColor,
            onTap: (int indexToSelected){
              setState(() {
                currentPosition = indexToSelected;
              });
            },
          ),
          Positioned(
            bottom: -(heigthUnderline / 2),
            width: width,
            child: AnimatedAlign(
              alignment: Alignment(_getIndicatorPosition(currentPosition), 0),
              duration: duration,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: widthItem * .20),
                width: widthItem,
                height: heigthUnderline,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)
                  ),
                  width: double.infinity,
                  height: double.infinity,
                ),
              )
            )
          )
        ],
      ),
    );
  }
}