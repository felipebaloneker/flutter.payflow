import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_info/boleto_info_widget.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_widget.dart';

class ExtractPage extends StatefulWidget {
  const ExtractPage({super.key});

  @override
  State<ExtractPage> createState() => _ExtractPageState();
}

class _ExtractPageState extends State<ExtractPage> {
  final controller = BoletoListController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Row(
            children: [
              Text("Meus Extratos", style: AppTextStyles.titleBoldHeading),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Divider(color: AppColors.stroke),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BoletoListWidget(
            controller: controller,
            key: UniqueKey(),
          ),
        )
      ]),
    );
  }
}
