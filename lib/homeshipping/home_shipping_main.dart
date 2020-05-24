import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:frogapp_flutter/homeshipping/home_shipping.dart';

import 'bloc/bloc.dart';

class HomeShippingMain extends StatefulWidget {
  HomeShippingMain({
    Key key,
  }) : super(key: key);

  State<HomeShippingMain> createState() => _HomeShippingMainState();
}

class _HomeShippingMainState extends State<HomeShippingMain> {
  HomeShippingBloc _homeShippingBloc;

  @override
  void initState() {
    super.initState();
    _homeShippingBloc = BlocProvider.of<HomeShippingBloc>(context);
    _homeShippingBloc.add(Loaded());
  }

  _submit() {
    _homeShippingBloc.add(Loaded(email: "aaaa", password: "bbbb"));
  }

  String _title;

  List<Widget> _shippings = [Text("aaaa")];
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeShippingBloc, HomeShippingState>(
      listener: (context, state) {
        if (state.isLoaded) {
          setState(() {
            _title = state.shipping.title;
          });
        }
      },
      child: BlocBuilder<HomeShippingBloc, HomeShippingState>(
        builder: (context, state) {
          return Container(
            height: 64,
//              width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: _shippings.map((item) {
                      return Container(
                        padding: EdgeInsets.only(top: 7, bottom: 12, right: 12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 0.5,
                              color: Color.fromRGBO(216, 216, 216, 1),
                            )),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Image(
                                image:
                                    AssetImage('assets/images/dump/1@3x.png'),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "판매자 승인대기 중입니다",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Bold",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "배송 예정일 : 12월 05일 - 12월 06일",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 8.0,
                                        ),
                                      ),
                                      Text(
                                        "구매",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 8.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
