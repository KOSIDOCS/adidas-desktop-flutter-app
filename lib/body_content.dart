import 'package:flutter/material.dart';
import 'package:desktop_app_adidas_shop/constant.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:desktop_app_adidas_shop/click_button.dart';
import 'package:desktop_app_adidas_shop/drop_down.dart';
import 'dart:math' as math;

class BodyContent extends StatefulWidget {
  @override
  _BodyContentState createState() => _BodyContentState();
}

class _BodyContentState extends State<BodyContent> {
  final ScrollController _controller = ScrollController();

  bool item1 = false;

  bool isCheck = false;

  bool liked = false;

  final Widget main = SvgPicture.asset(
    'assets/main.svg',
    height: 750.0,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          scrollImage(context),
          displayProduct(context),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Text(
                  'MEN\'S ESSENTIALS',
                  style: TextStyle(
                    color: kHeadText,
                  ),
                ),
              ),
              SizedBox(
                height: 17.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Text(
                  'Daily 2.0 Shoes',
                  style: TextStyle(
                    color: kMainText,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(height: 18.0),
              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Row(
                  children: [
                    Icon(Ionicons.md_star, color: kMainText, size: 21.0),
                    Icon(Ionicons.md_star, color: kMainText, size: 21.0),
                    Icon(Ionicons.md_star, color: kMainText, size: 21.0),
                    Icon(Ionicons.md_star, color: kMainText, size: 21.0),
                    Icon(Feather.star, color: kMainText, size: 16.0),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Text(
                  '\$60',
                  style: TextStyle(
                    color: kMainText,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(height: 35.0),
              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Text(
                  'AVAILABLE COLORS',
                  style: TextStyle(
                    color: kMainText,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(height: 19.0),
              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Text(
                  'CORE BLACK / CORE BLACK / CLOUD WHITE',
                  style: TextStyle(
                    color: kHeadText,
                    fontSize: 10.0,
                  ),
                ),
              ),
              SizedBox(height: 17.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClickButton(img: 'main.png'),
                  ClickButton(img: 'color1.png'),
                  ClickButton(img: 'color2.png'),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  MyDropDown(text: 'SELECT SIZE'),
                  MyDropDown(text: 'QTY'),
                ],
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: Row(
                  children: [
                    barIcon(addIcon: Feather.heart),
                    addBag(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget barIcon({IconData addIcon}) {
    return InkWell(
      onTap: () {
        setState(() {
          liked = !liked;
        });
      },
      child: Container(
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
          borderRadius: BorderRadius.all(Radius.circular(100.0)),
        ),
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 24,
            child: Icon(
              addIcon,
              color: liked ? Colors.red.shade500 : kOverlayText,
            ),
            backgroundColor: kMainColor,
          ),
        ),
      ),
    );
  }

  Widget addBag() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.15,
        margin: EdgeInsets.all(13.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: kBlack,
          borderRadius: BorderRadius.all(Radius.circular(100.0)),
        ),
        child: Row(
          children: [
            Text(
              'ADD TO BAG',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
            Spacer(),
            Icon(Feather.chevron_right, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget scrollImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.14,
      padding: EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        color: kMainColor,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: Column(
        children: [
          scrollButton(addIcon: Feather.chevron_up, loc: _moveUp),
          Container(
            height: MediaQuery.of(context).size.height * 0.508,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.symmetric(vertical: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
            child: ListView(
              controller: _controller,
              children: [
                InkWell(
                  onTap: () => {item1 = true},
                  child: imgBackground(img: 'main5.png', scale: 1.3),
                ),
                imgBackground(img: 'main2.png', scale: 4.0),
                imgBackground(img: 'main3.png', scale: 1.6),
                imgBackground(img: 'main6.png', scale: 1.6),
                imgBackground(img: 'main4.png', scale: 1.6),
                imgBackground(img: 'main.png', scale: 4.3),
              ],
            ),
          ),
          scrollButton(addIcon: Feather.chevron_down, loc: _moveDown)
        ],
      ),
    );
  }

  Widget scrollButton({IconData addIcon, Function loc}) {
    return InkWell(
      onTap: loc,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(100.0)),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: kMainColor,
            borderRadius: BorderRadius.all(Radius.circular(100.0)),
          ),
          child: Icon(addIcon, color: kBlack),
        ),
      ),
    );
  }

  Widget imgBackground({@required String img, @required double scale}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 9.0, right: 9.0, top: 9.0),
      decoration: BoxDecoration(
        color: kMainColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Image.asset(
        'assets/$img',
        alignment: Alignment(0, -0.4),
        isAntiAlias: true,
        filterQuality: FilterQuality.medium,
        scale: scale,
        fit: BoxFit.none,
      ),
    );
  }

  void _moveUp() {
    _controller.animateTo(
      0,
      duration: Duration(seconds: 2),
      curve: Curves.easeInOut,
    );
  }

  void _moveDown() {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        _controller.animateTo(
          _controller.position.maxScrollExtent,
          duration: Duration(seconds: 2),
          curve: Curves.easeOut,
        );
      },
    );
  }

  // full dsiplay of the product.
  Widget displayProduct(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 650.0,
          width: 650.0,
          margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 0.0),
          padding: EdgeInsets.all(100.0),
          decoration: BoxDecoration(color: kMainColor, shape: BoxShape.circle),
          child: Container(
            height: 225.0,
            width: 225.0,
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Container(
              height: 225.0,
              width: 225.0,
              decoration: BoxDecoration(
                color: kMainColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.15,
          left: MediaQuery.of(context).size.width * 0.08,
          child: Draggable(
            child: Transform.rotate(
              angle: math.pi / 5.0,
              child: main,
            ),
            feedback: Transform.rotate(
              angle: math.pi / 5.0,
              child: main,
            ),
            childWhenDragging: Container(),
          ),
        ),
      ],
    );
  }
}
