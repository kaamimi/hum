import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './app.dart';

// FIXME: Padding EdgeInsets to be in constants.dart

void main() => runApp(ProviderScope(child: const HumApp()));
