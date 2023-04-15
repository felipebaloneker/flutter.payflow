import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/widgets/bottom_sheet_widget.dart';
import 'package:payflow/shared/widgets/divider_vertical/divider_veritical_widget.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

import '../../shared/themes/app_text_styles.dart';
import '../../shared/widgets/label_button/label_button.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({super.key});

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  @override
  Widget build(BuildContext context) {
    // return BottomSheetWidget(
    //   title: "Não foi possivel identificar um código de barras.",
    //   subtitle: "Tente escanear novamente ou digite o código do seu boleto.",
    //   primaryLabel: 'Escanear novamente',
    //   secondaryLabel: 'Digitar código',
    //   primaryOnPressed: () {},
    //   secondaryOnPressed: () {},
    // );
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: RotatedBox(
        quarterTurns: 1,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text("Escaneie o codigo de barras do boleto",
                style: AppTextStyles.buttonBackground),
            leading: BackButton(color: AppColors.background),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(child: Container(color: Colors.black.withOpacity(0.8))),
              Expanded(flex: 2, child: Container(color: Colors.transparent)),
              Expanded(child: Container(color: Colors.black.withOpacity(0.8))),
            ],
          ),
          bottomNavigationBar: SetLabelButtons(
            primaryLabel: "Inserir código do boleto",
            primaryOnPressed: () {},
            secondaryLabel: "Adicionar da galeria",
            secondaryOnPressed: () {},
          ),
        ),
      ),
    );
  }
}
