import 'package:dro_home_task/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FloatingButtonCircleWidget extends StatelessWidget{
  const FloatingButtonCircleWidget({Key? key, required this.onPressed, required this.totalCart}) : super(key: key);
  final VoidCallback onPressed;
  final String totalCart;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed();
      },
      child: Stack(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              //borderRadius: BorderRadius.circular(50.0),
              border: Border.all(color: droWhite,width: 2.0),
              gradient: const LinearGradient(
                  colors: [
                    droRedGradientLeft,
                    droRedGradientRight
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding / 2.0),
              child: SvgPicture.asset("assets/icons/cart.svg"),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              height: 15,
              width: 15,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: droBadgeColor
              ),
              child: Center(
                child: Text(totalCart,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 12.0
                  ),),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
