import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'app/utlis.dart';

void main() {
  setupLogger();
  runApp(ProviderScope(child: const GoogleDocsApp()));
}
