import 'option_model.dart';

class QuestionModel {
  QuestionModel({
    required this.question,
    required this.options,
    required this.questionImageUrl,
    required this.correctAnswer,
    required this.type,
    required this.score,
  });
  late final String question;
  late final List<OptionModel> options;
  late final String? questionImageUrl;
  late final String correctAnswer;
  late final String? type;
  late final int score;

  QuestionModel.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    options = [];
    json['answers'].forEach(
        (key, value) => {options.add(OptionModel(key: key, value: value))});

    //shuffling options
    options.shuffle();
    //If any of the option contains following value then it should be moved to the last of the list
    int index = options.indexWhere((element) =>
        element.value == 'All of the above' ||
        element.value == 'None of the above');
    if (index != -1) {
      final removedItem = options.removeAt(index);
      options.add(removedItem);
    }

    ///**********///
    questionImageUrl = json['questionImageUrl'];
    correctAnswer = json['correctAnswer'];
    type = json['type'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['question'] = question;
    _data['answers'] = options;
    _data['questionImageUrl'] = questionImageUrl;
    _data['correctAnswer'] = correctAnswer;
    _data['type'] = type;
    _data['score'] = score;
    return _data;
  }
}
