import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bbt_event.dart';
part 'bbt_state.dart';

class BbtBloc extends Bloc<BbtEvent, BbtState> {
  BbtBloc() : super(BbtInitial()) {
    on<BbtEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
