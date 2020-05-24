import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linaflutterapp/authentication_bloc//bloc.dart';
import 'package:linaflutterapp/homeshipping/home_shipping_main.dart';

import 'bloc/bloc.dart';
import 'home.dart';

class HomeShippingScreen extends StatelessWidget {
  HomeShippingScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider<HomeShippingBloc>(
        create: (context) => HomeShippingBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
        child: HomeShippingMain(),
      ),
    );
  }
}
