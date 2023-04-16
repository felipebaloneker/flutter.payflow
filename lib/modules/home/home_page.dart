import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:payflow/modules/extract/extract_page.dart';
import 'package:payflow/modules/meus_boletos/meus_boletos_page.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/widgets/boleto_tile/boleto_tile_widget.dart';

import '../../shared/themes/app_text_styles.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  final pages = [
    MeusBoletosPage(),
    ExtractPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          height: 152,
          color: AppColors.primary,
          child: Center(
            child: ListTile(
                title: Text.rich(
                  TextSpan(
                      text: "Olá, ",
                      style: AppTextStyles.titleRegular,
                      children: [
                        TextSpan(
                            text: "Felipe",
                            style: AppTextStyles.titleBoldBackground)
                      ]),
                ),
                subtitle: Text("Mantenha suas contas em dia",
                    style: AppTextStyles.captionShape),
                trailing: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                )),
          ),
        ),
      ),
      body: pages[controller.currentPage],
      bottomNavigationBar: Container(
        height: 90,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
              onPressed: () {
                controller.setPage(0);
                setState(() {});
              },
              icon: Icon(Icons.home, color: AppColors.primary)),
          GestureDetector(
            onTap: () {
              // Navigator.pushNamed(context, "/barcode_scanner");
              Navigator.pushNamed(context, "/insert_boleto");
            },
            child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:
                    Icon(Icons.add_box_outlined, color: AppColors.background)),
          ),
          IconButton(
              onPressed: () {
                controller.setPage(1);
                setState(() {});
              },
              icon: Icon(Icons.description_outlined, color: AppColors.body)),
        ]),
      ),
    );
  }
}
