import 'package:http/http.dart' as http;
import 'package:test/constant/constants.dart';

class RemoteProductService {
  var client = http.Client();
  var remoteUrl = Constants.baseUrl + Constants.getProducts;

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse(remoteUrl));
    return response;
  }
}
