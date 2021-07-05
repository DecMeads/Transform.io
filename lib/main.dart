import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transform_dot_io/providers/screen_provider.dart';
import 'package:transform_dot_io/screens/create_screens/create_screen.dart';
import 'package:google_fonts/google_fonts.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transform.io',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),

      home: ChangeNotifierProvider(
          create: (_) => ScreenProvider() ,
          child: CurrentPage()),
    );
  }
}

// ignore: must_be_immutable
class CurrentPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Consumer<ScreenProvider>(
      builder: (context, screenProvider, child){
        return Scaffold(
          appBar: AppBar(
              title: Text(screenProvider.currentTitle(), style: GoogleFonts.montserrat(),),
            actions: [
              IconButton(icon: Icon(Icons.account_circle_sharp), onPressed: (){},),
            ],
          ),
          body: screenProvider.currentPage(),
          bottomNavigationBar: BottomNavigationBar(
            items: screenProvider.bottomNavigationBarItems,
            currentIndex: screenProvider.currentPageIndex,
            selectedItemColor: Colors.amber[800],
            onTap: screenProvider.changePage,
          ),
        );
      }
    );
  }
}
