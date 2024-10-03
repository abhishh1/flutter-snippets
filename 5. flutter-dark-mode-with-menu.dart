import 'package:instagram_posts/shared/exports/export_boiler_plate.dart';

class DarkModeNotifier extends ChangeNotifier {
  bool isDark = true;
  toggleDarkMode({required bool value}) {
    isDark = value;
    notifyListeners();
  }
}

class KTheme {
  final bool dark;
  const KTheme({required this.dark});
}

class FlutterDarkModeMenu extends StatelessWidget {
  const FlutterDarkModeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    DarkModeNotifier darkModeNotifier({required bool renderUI}) =>
        Provider.of<DarkModeNotifier>(context, listen: renderUI);

    bool isDark = darkModeNotifier(renderUI: true).isDark;

    return AnimatedTheme(
      curve: Curves.fastEaseInToSlowEaseOut,
      duration: const Duration(seconds: 2),
      data: ThemeData(
          scaffoldBackgroundColor:
              isDark ? KConstantColors.bgColor : KConstantColors.whiteColor),
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("animated theme app",
              style: KCustomTextStyle.kBoldArp(
                  context,
                  FontSize.kMedium,
                  !isDark
                      ? KConstantColors.bgColor
                      : KConstantColors.whiteColor)),
          vSizedBox1,
          Center(
            child: PopupMenuButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(06)),
              color: isDark
                  ? KConstantColors.bgColorFaint
                  : KConstantColors.faintWhiteColor,
              offset: const Offset(40, 30),
              child: Text("tap to change",
                  style: KCustomTextStyle.kMedium(
                      context,
                      FontSize.kMedium - 2,
                      !isDark
                          ? KConstantColors.bgColor
                          : KConstantColors.whiteColor)),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<KTheme>>[
                PopupMenuItem<KTheme>(
                    onTap: () {
                      darkModeNotifier(renderUI: false)
                          .toggleDarkMode(value: true);
                    },
                    value: const KTheme(dark: true),
                    child: Text('Dark 🌑',
                        style: KCustomTextStyle.kMedium(
                            context,
                            FontSize.kMedium,
                            !isDark
                                ? KConstantColors.bgColor
                                : KConstantColors.whiteColor))),
                PopupMenuItem<KTheme>(
                    onTap: () {
                      darkModeNotifier(renderUI: false)
                          .toggleDarkMode(value: false);
                    },
                    value: const KTheme(dark: true),
                    child: Text('Light ☀️',
                        style: KCustomTextStyle.kMedium(
                            context,
                            FontSize.kMedium,
                            !isDark
                                ? KConstantColors.bgColor
                                : KConstantColors.whiteColor))),
                PopupMenuItem<KTheme>(
                    onTap: () {
                      darkModeNotifier(renderUI: false)
                          .toggleDarkMode(value: true);
                    },
                    value: const KTheme(dark: true),
                    child: Text('System 📱',
                        style: KCustomTextStyle.kMedium(
                            context,
                            FontSize.kMedium,
                            !isDark
                                ? KConstantColors.bgColor
                                : KConstantColors.whiteColor))),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
