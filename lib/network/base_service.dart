

import 'package:http/http.dart' as http;

import '../constants/app_constants.dart';
import '../constants/enums.dart';

class BaseServices {
  Map<String,dynamic>? params;
  http.Client? httpClient;


  Future<http.Response> execute(String actionName, HttpType httpType,) async {
    try {
      print("on event fetch execute");
      var url = Uri.parse(baseUrl + actionName);
      print("req is $url");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer ${CacheManager().apiToken}'
      };
      http.Response? response;
      switch (httpType) {
        case (HttpType.get):
          response = await httpClient?.get(url,
              headers: headers); //should check httpClient is null or not, as we don't need http client everywhere
        case (HttpType.put):
          response = await http.put(url, headers: headers, body: params);
        case (HttpType.patch):
          response = await http.patch(url, headers: headers, body: params);
        case (HttpType.post):
          response = await http.post(url, headers: headers, body: params);
        case (HttpType.delete):
          response = await http.delete(url, headers: headers, body: params);
      }
      print("response =   $response");
      if (response !=null && response.statusCode == 200) {
        return response;
      }
      throw http.ClientException("Invalid response");
    }
    catch(e){
      print(e);
      throw http.ClientException("Invalid response");
    }
  }

}