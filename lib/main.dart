import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_review/pages/rate_dialog_page.dart';
import 'package:flutter_app_review/widget/rate_app_init_widget.dart';
import 'package:rate_my_app/rate_my_app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Flutter Rate My App';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: title,
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.indigo),
    home: RateAppInitWidget(
      builder: (rateMyApp) => HomePage(rateMyApp: rateMyApp,title: "Flutter Rate My App"),
    ),
  );
}

class HomePage extends StatefulWidget {
  final RateMyApp rateMyApp;
  final String title;

  const HomePage({
    Key? key,
    required this.rateMyApp,
    required this.title
  }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text(widget.rateMyApp.toString())),
      body: RateDialogPage(rateMyApp: widget.rateMyApp));
}