import 'package:best_stories/APIs/Services.dart';
import 'package:best_stories/APIs/apiClintFormData.dart';
import 'package:best_stories/Models/StoriesModel.dart';
import 'package:best_stories/Utility/commun.dart';
import 'package:flutter/cupertino.dart';

class GetStoriesData with ChangeNotifier {
  List<Results>? _stories = [];
  List<Results>? get stories => _stories;
  Future getStories() async {
    await APIsServices.getStories().then((value) {
      if (value.status == 'OK') {
        _stories = value.results;
      } else {
        Commun.showToast('Somthing Went Wrong ');
      }
    }).catchError((error) {
      Commun.showToast(genericHandleErrorResponse(error));
    });
  }
}
