import 'package:interview_app/features/grids/domain/model/api_response_model.dart';

abstract class ApiRepository{
  Future<List<ApiResponseModel>> getAllImages(int index);
}