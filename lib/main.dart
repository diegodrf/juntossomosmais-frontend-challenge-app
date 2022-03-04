import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:juntossomosmais_app/providers/app_provider.dart';
import 'package:juntossomosmais_app/screens/member_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const JuntosSomosMaisApp());
}

class JuntosSomosMaisApp extends StatelessWidget {
  const JuntosSomosMaisApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AppProvider(),
      child: MaterialApp(
        initialRoute: MemberListScreen.router,
        routes: {
          MemberListScreen.router: (context) => const MemberListScreen()
        },
      ),
    );
  }
}
