import 'package:flutter/material.dart';
import 'package:mvvm_vidoe_one/res/colors.dart';

class RoundButton extends StatelessWidget {

  final String title;
  final bool loading;
  final VoidCallback onPress;
  final Color color;

  RoundButton({
    required this.title,
    required this.loading,
    required this.onPress,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child:  Center(
            child: loading == true ? const CircularProgressIndicator(color: AppColors.whiteColor,) : Text(title, style: const TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
