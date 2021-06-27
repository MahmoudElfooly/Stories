import 'package:best_stories/APIs/EndPoints.dart';
import 'package:best_stories/APIs/apiClintFormData.dart';
import 'package:best_stories/Models/StoriesModel.dart';

class APIsServices {
  static Future<StoriesModel> getStories() async {
    // Map<String, dynamic> queryParameters = {
    //   'api-key': '3mh2JkNo6RqrYZxAnNmdyvLdFnKBMfh9'
    // };
    return await getCallServiceDio(
      APIs.getStories,
      RequestTypeDio.GetStories,
     // queryParameters: queryParameters,
    );
  }
}
