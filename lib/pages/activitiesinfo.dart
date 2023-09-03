import 'package:flutter/material.dart';
import 'package:myfunbook/data/adventure_data.dart';
import 'package:myfunbook/models/activities_data_model.dart';
import 'package:myfunbook/models/card_data_model.dart';
import 'package:myfunbook/widget/activity_widget.dart';

class activitiesscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Activities')),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: AdventureData.AdventureActivities.length,
                  itemBuilder: (context, index) {
                    final activities = AdventureData.AdventureActivities[index];
                    return ActivityWidget(
                        title: activities.Title, urlImage: activities.ImageUrl);
                  }),
            ),
          ],
        ));
  }
}
