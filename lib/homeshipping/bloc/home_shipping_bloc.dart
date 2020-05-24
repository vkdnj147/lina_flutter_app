import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:linaflutterapp/authentication_bloc//bloc.dart';
import 'package:linaflutterapp/models/models.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'bloc.dart';

class HomeShippingBloc extends Bloc<HomeShippingEvent, HomeShippingState> {
  final AuthenticationBloc _authenticationBloc;

  HomeShippingBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  HomeShippingState get initialState => HomeShippingState.empty();

  @override
  Stream<HomeShippingState> transformEvents(
    Stream<HomeShippingEvent> events,
    Stream<HomeShippingState> Function(HomeShippingEvent event) next,
  ) {
    return super.transformEvents(
      events.debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<HomeShippingState> mapEventToState(HomeShippingEvent event) async* {
    if (event is Loaded) {
//      print("======Loaded======== ${event.email} ::: ${event.password}");
      yield* _mapEmptyToState(event.email, event.password);
    }
  }

  Stream<HomeShippingState> _mapEmptyToState(
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
