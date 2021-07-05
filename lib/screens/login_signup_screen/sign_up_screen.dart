import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xC32F27),
                Color(0x780116),
                Colors.amber[800],
              ],
            )
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: CircleAvatar(
                  backgroundColor: Colors.black38.withOpacity(0),
                  minRadius: 20,
                  maxRadius: 100,
                  backgroundImage: AssetImage('lib/assets/prometheus_white_orange/full_body_white.png'),
                  child: InkWell(
                    onTap: (){

                    },
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Email'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Password'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Reenter Password'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                          color: Colors.amber[800].withOpacity(0.8),
                          minWidth: 100,
                          onPressed: (){

                          }, child:
                      Row(
                        children: [
                          Text('Sign Up', style: GoogleFonts.montserrat(),)
                        ],
                      )),
                    ),
                  ],
                ),
              ),

              FlatButton(
                  minWidth: 100,
                  onPressed: (){

                  },
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Login', style: GoogleFonts.montserrat(fontSize: 12),),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
