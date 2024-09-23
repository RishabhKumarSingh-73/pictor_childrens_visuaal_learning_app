import 'package:children_learn_assist/main.dart';
import 'package:children_learn_assist/user_lists/utils/appbar.dart';
import 'package:children_learn_assist/user_lists/utils/navigator_utils.dart';
import 'package:children_learn_assist/user_lists/view_modal/pictor_providors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() { 
    super.initState();
    hehe();
  }

void hehe()async{
  await Provider.of<PictorProvidor>(context,listen: false).assignRandomWord();
    await Provider.of<PictorProvidor>(context,listen: false).getRandomPixabayAndDatamuse();
}
 

  @override
  Widget build(BuildContext context) {
    final TextEditingController word = TextEditingController();
    PictorProvidor pictorProvider = context.watch<PictorProvidor>();
    return Scaffold(
      appBar: MyAppBar.myAppBar('home'),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: word,
              decoration: InputDecoration(
                hintText: 'enter the word',
                suffixIcon: IconButton(onPressed: (){
                  pictorProvider.setWord(word.text);
                  pictorProvider.wordEntered();
                  openParticularWordPage(context);
                }, icon: Icon(Icons.check))
              ),
            ),
          ),

          Container(
            height: 400,
            width: 400,
            child: Column(
              children: [
                Text(pictorProvider.randomWord),
                SizedBox(height: 20,),

                _ui(pictorProvider)
              ],
            ),
          )
        ],
      ),
    );
  }

  _ui(pictorProvider) {
  if (pictorProvider.loading) {
    return Center(child: CircularProgressIndicator());
  } else if (pictorProvider.userError != null) {
    return Container(child: Text('Error: ${pictorProvider.userError?.message}'));
  } else {
    if (pictorProvider.isValid) {
      // Check if randomWordPixabayModel is not null and if hits is not null
      if (pictorProvider.randomWordPixabayModel == null ||
          pictorProvider.randomWordPixabayModel.hits == null ||
          pictorProvider.randomWordPixabayModel.hits.isEmpty) {
        return Center(child: CircularProgressIndicator());
      } else {
        return Expanded(
          child: ListView.builder(
            itemCount: pictorProvider.randomWordPixabayModel.hits.length,
            itemBuilder: (context, index) {
              return Image(
                image: NetworkImage(
                    pictorProvider.randomWordPixabayModel.hits[index].webformatUrl),
              );
            },
          ),
        );
      }
    } else {
      return Container(child: Text('Invalid word or no data found.'));
    }
  }
}

}