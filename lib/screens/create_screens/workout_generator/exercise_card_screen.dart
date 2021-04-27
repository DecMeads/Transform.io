import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:transform_dot_io/components/ScreenTitle.dart';
import 'package:transform_dot_io/components/information_modal.dart';
import 'package:transform_dot_io/models/ExerciseModel.dart';
import 'package:transform_dot_io/models/WorkoutModel.dart';
import 'package:transform_dot_io/providers/exercise_card_screen_provider.dart';
import 'my_workout_screen.dart';

// ignore: must_be_immutable
class ExerciseCardScreen extends StatelessWidget {


  Workout workout;
  List<Exercise> workoutExercises = [];
  List<String> exerciseNames;

  ExerciseCardScreen(this.workout){
    final List<Exercise> workoutExercises = this.workout.outputExerciseList;
    this.workoutExercises = workoutExercises;

    this.exerciseNames = new List(this.workoutExercises.length);

    for (int i = 0; i < this.workoutExercises.length; i++){
      this.exerciseNames[i] = this.workoutExercises[i].name;
      print(this.exerciseNames[i]);
    }

  }


  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider<ExerciseCardScreenProvider>(
      create: (_){
        return ExerciseCardScreenProvider(this.exerciseNames);
      },
      child: Consumer<ExerciseCardScreenProvider>(
        builder: (context, exerciseScreenProvider, child){
          return Scaffold(
            appBar: AppBar(
              actions: [
                FlatButton(child: Icon(Icons.timer), onPressed: (){}),
              ],
            ),
            body: Column(
              children: [
                Container(
                  height: height*0.728,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.black45,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.amber[800], width: 2)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(exerciseScreenProvider.currentExercise, style: GoogleFonts.montserrat(fontSize: 34)),
                              ),

                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text('Exercise Level: ', style: GoogleFonts.montserrat(fontSize: 14)),
                              ),
                            ],
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                            child: Container(
                              height: height*.27,
                              child: Center(
                                child: Text('Image'),
                              ),
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                            child: Container(
                              height: height*.23,
                              child: ListView.builder(
                                  itemCount: 1,
                                  itemBuilder: (BuildContext context, int index){
                                    return RaisedButton(
                                      onPressed: (){},
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.add),
                                          Text('Add Set'),
                                        ],
                                      ),
                                      color: Colors.black45,
                                      textColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                          side: BorderSide(color: Colors.amber[800])),
                                    );
                                  }
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Container(
                  height: height*.06,
                  decoration: new BoxDecoration(
                    color: Colors.black12,
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: this.workoutExercises.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.amber[800])),
                          onPressed: () {
                            exerciseScreenProvider.setCurrentExercise(this.workoutExercises[index].name);
                          },
                          color: exerciseScreenProvider.currentExercise != this.workoutExercises[index].name ? Colors.black26 : Colors.amber[800],
                          textColor: Colors.white,
                          child: Text(this.workoutExercises[index].name.toUpperCase(),
                              style: GoogleFonts.montserrat(fontSize: 12)),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            bottomNavigationBar: Container(
              height: height * 0.10,
              color: Colors.black12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    child: Text('SAVE WORKOUT', style: TextStyle(color: Colors.amber[800]),),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Text('START', style: TextStyle(color: Colors.amber[800])),
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => MyWorkoutScreen()));
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );

  }


}