// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Datamuse> datamuseFromJson(String str) => List<Datamuse>.from(json.decode(str).map((x) => Datamuse.fromJson(x)));
String datamuseToJson(List<Datamuse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Datamuse {
    String word;
    int score;
    List<String> tags;

    Datamuse({
        required this.word,
        required this.score,
        required this.tags,
    });

    factory Datamuse.fromJson(Map<String, dynamic> json) => Datamuse(
        word: json["word"],
        score: json["score"],
        tags: List<String>.from(json["tags"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "word": word,
        "score": score,
        "tags": List<dynamic>.from(tags.map((x) => x)),
    };
}
