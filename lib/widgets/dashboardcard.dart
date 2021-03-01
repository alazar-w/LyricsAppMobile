import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget{
  final icon, title, content, colors;
  DashboardCard({this.icon, this.title, this.content, this.colors});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
                colors: [colors[0], colors[0]]
            )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right:8.0),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$title', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),),
                  Flexible(child: Text('$content', style: TextStyle(color: Colors.white),overflow: TextOverflow.ellipsis,))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}