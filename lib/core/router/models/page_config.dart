import 'package:quiz_assingments/core/router/models/page_keys.dart';
import 'package:quiz_assingments/core/router/models/page_paths.dart';

import '../pages.dart';

class PageConfigs {
  static PageConfiguration splashPageConfig = const PageConfiguration(
      key: PageKeys.splashPageKey,
      path: PagePaths.splashPagePath,
      uiPage: Pages.splashPage);

  static PageConfiguration dashboardPageConfig = const PageConfiguration(
      key: PageKeys.dashboardPageKey,
      path: PagePaths.dashboardPagePath,
      uiPage: Pages.dashboardPage);

  static PageConfiguration quizPageConfig = const PageConfiguration(
      key: PageKeys.quizPageKey,
      path: PagePaths.quizPagePath,
      uiPage: Pages.quizPage);
}
