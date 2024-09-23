import 'package:children_learn_assist/user_lists/utils/appbar.dart';
import 'package:children_learn_assist/user_lists/view_modal/pictor_providors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ParticularWordPage extends StatelessWidget {
  const ParticularWordPage({super.key});

  @override
  Widget build(BuildContext context) {
    PictorProvidor pictorProvider = context.watch<PictorProvidor>();
    return Scaffold(
      appBar: MyAppBar.myAppBar('word'),

      body: Column(
        children: [_ui(pictorProvider)],
      ),
    );
  }

  _ui(pictorProvider){
    if(pictorProvider.loading){
      return Center(child: CircularProgressIndicator());
    }
    else if(pictorProvider.userError != null){
      return Container(child: Text('1data'),);
    }
    else{
      if(pictorProvider.isValid){
        return Expanded(
          child: ListView.builder(
            itemCount: pictorProvider.pixabayModel.hits.length,
            itemBuilder: (context,Index){
              return Image(image: NetworkImage(pictorProvider.pixabayModel.hits[Index].webformatUrl));
          }
          ),
        );
      }
      else{
        return Container(child: Text('data'),);
      }
    }
  }
}