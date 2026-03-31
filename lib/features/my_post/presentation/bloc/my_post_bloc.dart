import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_post_event.dart';
part 'my_post_state.dart';

class MyPostBloc extends Bloc<MyPostEvent, MyPostState> {
  MyPostBloc() : super(MyPostInitial()) {
    on<MyPostEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
