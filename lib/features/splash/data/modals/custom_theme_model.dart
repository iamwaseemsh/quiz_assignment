class GetCustomThemeResponseModel {
  GetCustomThemeResponseModel({
    required this.typography,
    required this.colors,
    required this.id,
  });
  late final TypographyModel typography;
  late final ColorsModel colors;
  late final String id;

  GetCustomThemeResponseModel.fromJson(Map<String, dynamic> json) {
    typography = TypographyModel.fromJson(json['typography']);
    colors = ColorsModel.fromJson(json['colors']);
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['typography'] = typography.toJson();
    _data['colors'] = colors.toJson();
    _data['id'] = id;
    return _data;
  }
}

class TypographyModel {
  TypographyModel({
    required this.actionBarTitle,
    required this.screenTitle,
    required this.question,
    required this.answers,
    required this.subtitles,
  });
  late final ActionBarTitle actionBarTitle;
  late final ScreenTitle screenTitle;
  late final Question question;
  late final Answers answers;
  late final Subtitles subtitles;

  TypographyModel.fromJson(Map<String, dynamic> json) {
    actionBarTitle = ActionBarTitle.fromJson(json['action_bar_title']);
    screenTitle = ScreenTitle.fromJson(json['screen_title']);
    question = Question.fromJson(json['question']);
    answers = Answers.fromJson(json['answers']);
    subtitles = Subtitles.fromJson(json['subtitles']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['action_bar_title'] = actionBarTitle.toJson();
    _data['screen_title'] = screenTitle.toJson();
    _data['question'] = question.toJson();
    _data['answers'] = answers.toJson();
    _data['subtitles'] = subtitles.toJson();
    return _data;
  }
}

class ActionBarTitle {
  ActionBarTitle({
    required this.fontFamily,
    required this.fontSize,
    required this.fontWeight,
    required this.lineHeight,
    required this.textAlign,
    required this.textColor,
  });
  late final String fontFamily;
  late final String fontSize;
  late final String fontWeight;
  late final String lineHeight;
  late final String textAlign;
  late final String textColor;

  ActionBarTitle.fromJson(Map<String, dynamic> json) {
    fontFamily = json['font_family'];
    fontSize = json['font_size'];
    fontWeight = json['font_weight'];
    lineHeight = json['line_height'];
    textAlign = json['text_align'];
    textColor = json['text_color'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['font_family'] = fontFamily;
    _data['font_size'] = fontSize;
    _data['font_weight'] = fontWeight;
    _data['line_height'] = lineHeight;
    _data['text_align'] = textAlign;
    _data['text_color'] = textColor;
    return _data;
  }
}

class ScreenTitle {
  ScreenTitle({
    required this.fontFamily,
    required this.fontSize,
    required this.fontWeight,
    required this.lineHeight,
    required this.textAlign,
    required this.textColor,
  });
  late final String fontFamily;
  late final String fontSize;
  late final String fontWeight;
  late final String lineHeight;
  late final String textAlign;
  late final String textColor;

  ScreenTitle.fromJson(Map<String, dynamic> json) {
    fontFamily = json['font_family'];
    fontSize = json['font_size'];
    fontWeight = json['font_weight'];
    lineHeight = json['line_height'];
    textAlign = json['text_align'];
    textColor = json['text_color'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['font_family'] = fontFamily;
    _data['font_size'] = fontSize;
    _data['font_weight'] = fontWeight;
    _data['line_height'] = lineHeight;
    _data['text_align'] = textAlign;
    _data['text_color'] = textColor;
    return _data;
  }
}

class Question {
  Question({
    required this.fontFamily,
    required this.fontSize,
    required this.fontWeight,
    required this.lineHeight,
    required this.textAlign,
    required this.textColor,
  });
  late final String fontFamily;
  late final String fontSize;
  late final String fontWeight;
  late final String lineHeight;
  late final String textAlign;
  late final String textColor;

  Question.fromJson(Map<String, dynamic> json) {
    fontFamily = json['font_family'];
    fontSize = json['font_size'];
    fontWeight = json['font_weight'];
    lineHeight = json['line_height'];
    textAlign = json['text_align'];
    textColor = json['text_color'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['font_family'] = fontFamily;
    _data['font_size'] = fontSize;
    _data['font_weight'] = fontWeight;
    _data['line_height'] = lineHeight;
    _data['text_align'] = textAlign;
    _data['text_color'] = textColor;
    return _data;
  }
}

class Answers {
  Answers({
    required this.fontFamily,
    required this.fontSize,
    required this.fontWeight,
    required this.lineHeight,
    required this.textAlign,
    required this.textColor,
  });
  late final String fontFamily;
  late final String fontSize;
  late final String fontWeight;
  late final String lineHeight;
  late final String textAlign;
  late final String textColor;

  Answers.fromJson(Map<String, dynamic> json) {
    fontFamily = json['font_family'];
    fontSize = json['font_size'];
    fontWeight = json['font_weight'];
    lineHeight = json['line_height'];
    textAlign = json['text_align'];
    textColor = json['text_color'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['font_family'] = fontFamily;
    _data['font_size'] = fontSize;
    _data['font_weight'] = fontWeight;
    _data['line_height'] = lineHeight;
    _data['text_align'] = textAlign;
    _data['text_color'] = textColor;
    return _data;
  }
}

class Subtitles {
  Subtitles({
    required this.fontFamily,
    required this.fontSize,
    required this.fontWeight,
    required this.lineHeight,
    required this.textAlign,
    required this.textColor,
  });
  late final String fontFamily;
  late final String fontSize;
  late final String fontWeight;
  late final String lineHeight;
  late final String textAlign;
  late final String textColor;

  Subtitles.fromJson(Map<String, dynamic> json) {
    fontFamily = json['font_family'];
    fontSize = json['font_size'];
    fontWeight = json['font_weight'];
    lineHeight = json['line_height'];
    textAlign = json['text_align'];
    textColor = json['text_color'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['font_family'] = fontFamily;
    _data['font_size'] = fontSize;
    _data['font_weight'] = fontWeight;
    _data['line_height'] = lineHeight;
    _data['text_align'] = textAlign;
    _data['text_color'] = textColor;
    return _data;
  }
}

class ColorsModel {
  ColorsModel({
    required this.primary,
    required this.onSuccess,
    required this.onError,
  });
  late final String primary;
  late final String onSuccess;
  late final String onError;

  ColorsModel.fromJson(Map<String, dynamic> json) {
    primary = json['primary'];
    onSuccess = json['on_success'];
    onError = json['on_error'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['primary'] = primary;
    _data['on_success'] = onSuccess;
    _data['on_error'] = onError;
    return _data;
  }
}
