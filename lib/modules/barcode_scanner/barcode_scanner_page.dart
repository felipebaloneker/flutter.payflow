import 'package:flutter/material.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/bottom_sheet_widget.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({super.key});

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(context, "/insert_boleto");
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.showCamera) {
                  return Container(
                    color: Colors.blue,
                    child: controller.cameraController!.buildPreview(),
                  );
                } else {
                  return Container();
                }
              }),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text("Escaneie o codigo de barras do boleto",
                    style: AppTextStyles.buttonBackground),
                leading: BackButton(color: AppColors.background),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Expanded(
                      child: Container(color: Colors.black.withOpacity(0.8))),
                  Expanded(
                      flex: 2, child: Container(color: Colors.transparent)),
                  Expanded(
                      child: Container(color: Colors.black.withOpacity(0.8))),
                ],
              ),
              bottomNavigationBar: SetLabelButtons(
                primaryLabel: "Inserir código do boleto",
                primaryOnPressed: () {
                  Navigator.pushReplacementNamed(context, "/insert_boleto");
                },
                secondaryLabel: "Adicionar da galeria",
                secondaryOnPressed: () {},
              ),
            ),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.haserror) {
                  return BottomSheetWidget(
                    title: "Não foi possivel identificar um codigo de barras",
                    subtitle:
                        "tente escanear novamente ou digite o código do seu boleto",
                    primaryLabel: "Escanear novamente",
                    secondaryLabel: "Digitar código",
                    primaryOnPressed: () {
                      controller.scanWithCamera();
                    },
                    secondaryOnPressed: () {
                      Navigator.pushReplacementNamed(context, "/insert_boleto");
                    },
                  );
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}
