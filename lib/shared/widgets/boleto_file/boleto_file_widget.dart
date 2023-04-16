import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

import '../../models/boleto_model.dart';

class BoletoTilewidget extends StatelessWidget {
  final BoletoModel data;
  const BoletoTilewidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(data.name!),
          subtitle: Text("Vence em ${data.dueDate}"),
          trailing: Text.rich(TextSpan(
              text: "R\$ ",
              style: AppTextStyles.trailingRegular,
              children: [
                TextSpan(
                  text: "${data.value!.toStringAsFixed(2)}",
                  style: AppTextStyles.trailingBold,
                )
              ]))),
    );
  }
}
