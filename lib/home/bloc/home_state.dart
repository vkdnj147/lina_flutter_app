import 'package:linaflutterapp/models/models.dart';
import 'package:meta/meta.dart';

@immutable
class HomeState {
  final bool isLoaded;
  final bool isLoading;
  final Shipping shipping;

  HomeState({
    @required this.isLoaded,
    @required this.isLoading,
    @required this.shipping,
  });

  factory HomeState.empty() {
    return HomeState(
      isLoaded: false,
      isLoading: false,
      shipping: null,
    );
  }

  HomeState updateLoadedSuccess({
    Shipping shipping,
  }) {
    return copyWith(shipping: shipping, isLoaded: true);
  }

  HomeState copyWith({
    bool isLoaded,
    bool isLoading,
    Shipping shipping,
  }) {
    return HomeState(
      isLoaded: isLoaded ?? this.isLoaded,
      isLoading: isLoading ?? this.isLoading,
      shipping: shipping ?? this.shipping,
    );
  }
}
