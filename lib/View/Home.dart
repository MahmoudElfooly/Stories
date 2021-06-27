import 'package:best_stories/ViewModel/GetStories.dart';
import 'package:best_stories/Widgets/StoryWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  static const String routeName = '/';
  @override
  Widget build(BuildContext context) {
    final getStoriesController = Provider.of<GetStoriesData>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            top: 20,
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
            future: getStoriesController.getStories(),
            builder: (_, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'NYT BEST STORIES',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ...getStoriesController.stories!
                                .map((e) => StoryWidget(
                                      storyData: e,
                                    ))
                                .toList(),
                          ],
                        ),
                      ),
          ),
        ),
      ),
    );
  }
}
