import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: SmoothShadow(
            shape: BoxShape.circle,
            height: 100,
            width: 100,
            child: Center(),
          ),
          // child: Text('Flutter is Awsome',
          // style: TextStyle(
          //   fontSize: 24,
          //   color: Colors.white,
          //   shadows: [
          //   Shadow(
          //     offset: Offset(0,2),
          //     blurRadius: 26,
          //     color: Colors.grey.shade900.withOpacity(0.8),
          //     ),
          //   ],
          // ),
          // ),
        ),
      ),
    );
  }
}

class SmoothCard extends SmoothShadow{
  ///height of card.
  final double height;

  ///width of card.
  final double width;

  /// by default the card will have padding of [8]
  /// you can edit this attribute as you like, same as any usual padding.
  final EdgeInsetsGeometry padding;

  /// Shadow color, by default it has shadow of ```Colors.grey.withOpacity(0.2)```
  final Color shadowColor;

  /// This has the effect of softening the shadow.
  final double blurRadius;

  /// This has the effect of extending the shadow.
  final double spreadRadius;

  /// if you want to move the shadow little bit to right or left.
  /// use negative values to move to left. e.g ``` -3.0 ```.
  final double horizontalShadow;

  /// if you want to move the shadow little bit up or down.
  /// use negative values to move to up. e.g ``` -3.0 ```.
  final double verticalShadow;

  /// The card elevation, default is ```0```.
  final double elevation;

  /// Card color, default is white.
  final Color color;

  final Widget child;

  /// To add BorderRadius or rounded corners.
  final ShapeBorder shapeBorder;

  ///
  final Clip clipBehavior;

  ///Shape
  final BoxShape shape;

  /// SmoothCard Widget
  ///
  /// provides usual card with smooth shadow.
  SmoothCard({
    this.padding,
    this.shadowColor,
    this.blurRadius,
    this.spreadRadius,
    this.horizontalShadow,
    this.verticalShadow,
    this.elevation,
    this.color,
    this.child,
    this.shapeBorder,
    this.clipBehavior,
    this.height,
    this.width, 
    this.shape,
  }) : assert(child != null, 'SmoothCard can\'t build withouth child, please provide child.'),
  super(shape: shape);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding ,
      decoration: BoxDecoration(
        // shape: shape ?? BoxShape.rectangle,
      ),
      child: SmoothShadow(
          blurRadius: blurRadius,
            spreadRadius: spreadRadius ?? 10, // has the effect of extending the shadow
            horizontalShadow: horizontalShadow,
            verticalShadow: verticalShadow,
            shadowColor: shadowColor,
            shape: shape ?? BoxShape.rectangle,
        child: Card(
          elevation: elevation ?? 0,
          color: color ?? Theme.of(context).cardColor,
          clipBehavior: clipBehavior,
          shape: shapeBorder,
          child: child,
        ),
      ),
    );
  }
}

class SmoothShadow extends StatelessWidget {
  
  /// child widget.
  final Widget child;
  
  ///height of card.
  final double height;

  ///width of card.
  final double width;

  /// by default the card will have padding of [8]
  /// you can edit this attribute as you like, same as any usual padding.
  final EdgeInsetsGeometry padding;

  /// Shadow color, by default it has shadow of ```Colors.grey.withOpacity(0.2)```
  final Color shadowColor;

  /// This has the effect of softening the shadow.
  final double blurRadius;

  /// This has the effect of extending the shadow.
  final double spreadRadius;

  /// if you want to move the shadow little bit to right or left.
  /// use negative values to move to left. e.g ``` -3.0 ```.
  final double horizontalShadow;

  /// if you want to move the shadow little bit up or down.
  /// use negative values to move to up. e.g ``` -3.0 ```.
  final double verticalShadow;

  /// The card elevation, default is ```0```.
  final double elevation;

  ///BoxShape, you can make circular 
  final BoxShape shape;

  const SmoothShadow({
      Key key,
      this.child,
      this.shadowColor,
      this.blurRadius,
      this.spreadRadius,
      this.horizontalShadow,
      this.verticalShadow, 
      this.height, 
      this.width, 
      this.padding, 
      this.elevation, 
      this.shape,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        shape: shape ?? BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? Colors.grey.withOpacity(0.2),
            blurRadius:
                blurRadius ?? 15, // has the effect of softening the shadow
            spreadRadius:
                spreadRadius ?? 10, // has the effect of extending the shadow
            offset: Offset(
              horizontalShadow ??
                  2.0, // horizontal move right, use negative values to move the shadow left.
              verticalShadow ??
                  6.0, // vertical move down, use negative values to move the shadow up.
            ),
          ),
        ],
      ),
      child: child,
    );
  }
}


