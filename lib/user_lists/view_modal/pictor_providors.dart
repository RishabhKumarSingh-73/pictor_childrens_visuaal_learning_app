
import 'package:children_learn_assist/user_lists/models/pixabay_model.dart';
import 'package:children_learn_assist/user_lists/models/user_error.dart';
import 'package:children_learn_assist/user_lists/repo/api_status.dart';
import 'package:children_learn_assist/user_lists/repo/datamuse_services.dart';
import 'package:children_learn_assist/user_lists/repo/pixabay_service.dart';
import 'package:children_learn_assist/user_lists/repo/random_word_service.dart';
import 'package:flutter/material.dart';

class PictorProvidor extends ChangeNotifier{

  

  bool _loading = false;
  Pixabay?  _pixabayModel ;
  List<dynamic> _datamuseModel =[];
  Pixabay? _randomWordPixabayModel ;
  List<dynamic> _randomWordDatamuseModel =[];
  UserError?  _userError ;
  String _word = 'text';
  bool isValid = true;
  String _randomWord = '';

  // PictorProvidor(){
  //   assignRandomWord();
  //   getRandomPixabayAndDatamuse();
  // }

  Future<void> assignRandomWord() async{
    var randomWordResponse =  await RandomWordServices.getRandomWord();
    if(randomWordResponse is Success){
      setRandomWord(randomWordResponse.response as List<String>);
      notifyListeners();
    }
    if(randomWordResponse is Failure){
      setUserError(randomWordResponse.errorResponse as UserError);
    }
    
  }


  void wordEntered()async{
    await getPixabayAndDatamuse();
    if (_userError == null) {
  // Assuming _datamuseModel is a list of Datamuse instances
  var firstDatamuse = _datamuseModel[0]; // Get the first Datamuse instance

  // Check if the firstDatamuse has the tags property
  if (firstDatamuse.tags[0] == 'n' || firstDatamuse.tags[0] == 'v') {
    isValid = true;
  } else {
    isValid = false;
  }
}
  }


  bool get loading => _loading;
  Pixabay? get pixabayModel => _pixabayModel;
  List<dynamic> get datamuseModel => _datamuseModel;
  Pixabay? get randomWordPixabayModel => _randomWordPixabayModel;
  List<dynamic> get randomWordDatamuseModel => _randomWordDatamuseModel;
  UserError? get userError => _userError;
  String get word => _word;
  String get randomWord => _randomWord;

  void setLoading(bool loading) async{
    _loading = loading;
    notifyListeners();
  }

  void setPixabayModel( Pixabay pixabayModel){
    _pixabayModel = pixabayModel;
  }

  void setdatamuseModel(  List<dynamic> datamuseModel){
    _datamuseModel = datamuseModel;
  }

  void setrandomWordPixabayModel( Pixabay randomWordPixabayModel){
    _randomWordPixabayModel = randomWordPixabayModel;
    
  }

  void setrandomWordDatamuseModel(  List<dynamic> randomWordDatamuseModel){
    _randomWordDatamuseModel = randomWordDatamuseModel;
   
  }

  void setUserError(UserError userError){
    _userError = userError;
  }

  void setWord(String word){
    _word = word;
  }

  void setRandomWord (List<String> randomWord){
    _randomWord = randomWord[0];
  }

  Future<void> getPixabayAndDatamuse() async{
    setLoading(true);
    var pixabayResponse = await PixabayServices.getPixabay(word);
    var datamuseResponse = await DatamuseServices.getDatamuse(word);

    if(pixabayResponse is Success && datamuseResponse is Success){
      setPixabayModel(pixabayResponse.response as Pixabay);
      setdatamuseModel(datamuseResponse.response as List<dynamic>);
    }
    else{
       if (pixabayResponse is Failure) {
      setUserError(pixabayResponse.errorResponse as UserError);
    }
    if (datamuseResponse is Failure) {
      setUserError(datamuseResponse.errorResponse as UserError);
    }
    }
    setLoading(false);
  }

  Future<void> getRandomPixabayAndDatamuse() async{
    setLoading(true);
    var pixabayResponse = await PixabayServices.getPixabay(randomWord);
    var datamuseResponse = await DatamuseServices.getDatamuse(randomWord);

    if(pixabayResponse is Success && datamuseResponse is Success){
      setrandomWordPixabayModel(pixabayResponse.response as Pixabay);
      setrandomWordDatamuseModel(datamuseResponse.response as List<dynamic>);
      
    }
    else{
       if (pixabayResponse is Failure) {
      setUserError(pixabayResponse.errorResponse as UserError);
    }
    if (datamuseResponse is Failure) {
      setUserError(datamuseResponse.errorResponse as UserError);
    }
    }
    setLoading(false);
  }
}