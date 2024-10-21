import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:instagram_posts/shared/exports/export_boiler_plate.dart';

class Tab {
  final int index;
  final String title;

  const Tab({
    required this.index,
    required this.title,
  });
}

class AnimatedTabBarNotifier extends ChangeNotifier {
  int index = 0;
  setIndex({required int value}) {
    index = value;
    notifyListeners();
  }
}

class FlutterAnimatedTabbarView extends StatelessWidget {
  const FlutterAnimatedTabbarView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = [
      const Tab(index: 0, title: "Team"),
      const Tab(index: 1, title: "Users"),
      const Tab(index: 2, title: "Insights"),
      const Tab(index: 3, title: "Profile"),
      const Tab(index: 4, title: "Settings"),
    ];

    AnimatedTabBarNotifier animatedTabBarNotifier({required bool renderUI}) =>
        Provider.of<AnimatedTabBarNotifier>(context, listen: renderUI);

    int selectedIndex = animatedTabBarNotifier(renderUI: true).index;

    Widget tabBlock({required Tab tab}) {
      bool isSelected = selectedIndex == tab.index;

      return GestureDetector(
          onTap: () {
            animatedTabBarNotifier(renderUI: false).setIndex(value: tab.index);
          },
          child: isSelected
              ? AnimatedTextKit(
                  animatedTexts: [
                      ColorizeAnimatedText(
                        tab.title,
                        textStyle:
                            KCustomTextStyle.kLight(context, FontSize.kMedium),
                        colors: [
                          KConstantColors.appPrimaryColor,
                          KConstantColors.whiteColor
                        ],
                      ),
                    ],
                  repeatForever: true,
                  isRepeatingAnimation: true,
                  totalRepeatCount: 10,
                  pause: const Duration(milliseconds: 1000))
              : Text(tab.title,
                  style: KCustomTextStyle.kLight(context, FontSize.kMedium)));
    }

    return ScaffoldShellForLists(
      defBgColor: KConstantColors.bgColorFaint,
      widgets: [
        vSizedBox4,
        Center(
            child: Text("animated tab bar",
                style: KCustomTextStyle.kBold(context, FontSize.kMedium))),
        vSizedBox2,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            tabBlock(tab: tabs[0]),
            tabBlock(tab: tabs[1]),
            tabBlock(tab: tabs[2]),
            tabBlock(tab: tabs[3]),
            tabBlock(tab: tabs[4]),
          ],
        ),
        vSizedBox1,
        const Divider(thickness: 0.2)
      ],
    );
  }
}
