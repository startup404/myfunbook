import 'package:flutter/material.dart';

class ActivityWidget extends StatelessWidget {
  final String title;
  //final String description;
  final String urlImage;
  //final String subtitle;
  //final Color color;

  const ActivityWidget({
    required this.title,
    //required this.description,
    required this.urlImage,
    //required this.subtitle,
    //required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(245, 236, 238, 234),
          ),
          child: buildrow(),
          height: 150,
        ),
      );

  buildrow() => Row(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 10,
          ),
          Expanded(child: buildimage()),
          SizedBox(
            width: 10,
          ),
          Expanded(child: buildtext())
        ],
      );

  Widget buildimage() => Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(urlImage))),
      ));
  Widget buildtext() => Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16.0),
        //color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Caveat',
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}
