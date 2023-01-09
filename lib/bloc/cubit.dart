import 'package:counter_app_flutter_bloc/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  // to get functions and variables in bloc
  static AppCubit get(BuildContext context) => BlocProvider.of(context);
  int counter = 1;

  /// those are main function
  // add to counter
  void plus() {
    counter++;
    emit(Plus());
  }

  // lessen to counter
  void minus() {
    counter--;
    emit(Minus());
  }

  /// remove any number under zero error 
  void removeZeroError() {
    if (counter == 0) {
      counter = counter + 1;
      emit(RemoveZeroError());
    }
  }
}
