import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable {
  final int tabIndex;

  const NavigationState({required this.tabIndex});
}
class NavInitialState extends NavigationState{
  NavInitialState({required super.tabIndex});

  @override
  List<Object?> get props => [];

}

