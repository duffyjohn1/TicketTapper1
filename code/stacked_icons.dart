import 'package:flutter/material.dart';

class StakedIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: Alignment.center,
      children: <Widget>[
        new Container(
          height: 80.0,
          width: 80.0,
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(50.0),
              color: Color(0xFF18D191)),
          child: new Icon(
            Icons.euro_symbol,
            color: Colors.black,
          ),
        ),
        new Container(
          margin: new EdgeInsets.only(right: 250.0, top: 50.0),
          height: 80.0,
          width: 80.0,
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(50.0),
              color: Color(0xFFFC6A7F)),
          child: new Icon(
            Icons.home,
            color: Colors.black,
          ),
        ),
        new Container(
          margin: new EdgeInsets.only(left: 250.0, top: 50.0),
          height: 80.0,
          width: 80.0,
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(50.0),
              color: Color(0xFFFFCE56)),
          child: new Icon(
            Icons.directions_bus,
            color: Colors.black,
          ),
        ),

      ],
    );
  }
}
