import 'package:best_stories/Models/StoriesModel.dart';
import 'package:best_stories/Widgets/BackButton.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class StoryDetailsScreen extends StatelessWidget {
  static const String routeName = '/StoryDetailsScreen';
  final Results? results;
  StoryDetailsScreen({
    Key? key,
    this.results,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(
            top: 20,
            left: 10,
            right: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButtonWidget(
                onBack: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  results!.title!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              results!.multimedia!.length != 0
                  ? Container(
                      height: 170,
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: results!.multimedia!.length != 0
                                ? CachedNetworkImage(
                                    imageUrl: results!.multimedia![index].url!,
                                    placeholder: (context, url) => Center(
                                        child: Container(
                                      height: 30,
                                      width: 30,
                                      child: CircularProgressIndicator(),
                                    )),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                    fit: BoxFit.fill,
                                  )
                                : Container(),
                          );
                        },

                        // autoplay: true,

                        itemCount: results!.multimedia!.length,

                        // viewportFraction: 0.8,

                        scale: 1,

                        layout: SwiperLayout.DEFAULT,

                        pagination: new SwiperPagination(
                          builder: SwiperPagination.dots,
                          margin: const EdgeInsets.only(top: 60),
                        ),

                        //control: new SwiperControl(),
                      ),
                    )
                  : Container(),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Abstract : ',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    TextSpan(
                      text: results!.abstractArtical!,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
