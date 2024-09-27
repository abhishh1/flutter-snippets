import 'package:instagram_posts/shared/exports/export_boiler_plate.dart';

class PlanNotifier extends ChangeNotifier {
  String selectedPlan = "Basic";
  void setPlan({required String value}) {
    selectedPlan = value;
    notifyListeners();
  }
}

class FlutterPlanSelectionView extends StatelessWidget {
  const FlutterPlanSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    PlanNotifier planNotifier({required bool renderUI}) =>
        Provider.of<PlanNotifier>(context, listen: renderUI);

    planBlock(
        {required String title, required int price, required String icon}) {
          
      bool isSelected = planNotifier(renderUI: true).selectedPlan == title;

      return GestureDetector(
          onTap: () {
            planNotifier(renderUI: false).setPlan(value: title);
          },
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: isSelected
                          ? Border.all(
                              width: 2, color: KConstantColors.appPrimaryColor)
                          : Border.all(
                              color: KConstantColors.faintWhiteColor,
                              width: 0.2),
                      color: KConstantColors.bgColor,
                      borderRadius: BorderRadius.circular(06)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(icon,
                            style: KCustomTextStyle.kBold(
                                context, FontSize.header)),
                        vSizedBox1,
                        Text(title,
                            style: KCustomTextStyle.kBold(
                                context, FontSize.kMedium)),
                        Text("\$$price/Month",
                            style: KCustomTextStyle.kLight(
                                context, FontSize.kMedium)),
                      ],
                    ),
                  ),
                ),
              ),
              if (isSelected)
                const Positioned(
                  right: 0,
                  child: Icon(FontAwesomeIcons.circle,
                      color: KConstantColors.appPrimaryColor),
                )
            ],
          ));
    }

    return ScaffoldShellForLists(widgets: [
      vSizedBox4,
      Text("pick your plan",
          style: KCustomTextStyle.kBoldArp(
              context, FontSize.kLarge, KConstantColors.faintWhiteColor)),
      Text("You can cancel or switch any time.",
          style: KCustomTextStyle.kLight(
              context, FontSize.kMedium, KConstantColors.faintWhiteColor)),
      vSizedBox2,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          planBlock(title: "Starter", price: 8, icon: "🎉"),
          planBlock(title: "Pro", price: 12, icon: "🔥"),
          planBlock(title: "Business", price: 70, icon: "👋"),
        ],
      ),
      vSizedBox3,
      Center(
          child: Text("privacy policy  ✦ about rimeq",
              style: KCustomTextStyle.kLight(
                  context, FontSize.kMedium, KConstantColors.faintWhiteColor))),
    ]);
  }
}
