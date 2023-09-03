import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfunbook/controllers/auth_controller.dart';
import 'package:myfunbook/data/carddata.dart';
import 'package:myfunbook/pages/activitiesinfo.dart';
import 'package:myfunbook/pages/profile_screen.dart';
import 'package:myfunbook/widget/card_widget.dart';

class homepage extends StatefulWidget {
  @override
  _homepagestate createState() => _homepagestate();
}

class _homepagestate extends State<homepage> {
  int current_index = 0;
  final pagecontroller = PageController(viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    //final carddata = data.cards[0];

    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          leading: Padding(padding: EdgeInsets.all(8),
          child:GestureDetector(
            onTap: (){Get.to(profile());},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
          child: Image.asset("assets/images/user_icon.jpg") ,
          ),)),
          title: Text("home page"),
          centerTitle: true,
          actions: [IconButton(onPressed: (){authcontroller.instance.signout();}, icon: Icon(Icons.logout))],
          backgroundColor: Colors.black,
        ),
        body: Container(
          padding: EdgeInsets.all(24.0),
          child: PageView.builder(
            physics: BouncingScrollPhysics(),
            controller: pagecontroller,
            itemCount: data.cards.length,
            itemBuilder: (context, index) {
              final carddata = data.cards[index];
              return GestureDetector(
                child: CardWidget(
                    title: carddata.title,
                    description: carddata.description,
                    urlImage: carddata.imgUrl,
                    //subtitle: subtitle,
                    color: carddata.color),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => activitiesscreen())),
              );
            },
          ),
        ));
  }
}
