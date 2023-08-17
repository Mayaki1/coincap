import 'package:dio/dio.dart';
import '../models/app_config.dart';
import 'package:get_it/get_it.dart';

class HTTPService{
  final Dio dio = Dio();
  
  AppConfig? _appConfig;
  String? base_url;

  HTTPService(){
    _appConfig = GetIt.instance.get<AppConfig>();
    base_url = _appConfig?.COIN_API_BASE_URL;
  }

  Future<Response?> get(String path) async {
    try{
      // https://api.coingecko.com/api/v3/coins/bitcoin
      String url = "$base_url$path";
      // print(url);
      Response response = await dio.get(url);
      // print(response);
      return response;
    } catch (e) {
      print('HTTPService:Unable to perform get request.');
      print(e);
    }
    return null;
  }
}