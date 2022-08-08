import 'dart:convert';

import 'package:interview_app/features/grids/domain/model/api_response_model.dart';
import 'package:interview_app/features/grids/domain/repository/api_repository.dart';
import 'package:http/http.dart' as http;

class ApiRepositoryImpl extends ApiRepository{

  var client = http.Client();

  @override
  Future<List<ApiResponseModel>> getAllImages(int index) async {
    final String _baseUrl = 'api.thecatapi.com';
    final String _charactersPath = '/v1/images/search';
    final Map<String, String> _queryParameters = <String, String>{
      'limit': '100',
      'page': index.toString(),
      'order': 'Desc'
    };
    var url = Uri.https(_baseUrl, _charactersPath, _queryParameters);

    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    List<ApiResponseModel> listOfImages = [];
    responseBody.forEach((json){
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(json);
      listOfImages.add(apiResponseModel);
    });
    return listOfImages;
  }

}