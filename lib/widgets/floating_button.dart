import 'package:dro_home_task/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FloatingButtonWidget extends StatelessWidget{
  const FloatingButtonWidget({Key? key, required this.onPressed, required this.totalCart}) : super(key: key);
  final VoidCallback onPressed;
  final String totalCart;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed();
      },
      child: Container(
        width: 135,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Text(
              "Checkout",
              style: TextStyle(
                  color: droWhite,
                  fontWeight: FontWeight.w700,
                  fontSize: 14
              ),
            ),
            const SizedBox (width: defaultPadding/4.0),
            SvgPicture.asset("assets/icons/cart.svg"),
            const SizedBox(width: defaultPadding / 2.0),
            Container(
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
          ],
        ),
      ),
    );
  }

}