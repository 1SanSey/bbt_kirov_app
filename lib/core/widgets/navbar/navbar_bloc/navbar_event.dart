part of 'navbar_bloc.dart';

abstract class NavbarEvent extends Equatable {
  const NavbarEvent();

  @override
  List<Object> get props => [];
}

class NavigateToEvent extends NavbarEvent {
  final int destination;

  const NavigateToEvent({required this.destination});

  @override
  List<Object> get props => [destination];
}
