import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  int counter = 0;

  CounterCubit() : super(0);
  static CounterCubit get(context) => BlocProvider.of(context);
  void incrementNumber() {
    counter++;
    emit(counter);
  }

  void decrementNumber() {
    if (counter != 0) {
      counter--;
      emit(counter);
    }
  }
}
