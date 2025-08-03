import 'package:flutter/material.dart';

import './core/theme.dart';
import './views/timeline/timeline_view.dart';
import './views/test_view.dart';

class HumApp extends StatelessWidget {
  const HumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: darkTheme, home: TestView());
  }
}
