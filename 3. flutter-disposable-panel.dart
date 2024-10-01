import 'package:instagram_posts/shared/exports/export_boiler_plate.dart';

import '../../shared/widgets/custom_textfield.widget.dart';

class DisposablePanelNotifier extends ChangeNotifier {
  bool showDetails = false;
  void toggleShowDetails({required bool value}) {
    showDetails = value;
    notifyListeners();
  }
}

class FlutterDisposablePanelView extends StatelessWidget {
  const FlutterDisposablePanelView({super.key});

  @override
  Widget build(BuildContext context) {
    DisposablePanelNotifier disposablePanelNotifier({required bool renderUI}) =>
        Provider.of<DisposablePanelNotifier>(context, listen: renderUI);

    bool showDetails = disposablePanelNotifier(renderUI: true).showDetails;

    optionTile({
      required IconData iconData,
      required String title,
      required String description,
    }) =>
        ListTile(
          onTap: () {
            disposablePanelNotifier(renderUI: false)
                .toggleShowDetails(value: true);
          },
          leading: Icon(
            iconData,
            color: KConstantColors.faintWhiteColor,
          ),
          title: Text(title,
              style: KCustomTextStyle.kMedium(context, FontSize.kMedium)),
          subtitle: Text(description,
              style: KCustomTextStyle.kLight(context, FontSize.kMedium)),
        );

    Widget dispo1() => Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(08),
              color: KConstantColors.bgColorFaint),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Send money",
                    style: KCustomTextStyle.kBold(context, FontSize.kMedium)),
                optionTile(
                    iconData: Iconsax.bank,
                    title: "Bank transfer",
                    description: "Transfer money to bank account"),
                optionTile(
                    iconData: Iconsax.card,
                    title: "Debit/ Credit card",
                    description: "Transfer money from your carad"),
                optionTile(
                    iconData: Iconsax.wallet,
                    title: "Wallet",
                    description: "Transfer money from your wallet"),
              ],
            ),
          ),
        );

    Widget dispo2() => Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(08),
              color: KConstantColors.bgColorFaint),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Bank transfer",
                        style:
                            KCustomTextStyle.kBold(context, FontSize.kMedium)),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          disposablePanelNotifier(renderUI: false)
                              .toggleShowDetails(value: false);
                        },
                        icon: const Icon(Iconsax.close_circle))
                  ],
                ),
                vSizedBox1,
                const CustomTextField(hintText: "Full name"),
                const CustomTextField(
                    isNumeric: true, hintText: "Account number"),
                const CustomTextField(hintText: "Bank code"),
                vSizedBox1,
                BounceBackAnimatedButton(title: "Proceed", onTap: () {})
              ],
            ),
          ),
        );

    return ScaffoldShellForLists(widgets: [
      vSizedBox4,
      AnimatedCrossFade(
          firstChild: dispo1(),
          secondChild: dispo2(),
          crossFadeState: showDetails
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstCurve: Curves.fastEaseInToSlowEaseOut,
          secondCurve: Curves.fastEaseInToSlowEaseOut,
          duration: const Duration(seconds: 2)),
    ]);
  }
}
