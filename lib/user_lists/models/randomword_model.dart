import 'dart:convert';

List<String> randomWordFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));

String randomWordToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));

// class RandomWord{
//   String word;

//   RandomWord({
//     required this.word
//   });

//   factory RandomWord.fromJson(List<String> json) => RandomWord(
//         word: json[0]
//     );
// }