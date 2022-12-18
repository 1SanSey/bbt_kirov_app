import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(const NavigateToState(selectedItem: 0)) {
    on<NavigateToEvent>((event, emit) {
      emit(NavigateToState(selectedItem: event.destination));
    });
  }
}
