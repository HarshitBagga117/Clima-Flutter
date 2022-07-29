import 'package:http/http.dart';
import 'dart:convert';
const apiKey='3ebebbb9699699b7df883da3f7d7c8f1';

class JsonData{
  final String latitude;
  final String longitude;
  JsonData({this.latitude,this.longitude});
  Future getCityData(String loc)async{
    Response response=await get(Uri.https('api.openweathermap.org', '/data/2.5/weather',{'q':loc,'appid':apiKey,'units':'metric'}));
    if(response.statusCode==200){
      var data=response.body;
      var decodedData=jsonDecode(data);
      return decodedData;
    }
  }
  Future getData()async{
    Response response=await get(Uri.https('api.openweathermap.org', '/data/2.5/weather',{'lat':latitude,'lon':longitude,'appid':apiKey,'units':'metric'}));

    if(response.statusCode==200){
      var data=response.body;
      var decodedData=jsonDecode(data);
      return decodedData;
    }
  }

}