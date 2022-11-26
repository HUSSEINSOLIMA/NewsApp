import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../DIO/chacedHelper.dart';

part 'app_cubit_state.dart';

class AppCubit extends Cubit<AppCubitState> {
  AppCubit() : super(AppCubitInitial());
  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  void modeStates() {
    isDark = !isDark;
    // ChachweHelper.putBoolan(key: 'isDark', value: isDark).then((value) {

    //});
    emit(NewsChangeMode());
  }
}
