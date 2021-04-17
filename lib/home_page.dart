import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:desktop_app_adidas_shop/constant.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:desktop_app_adidas_shop/body_content.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Widget adidasLogo = SvgPicture.asset(
    'assets/Adidas_Logo.svg',
    height: 40.0,
  );

  final Widget youtubesvg = SvgPicture.asset(
    'assets/youtube.svg',
    height: 20.0,
    color: Color(0xE6A2A2A2),
  );

  final Widget twittersvg = SvgPicture.asset(
    'assets/twitter.svg',
    height: 20.0,
    color: Color(0xE6A2A2A2),
  );

  final Widget facebooksvg = SvgPicture.asset(
    'assets/facebook.svg',
    height: 20.0,
    color: Color(0xE6A2A2A2),
  );

  final Widget instagramsvg = SvgPicture.asset(
    'assets/instagram-logo.svg',
    height: 20.0,
    color: Color(0xE6A2A2A2),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: kMainColor,
        body: Stack(
          children: <Widget>[
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.005,
                      vertical: MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 30.0),
                      height: MediaQuery.of(context).size.height,
                      width: 90.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(9),
                          bottomLeft: Radius.circular(9),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          adidasLogo,
                          Padding(
                            padding: EdgeInsets.only(left: 14.0, right: 14.0),
                            child: menu(context),
                          ),
                          Column(
                            children: [
                              youtubesvg,
                              SizedBox(height: 20.0),
                              twittersvg,
                              SizedBox(height: 20.0),
                              facebooksvg,
                              SizedBox(height: 20.0),
                              instagramsvg,
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20.0),
                          height: 90.0,
                          width: MediaQuery.of(context).size.width * 0.928,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(9),
                            ),
                          ),
                          child: navContent(context),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.016),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 60.0, vertical: 30.0),
                          height: MediaQuery.of(context).size.height * 0.85,
                          width: MediaQuery.of(context).size.width * 0.928,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(9),
                            ),
                          ),
                          child: BodyContent(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget menu(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.007,
          width: MediaQuery.of(context).size.width * 0.08,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(5), right: Radius.circular(5)),
          ),
        ),
        SizedBox(height: 6.0),
        Container(
          height: MediaQuery.of(context).size.height * 0.007,
          width: MediaQuery.of(context).size.width * 0.08,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(5), right: Radius.circular(5)),
          ),
        ),
        SizedBox(height: 6.0),
        Container(
          height: MediaQuery.of(context).size.height * 0.007,
          width: MediaQuery.of(context).size.width * 0.08,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(5), right: Radius.circular(5)),
          ),
        ),
      ],
    );
  }

  Widget navContent(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(right: 200.0),
          child: Row(
            children: [
              MyTab(text: 'Men'),
              MyTab(text: 'Women'),
              MyTab(text: 'Kids'),
              MyTab(text: 'Sports'),
              MyTab(text: 'Brands'),
              MyTab(text: 'Release Dates'),
            ],
          ),
        ),
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.none,
            onChanged: (value) {},
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
            cursorColor: Colors.black,
            decoration: InputDecoration(
              fillColor: kMainColor,
              filled: true,
              labelText: 'Search',
              contentPadding: EdgeInsets.all(20.0),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
              ),
              suffixIcon: Icon(Feather.search, color: kBlack),
            ),
          ),
        ),
        SizedBox(width: 110.0),
        barIcon(addIcon: Feather.user),
        SizedBox(width: 20.0),
        barIcon(addIcon: Feather.shopping_bag),
        SizedBox(width: 70.0),
      ],
    );
  }

  Widget barIcon({IconData addIcon}) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: kMainColor,
      child: CircleAvatar(
        radius: 20,
        child: Icon(
          addIcon,
          color: kBlack,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class MyTab extends StatelessWidget {
  final String text;

  MyTab({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
          color: kBlack,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
