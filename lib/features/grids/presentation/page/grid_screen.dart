import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:interview_app/features/grids/data/repository/api_repository_impl.dart';
import 'package:interview_app/features/grids/domain/model/api_response_model.dart';
import 'package:interview_app/features/grids/domain/repository/api_repository.dart';
import 'package:interview_app/features/grids/presentation/providers/page_index_provider.dart';
import 'package:provider/provider.dart';

class GridScreen extends StatelessWidget {

  GridScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  Container(
          child: Consumer<PageIndexProvider>(
            builder: (BuildContext context, pageIndexProvider, Widget? child) {
              return NotificationListener<ScrollNotification>(
                onNotification: (scroll){
                  if(scroll.metrics.pixels == scroll.metrics.maxScrollExtent){
                    pageIndexProvider.addPage();
                  }
                  return true;
                },
                child: SingleChildScrollView(
                  child: StaggeredGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      children: pageIndexProvider.listOfImages.map((value) {
                        return Container(
                          child: Image.network(value.url),
                        );
                      }).toList()
                  ),
                ),
              );
            },
          ),
        )
      ),
    );
  }

}
