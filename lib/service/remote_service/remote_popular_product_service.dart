import 'package:http/http.dart' as http;
import 'package:test/constant/constants.dart';
import 'package:test/sharedPrefs/sharedprefs.dart';

class RemotePopularProductService {
  var client = http.Client();
  var remoteUrl = Constants.baseUrl + Constants.getProducts;

  Future<dynamic> getProduct() async {
    SharedPrefs sharedPrefs = SharedPrefs();
    var usertoken = await sharedPrefs.getString(Constants.userToken);
    var response = await client.post(
      Uri.parse(remoteUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $usertoken"
      },
    );
    return response;
  }
}
