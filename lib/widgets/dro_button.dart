import 'package:dro_home_task/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DROButton extends StatelessWidget{
  const DROButton({Key? key, required this.onPressed, required this.text, required this.isCartIconShown}) : super(key: key);
  final VoidCallback onPressed;
  final String text;
  final bool isCartIconShown;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 364,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(defaultPadding - 6.0),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [droPurpleGradientLeft, droPurpleGradientRight],
            tileMode: TileMode.clamp,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){
            onPressed();
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             isCartIconShown == true ? SvgPicture.asset("assets/icons/cart.svg"): Container(),
              const SizedBox(width: defaultPadding),
               Text(text,style: const TextStyle(
                color: droWhite,
                fontSize: 14.0,
                fontWeight: FontWeight.w700
              ),),
            ],
          ),
        ),
      ),
    );
  }

}