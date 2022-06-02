import 'package:dro_home_task/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DROButtonOutline extends StatelessWidget{
  const DROButtonOutline({Key? key, required this.onPressed, required this.text}) : super(key: key);
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 364,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(defaultPadding - 6.0),
        border: Border.all(color: droPurple),
        // gradient: const LinearGradient(
        //   begin: Alignment.centerLeft,
        //   end: Alignment.centerRight,
        //   colors: [droPurpleGradientLeft, droPurpleGradientRight],
        //   tileMode: TileMode.clamp,
        // ),
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
              SvgPicture.asset("assets/icons/cart.svg"),
              const SizedBox(width: defaultPadding),
              Text(text,style: const TextStyle(
                  color: droPurple,
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