import 'package:instagram_posts/shared/exports/export_boiler_plate.dart';

class SpacerNotifier extends ChangeNotifier {
  bool showSteps = false;

  void setSteps({required bool value}) {
    showSteps = value;
    notifyListeners();
  }
}

class FlutterAnimatedSpacerView extends StatelessWidget {
  const FlutterAnimatedSpacerView({super.key});

  @override
  Widget build(BuildContext context) {
    SpacerNotifier bottombarNotifier({required bool renderUI}) {
      return Provider.of<SpacerNotifier>(context, listen: renderUI);
    }

    bool showPanel = bottombarNotifier(renderUI: true).showSteps;

    button1() {
      return GestureDetector(
        onTap: () {
          bottombarNotifier(renderUI: false).setSteps(value: true);
        },
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: KConstantColors.appPrimaryColor,
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Join Beta",
                  style:
                      KCustomTextStyle.kMedium(context, FontSize.kMedium - 1)),
            ),
          ),
        ),
      );
    }

    button2() {
      return Center(
        child: Container(
          decoration: BoxDecoration(
              color: KConstantColors.bgColorFaint,
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Discord",
                style: KCustomTextStyle.kMedium(context, FontSize.kMedium - 1)),
          ),
        ),
      );
    }

    bottomPanel() {
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: AnimatedContainer(
          height: showPanel ? 5.h : 0,
          curve: Curves.fastEaseInToSlowEaseOut,
          duration: const Duration(seconds: 1),
          decoration: BoxDecoration(
              color: KConstantColors.bgColorFaint,
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("new account",
                    style: KCustomTextStyle.kMedium(context, FontSize.kMedium)),
                Text("for developers",
                    style: KCustomTextStyle.kMedium(context, FontSize.kMedium)),
                Text("pricing",
                    style: KCustomTextStyle.kMedium(context, FontSize.kMedium)),
              ],
            ),
          ),
        ),
      );
    }

    return ScaffoldShellForLists(defBgColor: KConstantColors.bgColor, widgets: [
      vSizedBox3,
      Text("Enduring LLMs 👋",
          style: KCustomTextStyle.kMedium(context, FontSize.header)),
      Text(
          "Morphic is transforming future of storytelling \nusing breakthrough technologies.",
          style: KCustomTextStyle.kLight(context, FontSize.kMedium)),
      vSizedBox2,
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          button1(),
          hSizedBox2,
          button2(),
          if (showPanel) hSizedBox2,
          if (showPanel)
            GestureDetector(
              onTap: () {
                bottombarNotifier(renderUI: false).setSteps(value: false);
              },
              child: const Icon(Iconsax.close_circle,
                  size: 20, color: KConstantColors.faintWhiteColor),
            ),
        ],
      ),
      bottomPanel(),
      vSizedBox1,
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60.h,
          width: 100.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              image: const DecorationImage(
                  image: NetworkImage(
                      "https://i.pinimg.com/736x/e7/1e/ed/e71eed228bdb81e9b08fdf6b55c81191.jpg"),
                  fit: BoxFit.cover)),
        ),
      ),
    ]);
  }
}
