import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

import '../../models/boleto_model.dart';

class BoletoTileWidget extends StatelessWidget {
  final BoletoModel data;
  const BoletoTileWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(data.name ?? '', style: AppTextStyles.titleListTile),
        subtitle: Text("Vence em ${data.dueDate ?? ''}",
            style: AppTextStyles.captionBody),
        trailing: Text.rich(TextSpan(
            text: "R\$ ",
            style: AppTextStyles.trailingRegular,
            children: [
              TextSpan(
                text: "${data.value?.toStringAsFixed(2) ?? '0.00'}",
                style: AppTextStyles.trailingBold,
              )
            ])));
  }
}
