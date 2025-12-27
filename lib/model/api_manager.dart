import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/api_constants.dart';

class ApiManager{

  static Future<SourceResponse?> getSources() async {
    Uri url = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.sourceApi,
      {'apiKey': ApiConstants.ApiKey},
    );

    try {
      //  نحط الاتصال هنا جوا try
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return SourceResponse.fromJson(json); //  هنا بنرجع النتيجة
      } else {
        print('Server error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error in getSources: $e');
      return null;
    }
  }

  /*
  https://newsapi.org/v2/everything?q=bitcoin&apiKey=33b6fd305be84f048579495295fb8fc8
   */
  static Future<NewsResponse?> getNewsbySourceid(String sourceId)async{
    Uri url= Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.newsApi,
      {'apiKey' : '33b6fd305be84f048579495295fb8fc8',
        'sources' : sourceId}
    );
    try{
      var response=await http.get(url);
        var responseBody=response.body;
        var json = jsonDecode(responseBody);
        return NewsResponse.fromJson(json);
    }catch(e){
      throw e;
    }

  }
}