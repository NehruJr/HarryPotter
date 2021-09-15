import 'package:dio/dio.dart';

class CharacterApi{
  late Dio dio;

  CharacterApi(){
    BaseOptions options = BaseOptions(
      baseUrl: 'http://hp-api.herokuapp.com/api/',
      receiveDataWhenStatusError: true,
      connectTimeout: 30 * 1000,
      receiveTimeout: 30 * 1000,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getCharacters () async{
    try {
      Response response = await dio.get('characters');
      response.data.toString();
      return response.data;
    }catch(error){
       error.toString();
       return [];
    }
  }
}