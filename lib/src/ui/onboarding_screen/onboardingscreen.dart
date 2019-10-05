import 'package:active_edge_developer_exercise/src/ui/homescreen.dart';
import 'package:active_edge_developer_exercise/src/ui/onboarding_screen/pageViewDotsIndicator.dart';
import 'package:active_edge_developer_exercise/src/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



class OnboardingScreen extends StatefulWidget {
  final SharedPreferences preferences;
  final http.Client client;

  OnboardingScreen(
    this.preferences,
    this.client,
  );

  static const String routeName = '/onBoardingScreen';

  @override
  State<StatefulWidget> createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = new PageController();
  final List<Widget> _pages = [
    Page1(),
    Page2(),
    Page3(),
  ];
  int page = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    // TODO: implement build
    bool isDone = page == _pages.length - 1;
    return new Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          color: Colors.white,
          child: new Column(
            children: <Widget>[
              Container(
                height: mediaQuery.size.height * 0.92,
                child: new PageView.builder(
                  physics: new AlwaysScrollableScrollPhysics(),
                  controller: _controller,
                  itemCount: _pages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _pages[index % _pages.length];
                  },
                  onPageChanged: (int p) {
                    setState(() {
                      page = p;
                    });
                  },
                ),
              ),
              new Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  isDone
                      ? Container(
                          width: 150.0,
                          height: 50.0,
                        )
                      : Container(
                          width: 150.0,
                          height: 50.0,
                          child: FlatButton(
                            child: Text(
                              'Next',
                              style:
                                  TextStyle(color: primaryColor, fontSize: 17),
                            ),
                            onPressed: () {
                              _controller.animateToPage(page + 1,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            },
                          )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PageViewDotsIndicator(
                      controller: _controller,
                      itemCount: _pages.length,
                      color: primaryColor,
                      onPageSelected: (int page) {
                        _controller.animateToPage(
                          page,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                    ),
                  ),
                  new Container(
                      width: 150.0,
                      height: 50.0,
                      child: FlatButton(
                        child: Text(
                          isDone ? 'Start' : 'Skip',
                          style: TextStyle(color: primaryColor, fontSize: 17),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen(
                                      widget.preferences,
                                      widget.client,
                                    ),
                                settings: const RouteSettings(
                                    name: HomeScreen.routeName)),
                          );
                        },
                      )),
                ],
              ),
            ],
          ),
        ));
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          new Positioned.fill(
            child: Column(
              children: <Widget>[
                SizedBox(
                  child: Container(
//                    decoration: new BoxDecoration(
//                      image: DecorationImage(
//                        image: AssetImage(Assets.whitepages_logo),
//                        fit: BoxFit.fill,
//                      ),
//                    ),
//                    child: Opacity(
//                      child: Container(
//                        color: themeColor,
//                      ),
//                      opacity: 0.3,
//                    ),
                      ),
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: double.infinity,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 60),
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      'What are you, \nLooking for?',
                      style: Theme.of(context).textTheme.display1.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
        alignment: FractionalOffset.center,
      ),
    );
  }
}

const double IMAGE_SIZE_PAGE_2 = 200.0;

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          new Positioned.fill(
            child: Column(
              children: <Widget>[
                SizedBox(
//                  child: Image(
//                    image: AssetImage(Assets.whitepages_logo),
//                    fit: BoxFit.fill,
//                  ),
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: double.infinity,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 60),
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: Text(
                      'Search it, \nFind it',
                      style: Theme.of(context).textTheme.display1.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
        alignment: FractionalOffset.center,
      ),
    );
  }
}

const double IMAGE_SIZE_PAGE_3 = 300.0;

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          new Positioned.fill(
            child: Column(
              children: <Widget>[
                SizedBox(
//                  child: Image(
//                    image: AssetImage(Assets.whitepages_logo),
//                    fit: BoxFit.fill,
//                  ),
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: double.infinity,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 60),
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: Text(
                      'Lets go',
                      style: Theme.of(context).textTheme.display1.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
        alignment: FractionalOffset.center,
      ),
    );
  }
}
