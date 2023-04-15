import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../themes/app_colors.dart';

class DividerVerticalWidget extends StatelessWidget {
  const DividerVerticalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 1, height: double.maxFinite, color: AppColors.stroke);
  }
}
