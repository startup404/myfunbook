import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class socialloginbuttons extends StatelessWidget {
  final Function() onGoogleClick;
  final Function() onFbClick;

  socialloginbuttons(
      {Key? key, required this.onGoogleClick, required this.onFbClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Material(
            color: Color.fromARGB(255, 245, 224, 224),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: InkWell(
              onTap: onGoogleClick,
              borderRadius: BorderRadius.circular(5),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/google.svg"),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "Google",
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Material(
            color: Color.fromARGB(255, 216, 227, 244),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: InkWell(
              onTap: onGoogleClick,
              borderRadius: BorderRadius.circular(5),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/facebook.svg"),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "FaceBook",
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
