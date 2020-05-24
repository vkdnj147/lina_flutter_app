import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:linaflutterapp/authentication_bloc//bloc.dart';
import 'package:linaflutterapp/models/models.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'bloc.dart';

class HomeShippingBloc extends Bloc<HomeEvent, HomeState> {
  final AuthenticationBloc _authenticationBloc;

  HomeShippingBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  HomeState get initialState => HomeState.empty();

  @override
  Stream<HomeState> transformEvents(
    Stream<HomeEvent> events,
    Stream<HomeState> Function(HomeEvent event) next,
  ) {
    return super.transformEvents(
      events.debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is Loaded) {
//      print("======Loaded======== ${event.email} ::: ${event.password}");
      yield* _mapEmptyToState(event.email, event.password);
    }
  }

  Stream<HomeState> _mapEmptyToState(
      String email, String password) async* {
    try {
      final shipping = new Shipping(id: 1, title: "HhHHHHHH");
//      print("======shipping======== ${shipping}");
      yield state.updateLoadedSuccess(shipping: shipping);
    } catch (e) {
      print("]-----] error [-----[ ${e}");
    }
  }
}
