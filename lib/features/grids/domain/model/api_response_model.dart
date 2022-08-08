import 'package:equatable/equatable.dart';

class ApiResponseModel extends Equatable{
  late final String id;
  late final String url;
  late final int width;
  late final int height;

  ApiResponseModel(this.id, this.url, this.width, this.height);

  ApiResponseModel.fromJson( Map<String,dynamic> json){
    id = json['id'];
    url = json['url'];
    width = json['width'];
    height = json['height'];
  }

  @override
  List<Object?> get props => [id, url, width, height];

}