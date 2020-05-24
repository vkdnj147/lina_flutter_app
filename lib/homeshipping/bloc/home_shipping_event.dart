import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class HomeShippingEvent extends Equatable {
  const HomeShippingEvent();

  @override
  List<Object> get props => [];
}

class Loaded extends HomeShippingEvent {
  final String email;
  final String password;

  const Loaded({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [email, password];

  @override
  String toString() {
    return 'Loaded';
  }
}
