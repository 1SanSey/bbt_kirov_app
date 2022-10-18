part of 'bbt_bloc.dart';

abstract class BbtState extends Equatable {
  const BbtState();  

  @override
  List<Object> get props => [];
}
class BbtInitial extends BbtState {}
