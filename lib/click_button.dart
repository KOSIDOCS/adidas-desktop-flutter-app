import 'package:flutter/material.dart';
import 'package:desktop_app_adidas_shop/constant.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ClickButton extends StatefulWidget {
  final String img;

  ClickButton({@required this.img});

  @override
  _ClickButtonState createState() => _ClickButtonState();
}

class _ClickButtonState extends State<ClickButton> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isCheck = !isCheck;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.101,
        width: MediaQuery.of(context).size.width * 0.05,
        margin: EdgeInsets.all(13.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: kMainText.withOpacity(0.1),
                blurRadius: 5.0,
                spreadRadius: 1.5,
                offset: Offset.fromDirection(2.0)),
            BoxShadow(
                color: kMainText.withOpacity(0.1),
                blurRadius: 5.0,
                spreadRadius: 2.0,
                offset: Offset.fromDirection(2.0)),
            BoxShadow(
                color: kMainText.withOpacity(0.1),
                blurRadius: 5.0,
                spreadRadius: 4.0,
                offset: Offset.fromDirection(2.0)),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: kMainColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Image.asset(
                'assets/${widget.img}',
                alignment: Alignment(0.3, -4.2),
                isAntiAlias: true,
                filterQuality: FilterQuality.medium,
                scale: 8.0,
                fit: BoxFit.none,
              ),
            ),
            isCheck == true
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: kOverlayText.withOpacity(0.7),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Feather.check,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
