import 'package:dugbet/views/widgets/group_balance_one.dart';
import 'package:flutter/material.dart';

import '../../../consts/color/colors.dart';
import '../../../consts/fonts/text_theme_builder.dart';
import '../../widgets/bottom_sheet_transaction.dart';

class WalletEvent extends StatelessWidget {
  const WalletEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orangeAccent,
        child: const Icon(Icons.edit_calendar_outlined),
      ),
      body: Container(
        decoration:
            const BoxDecoration(gradient: ColorPalette.secondaryGradient),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Design ITUS",
                    style: TextThemeBuilder.robotoTextTheme.titleLarge,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(Icons.draw_outlined)
                ],
              ),
              const GroupBalanceOne(),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ColorPalette.white, width: 2),
                        color: ColorPalette.primaryColor),
                    child: Center(
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.note_alt_outlined,
                              color: ColorPalette.white)),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ColorPalette.white, width: 2),
                        color: ColorPalette.primaryColor),
                    child: Center(
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.exit_to_app_outlined,
                              color: ColorPalette.white)),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ColorPalette.white, width: 2),
                        color: ColorPalette.primaryColor),
                    child: Center(
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.people_alt_sharp,
                              color: ColorPalette.white)),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ColorPalette.white, width: 2),
                        color: ColorPalette.grey.withOpacity(0.3)),
                    child: Center(
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.notifications_active_outlined,
                              color: ColorPalette.white)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              BottomSheetTransaction()
            ],
          ),
        ),
      ),
    );
  }
}
