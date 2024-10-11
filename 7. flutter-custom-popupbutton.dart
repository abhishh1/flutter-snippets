import 'package:instagram_posts/shared/exports/export_boiler_plate.dart';

class FlutterCustomPopupButtonView extends StatelessWidget {
  const FlutterCustomPopupButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    button({required IconData icon, required String title}) {
      return PopupMenuItem<String>(
          child: Row(
        children: [
          Icon(icon, size: 16, color: KConstantColors.whiteColor),
          hSizedBox2,
          Text(title,
              style: KCustomTextStyle.kMedium(
                  context, FontSize.kMedium, KConstantColors.whiteColor))
        ],
      ));
    }

    return Scaffold(
        backgroundColor: KConstantColors.bgColor,
        body: Center(
          child: PopupMenuButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(06)),
            color: KConstantColors.bgColorFaint,
            splashRadius: 0,
            offset: const Offset(0, 40),
            child: Container(
              decoration: BoxDecoration(
                  color: KConstantColors.whiteColor,
                  borderRadius: BorderRadius.circular(08)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Menu",
                    style: KCustomTextStyle.kMedium(context,
                        FontSize.kMedium - 2, KConstantColors.bgColorFaint)),
              ),
            ),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              button(icon: Iconsax.music_dashboard, title: "Dashboard"),
              button(icon: Iconsax.setting, title: "Settings"),
              button(icon: Iconsax.add, title: "Create Team"),
              button(icon: Iconsax.document_sketch, title: "Docs"),
              button(icon: Iconsax.support, title: "Contact Support"),
              button(icon: Iconsax.logout, title: "Log out"),
            ],
          ),
        ));
  }
}
