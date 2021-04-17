import 'package:flutter/material.dart';
import 'package:desktop_app_adidas_shop/constant.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MyDropDown extends StatefulWidget {
  final String text;

  MyDropDown({Key key, @required this.text}) : super(key: key);

  @override
  _MyDropDownState createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  GlobalKey actionKey;
  double height, width, xPosition, yPosition;
  bool isDropdownOpened = false;
  OverlayEntry floatingDropdown;

  @override
  void initState() {
    actionKey = LabeledGlobalKey(widget.text);
    super.initState();
  }

  void findDropdownData() {
    RenderBox renderBox = actionKey.currentContext.findRenderObject();
    height = renderBox.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
    print(height);
    print(width);
    print(xPosition);
    print(yPosition);
  }

  OverlayEntry _createFloatingDropdown() {
    return OverlayEntry(builder: (context) {
      return Positioned(
        left: xPosition,
        width: width,
        top: yPosition + height,
        height: 4 * height + 40,
        child: DropDown(
          itemHeight: height,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: actionKey,
      onTap: () {
        setState(() {
          if (isDropdownOpened) {
            floatingDropdown.remove();
          } else {
            findDropdownData();
            floatingDropdown = _createFloatingDropdown();
            Overlay.of(context).insert(floatingDropdown);
          }

          isDropdownOpened = !isDropdownOpened;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
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
          borderRadius: BorderRadius.all(Radius.circular(100.0)),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.all(6.0),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          decoration: BoxDecoration(
            color: kMainColor,
            borderRadius: BorderRadius.all(Radius.circular(100.0)),
          ),
          child: Row(
            children: [
              Text(
                widget.text,
                style: TextStyle(
                  color: kMainText,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 6.0),
              Icon(Feather.chevron_down, color: kBlack),
            ],
          ),
        ),
      ),
    );
  }
}

class DropDown extends StatelessWidget {
  final double itemHeight;

  const DropDown({Key key, this.itemHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        Align(
          alignment: Alignment(-0.85, 0),
          child: ClipPath(
            clipper: ArrowClipper(),
            child: Container(
              height: 20,
              width: 30,
              decoration: BoxDecoration(
                color: kMainColor,
              ),
            ),
          ),
        ),
        Material(
          elevation: 0.0,
          shape: ArrowShape(),
          child: Container(
            height: 2 * itemHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: <Widget>[
                DropDownItem.first(
                  text: "SIZE",
                  size: 'SM',
                  isSelected: false,
                ),
                DropDownItem(
                  text: "SIZE",
                  size: 'L',
                  isSelected: false,
                ),
                DropDownItem(
                  text: "SIZE",
                  size: 'M',
                  isSelected: false,
                ),
                DropDownItem.last(
                  text: "SIZE",
                  size: 'XL',
                  isSelected: true,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DropDownItem extends StatelessWidget {
  final String text;
  final String size;
  final bool isSelected;
  final bool isFirstItem;
  final bool isLastItem;

  const DropDownItem(
      {Key key,
      this.text,
      this.size,
      this.isSelected = false,
      this.isFirstItem = false,
      this.isLastItem = false})
      : super(key: key);

  factory DropDownItem.first({String text, String size, bool isSelected}) {
    return DropDownItem(
      text: text,
      size: size,
      isSelected: isSelected,
      isFirstItem: true,
    );
  }

  factory DropDownItem.last({String text, String size, bool isSelected}) {
    return DropDownItem(
      text: text,
      size: size,
      isSelected: isSelected,
      isLastItem: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: isFirstItem ? Radius.circular(8) : Radius.zero,
          bottom: isLastItem ? Radius.circular(8) : Radius.zero,
        ),
        color: isSelected ? kOverlayText : kMainColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: <Widget>[
          Text(
            text.toUpperCase() + ':',
            style: TextStyle(
              color: kMainText,
              fontSize: 15.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          Spacer(),
          Text(
            size,
            style: TextStyle(
              color: kMainText,
              fontSize: 15.0,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class ArrowShape extends ShapeBorder {
  @override
  // ignore: todo
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => throw UnimplementedError();

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    // ignore: todo
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    // ignore: todo
    // TODO: implement getOuterPath
    return getClip(rect.size);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    // ignore: todo
    // TODO: implement paint
  }

  @override
  ShapeBorder scale(double t) {
    // ignore: todo
    // TODO: implement scale
    throw UnimplementedError();
  }

  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);

    return path;
  }
}
