import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transform_dot_io/components/action_button.dart';
import 'package:transform_dot_io/screens/create_screens/workout_generator/set_workout_screen.dart';
import 'package:transform_dot_io/screens/create_screens/workout_generator/workout_preference_screen.dart';
import 'package:transform_dot_io/screens/create_screens/workout_generator/physique_screen.dart';
import 'package:transform_dot_io/screens/create_screens/workout_plan_generator/workout_plan_generator_physique_screen.dart';
import 'package:transform_dot_io/screens/individual_muscle_screen.dart';
import 'package:transform_dot_io/screens/login_signup_screen/login_screen.dart';

class CreateScreen extends StatelessWidget {
  String title = 'Create';


  Color color1 = Colors.blue;
  Color color2 = Colors.amber[800];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: AppBar(
            bottom: TabBar(
              labelColor: color2,
              indicatorColor: color2,
              tabs: [
                Tab(child: Text('Workout', style: GoogleFonts.montserrat())),
                Tab(child: Text('Plan', style: GoogleFonts.montserrat())),
                Tab(child: Text('Meal', style: GoogleFonts.montserrat())),
                Tab(child: Text('Meal Plan', style: GoogleFonts.montserrat())),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            PhysiqueScreen(),
            WorkoutPlanGeneratorPhysiqueScreen(),
            LoginScreen(),
            ActionButton('Generate A Meal Plan', 'Use AI and your own goals to \n generate a meal plan instantly!'),

          ],
        ),
      ),
    );
  }
}
