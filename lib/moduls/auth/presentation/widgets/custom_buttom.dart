
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? width;
  final VoidCallback? onTap;
  final Widget? child;

   CustomButton(
    {this.color,
    this.height,
     this.width,
     this.onTap,
     this.child,}
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
      onTap: onTap,
      child: Container(
      
        height: height,
        width: width,
        decoration: BoxDecoration(
        
          color: color,
          borderRadius: BorderRadius.circular(48),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
