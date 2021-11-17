import 'package:flutter/material.dart';
import 'package:tekrar/core/extension/context_extension.dart';

class OnBoardCircleAvatar extends StatelessWidget{
  final bool isSelected;

  const OnBoardCircleAvatar({Key? key, required this.isSelected}) : super(key: key);
  
    
  
    @override
    Widget build(BuildContext context) {
      
      
      return Padding(
            padding: context.paddingLow,
            child: CircleAvatar(
              radius: isSelected? 8 : 5,
              backgroundColor: Colors.orange.withOpacity(isSelected ? 1 : 0.2),
            ),
          );
    }
  }