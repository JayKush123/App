import 'package:http/http.dart' as http;
import 'package:test/constant/constants.dart';
import 'package:test/sharedPrefs/sharedprefs.dart';

class RemoteBannerService {
  var client = http.Client();
  var remoteUrl = Constants.baseUrl + Constants.getBanners;

  Future<dynamic> get() async {
    SharedPrefs sharedPrefs = SharedPrefs();
    var usertoken = await sharedPrefs.getString(Constants.userToken);
    var response = await client.get(
      Uri.parse(remoteUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $usertoken"
      },
    );
    // var responce = await client.get(Uri.parse(remoteUrl));
    return response;
  }
}
