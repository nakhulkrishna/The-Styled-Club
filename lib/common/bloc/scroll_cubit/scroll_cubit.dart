import 'package:flutter_bloc/flutter_bloc.dart';

class ScrollIndexCubit extends Cubit<int> {
  ScrollIndexCubit() : super(0);

  void updateIndex(int index) => emit(index);
}
