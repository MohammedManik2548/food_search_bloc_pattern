import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable{}

class NavTabChange extends NavigationEvent{
  final int tabIndex;

  NavTabChange({required this.tabIndex});

  @override
  List<Object?> get props => [];
}