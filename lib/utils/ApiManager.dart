import 'package:dio/dio.dart';
import 'package:flutter_api_app/models/ApiResponse.dart';
import 'package:flutter_api_app/models/Hobby.dart';

class ApiManager {
  Future<ApiResponse<List<Hobby>>> getHobbyList() async {
    Dio dio = Dio();
    var response = await dio.get('https://chat.vagatrip.com/data/hobby/list');

    ApiResponse<List<Hobby>> apiResponse =
        ApiResponse<List<Hobby>>.fromMap(response.data);
    if (apiResponse.status == "success") {
      apiResponse.data =
          (response.data['data'] as List).map((e) => Hobby.fromMap(e)).toList();
    }
    print(apiResponse.data);
    return apiResponse;
  }
}
