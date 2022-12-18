part of 'navbar_bloc.dart';

abstract class NavbarState extends Equatable {
  const NavbarState();

  @override
  List<Object> get props => [];
}

class NavigateToState extends NavbarState {
  final int selectedItem;
  const NavigateToState({required this.selectedItem});
}
