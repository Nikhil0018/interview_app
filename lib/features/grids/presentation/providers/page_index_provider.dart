import 'package:flutter/material.dart';
import 'package:interview_app/features/grids/data/repository/api_repository_impl.dart';
import 'package:interview_app/features/grids/domain/model/api_response_model.dart';
import 'package:interview_app/features/grids/domain/repository/api_repository.dart';


class PageIndexProvider extends ChangeNotifier{
  List<ApiResponseModel> listOfImages = [];
  ApiRepository apiRepository = ApiRepositoryImpl();
  int pageIndex = -1;

  PageIndexProvider(){
    addPage();
  }

  void addPage() async{
    ++pageIndex;
    listOfImages = listOfImages + await callApiToFetchMore();
    notifyListeners();
  }

  Future<List<ApiResponseModel>> callApiToFetchMore() async {
    return await apiRepository.getAllImages(pageIndex);
  }
}