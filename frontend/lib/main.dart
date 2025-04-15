import 'package:collage_campus/features/auth/presentation/pages/auth_screen.dart';
import 'package:collage_campus/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "features/events/presentation/providers/event_provider.dart";

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EventProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const CollageCampusApp(),
    ),
  );
}

class CollageCampusApp extends StatelessWidget {
  const CollageCampusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthScreen(),
    );
  }
}
