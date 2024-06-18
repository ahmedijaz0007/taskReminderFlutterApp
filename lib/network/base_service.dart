

import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';

import '../constants/app_constants.dart';
import '../constants/enums.dart';
import 'interceptors.dart';

class BaseServices {
  Map<String,dynamic>? params;
  http.Client? httpClient;

  BaseServices():  httpClient = InterceptedClient.build(interceptors: [LoggingInterceptor()]);



  Future<http.Response> execute(String actionName, HttpType httpType,) async {
    try {
      print("on event fetch execute");
      var url = Uri.parse(baseUrl + actionName);
      print("req is $url");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
         'Authorization': 'Bearer $apiToken'
      };
      http.Response? response;
      switch (httpType) {
        case (HttpType.get):
          response = await httpClient?.get(url,
              headers: headers); //should check httpClient is null or not, as we don't need http client everywhere
        case (HttpType.put):
          response = await httpClient?.put(url, headers: headers, body: params);
        case (HttpType.patch):
          response = await httpClient?.patch(url, headers: headers, body: params);
        case (HttpType.post):
          response = await httpClient?.post(url, headers: headers, body: params);
        case (HttpType.delete):
          response = await httpClient?.delete(url, headers: headers, body: params);
      }
    //  print("response =   $response");
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