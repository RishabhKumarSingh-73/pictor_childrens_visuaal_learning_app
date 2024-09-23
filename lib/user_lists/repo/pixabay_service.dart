import 'dart:io';

import 'package:children_learn_assist/user_lists/models/pixabay_model.dart';
import 'package:children_learn_assist/user_lists/repo/api_status.dart';
import 'package:children_learn_assist/user_lists/utils/constants.dart';
import 'package:http/http.dart' as http;

class PixabayServices{

  static Future<Object> getPixabay(String word) async{

    try{
      var url = Uri.parse('https://pixabay.com/api/?key=$pixabayApikey&q=$word&image_type=photo');
    var response = await http.get(url);

    if(200 == response.statusCode){
      return Success(code: 200, response: pixabayFromJson(response.body));
    }
    return Failure(code: USER_INVALID_RESPONSE, errorResponse: 'Invalid_Response');
    }
    on HttpException{
      return Failure(code: NO_INTERNET, errorResponse: 'No Internet');
    }
    on FormatException{
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    }
    catch(e){
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'uNKNOWN eRROR');
    }
    }
  }
