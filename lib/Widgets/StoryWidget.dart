import 'package:best_stories/Models/StoriesModel.dart';
import 'package:best_stories/View/StoryDetails.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  final Results? storyData;
  StoryWidget({
    Key? key,
    this.storyData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => StoryDetailsScreen(
                results: storyData,
              ),
            ),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width * .8,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              storyData!.multimedia != null
                  ? Flexible(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              storyData!.multimedia![0].url!,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        width: double.infinity,
                      ),
                    )
                  : SizedBox(),
              Flexible(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(
                    left: 8,
                    right: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .5,
                            child: Text(
                              storyData!.title!,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .5,
                            child: Text(
                              storyData!.abstractArtical!,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .2,
                            child: Text(
                              storyData!.createdDate!,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .2,
                            child: Text(
                              storyData!.publishedDate!,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
