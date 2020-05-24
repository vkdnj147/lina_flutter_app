import 'package:linaflutterapp/models/models.dart';
import 'package:meta/meta.dart';

@immutable
class HomeShippingState {
  final bool isLoaded;
  final bool isLoading;
  final Shipping shipping;

  HomeShippingState({
    @required this.isLoaded,
    @required this.isLoading,
    @required this.shipping,
  });

  factory HomeShippingState.empty() {
    return HomeShippingState(
      isLoaded: false,
      isLoading: false,
      shipping: null,
    );
  }

  HomeShippingState updateLoadedSuccess({
    Shipping shipping,
  }) {
    return copyWith(shipping: shipping, isLoaded: true);
  }

  HomeShippingState copyWith({
    bool isLoaded,
    bool isLoading,
    Shipping shipping,
  }) {
    return HomeShippingState(
      isLoaded: isLoaded ?? this.isLoaded,
      isLoading: isLoading ?? this.isLoading,
      shipping: shipping ?? this.shipping,
    );
  }
}
