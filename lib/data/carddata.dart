import 'package:flutter/material.dart';
import 'package:myfunbook/models/card_data_model.dart';

class data {
  static const cards = [
    CardData(
        title: 'Adventure',
        description:
            'Bored of staying home and doomscrolling through the social media, jump out of your bed here are some adventure trips for you and your friends. now plan your weekend out!!!',
        imgUrl: 'assets/images/adventure.jpg',
        color: Color.fromARGB(255, 98, 175, 238)),
    CardData(
        title: 'Pubbing',
        description:
            'Want to have a rocking party with your cloe ones we present to you pubbing, find out which pub is offering ladies night,free drinks,which are dancing pubs. have fun while getting the best price!!! ',
        imgUrl: 'assets/images/pub.jpeg',
        color: Colors.brown),
    CardData(
        title: 'Sports',
        description:
            'come on mate score a goal not a joint. go out and explore some sports places along side your friends keep yourself fit while having fun with your loved ones!!! ',
        imgUrl: 'assets/images/sports.jpg',
        color: Color.fromARGB(255, 47, 80, 179)),
  ];
}
