import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:keyofscience/presentation/resources/App.dart';
import 'package:share/share.dart';

class AppUtils {
  ///Build a dynamic link firebase
  static Future<String> buildDynamicLink({required String  postId,title,description,image}) async {
    String url = app.url;
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: url,
      link: Uri.parse('$url/post/$postId'),
      androidParameters: AndroidParameters(
        packageName: app.packageName,
        minimumVersion: 0,
      ),
      iosParameters: IosParameters(
        bundleId:  app.packageName,
        minimumVersion: '0',
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
          description: description,
          imageUrl: Uri.parse(image ==''? "https://storage.googleapis.com/cms-storage-bucket/847ae81f5430402216fd.svg": image),
          title: title),
    );
    final ShortDynamicLink dynamicUrl = await parameters.buildShortLink();
    await Share.share(dynamicUrl.shortUrl.toString());
    print(dynamicUrl.shortUrl.toString());
    return dynamicUrl.shortUrl.toString();
  }
}