import 'package:flutter/cupertino.dart';
import 'package:instagram_posts/shared/exports/export_boiler_plate.dart';

class CryptoNotifier extends ChangeNotifier {
  bool isExtend = true;
  toggleExtension({required bool value}) {
    isExtend = value;
    notifyListeners();
  }
}

class FlutterCryptoSearch extends StatelessWidget {
  const FlutterCryptoSearch({super.key});

  @override
  Widget build(BuildContext context) {
    CryptoNotifier cryptoNotifier({required bool renderUI}) =>
        Provider.of<CryptoNotifier>(context, listen: renderUI);
    bool isExtend = cryptoNotifier(renderUI: true).isExtend;

    halfState() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              gradient:
                  const LinearGradient(begin: Alignment.topCenter, colors: [
                KConstantColors.bgColor,
                KConstantColors.bgColorFaint,
              ]),
              color: KConstantColors.bgColorFaint,
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 2),
                    spreadRadius: 1,
                    blurRadius: 2,
                    color: KConstantColors.bgColorFaint)
              ],
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Swap",
                        style: KCustomTextStyle.kBoldArp(
                            context,
                            FontSize.kMedium + 6,
                            KConstantColors.faintWhiteColor)),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        cryptoNotifier(renderUI: false)
                            .toggleExtension(value: true);
                      },
                      child: Icon(
                          isExtend ? CupertinoIcons.minus : CupertinoIcons.add,
                          color: KConstantColors.whiteColor),
                    ),
                    hSizedBox2,
                    const Icon(EvaIcons.close,
                        color: KConstantColors.whiteColor),
                  ],
                ),
                vSizedBox2,
                Row(
                  children: [
                    Text("Pay",
                        style: KCustomTextStyle.kMedium(context,
                            FontSize.kMedium, KConstantColors.faintWhiteColor)),
                    const Spacer(),
                    Text("Max 50000 UNI",
                        style: KCustomTextStyle.kMedium(context,
                            FontSize.kMedium, KConstantColors.faintWhiteColor)),
                  ],
                ),
                vSizedBox1,
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.beta.cosmos.so/ed0793dd-7898-4142-9fe4-47c92d22a30d?format=jpeg"),
                    ),
                    hSizedBox2,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("UNI",
                                style: KCustomTextStyle.kBold(
                                    context, FontSize.kMedium)),
                            hSizedBox1,
                            const Icon(Icons.arrow_downward,
                                color: KConstantColors.faintWhiteColor)
                          ],
                        ),
                        Text("Uniswap",
                            style: KCustomTextStyle.kLight(
                                context,
                                FontSize.kMedium,
                                KConstantColors.faintWhiteColor)),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("2,312.12",
                            style: KCustomTextStyle.kBold(
                                context,
                                FontSize.kMedium + 6,
                                KConstantColors.whiteColor)),
                        Text("\$ 17,109",
                            style: KCustomTextStyle.kLight(
                                context,
                                FontSize.kMedium,
                                KConstantColors.faintWhiteColor)),
                      ],
                    ),
                  ],
                ),
                vSizedBox2,
                const Divider(
                    color: KConstantColors.faintWhiteColor, thickness: 0.3),
                vSizedBox2,
                Row(
                  children: [
                    Text("Total fee",
                        style: KCustomTextStyle.kLight(context,
                            FontSize.kMedium, KConstantColors.faintWhiteColor)),
                    const Spacer(),
                    Text("\$2.09",
                        style: KCustomTextStyle.kBold(context, FontSize.kMedium,
                            KConstantColors.faintWhiteColor)),
                  ],
                ),
                vSizedBox2,
                BounceBackAnimatedButton(
                    color: KConstantColors.faintWhiteColor,
                    textColor: KConstantColors.bgColor,
                    title: "Swap",
                    onTap: () {})
              ],
            ),
          ),
        ),
      );
    }

    Widget fullState() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              gradient:
                  const LinearGradient(begin: Alignment.topCenter, colors: [
                KConstantColors.bgColor,
                KConstantColors.bgColorFaint,
              ]),
              color: KConstantColors.bgColorFaint,
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 2),
                    spreadRadius: 1,
                    blurRadius: 2,
                    color: KConstantColors.bgColorFaint)
              ],
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Swap",
                        style: KCustomTextStyle.kBoldArp(
                            context,
                            FontSize.kMedium + 6,
                            KConstantColors.faintWhiteColor)),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        cryptoNotifier(renderUI: false)
                            .toggleExtension(value: false);
                      },
                      child: Icon(
                          isExtend ? CupertinoIcons.minus : CupertinoIcons.add,
                          color: KConstantColors.whiteColor),
                    ),
                    hSizedBox2,
                    const Icon(EvaIcons.close,
                        color: KConstantColors.whiteColor),
                  ],
                ),
                vSizedBox2,
                Row(
                  children: [
                    Text("Pay",
                        style: KCustomTextStyle.kMedium(context,
                            FontSize.kMedium, KConstantColors.faintWhiteColor)),
                    const Spacer(),
                    Text("Max 50000 UNI",
                        style: KCustomTextStyle.kMedium(context,
                            FontSize.kMedium, KConstantColors.faintWhiteColor)),
                  ],
                ),
                vSizedBox1,
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.beta.cosmos.so/ed0793dd-7898-4142-9fe4-47c92d22a30d?format=jpeg"),
                    ),
                    hSizedBox2,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("UNI",
                                style: KCustomTextStyle.kBold(
                                    context, FontSize.kMedium)),
                            hSizedBox1,
                            const Icon(Icons.arrow_downward,
                                color: KConstantColors.faintWhiteColor)
                          ],
                        ),
                        Text("Uniswap",
                            style: KCustomTextStyle.kLight(
                                context,
                                FontSize.kMedium,
                                KConstantColors.faintWhiteColor)),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("2,312.12",
                            style: KCustomTextStyle.kBold(
                                context,
                                FontSize.kMedium + 6,
                                KConstantColors.whiteColor)),
                        Text("\$ 17,109",
                            style: KCustomTextStyle.kLight(
                                context,
                                FontSize.kMedium,
                                KConstantColors.faintWhiteColor)),
                      ],
                    ),
                  ],
                ),
                if (isExtend) vSizedBox2,
                const Center(
                  child: CircleAvatar(
                    backgroundColor: KConstantColors.faintWhiteColor,
                    radius: 16,
                    child: Icon(FontAwesomeIcons.exchangeAlt,
                        size: 16, color: KConstantColors.bgColorFaint),
                  ),
                ),
                vSizedBox2,
                Row(
                  children: [
                    Text("Receive",
                        style: KCustomTextStyle.kMedium(context,
                            FontSize.kMedium, KConstantColors.faintWhiteColor)),
                    const Spacer(),
                    Text("Best price",
                        style: KCustomTextStyle.kMedium(context,
                            FontSize.kMedium, KConstantColors.faintWhiteColor)),
                  ],
                ),
                vSizedBox1,
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.beta.cosmos.so/8a5065ac-9899-4f76-b7bf-02f9f31e6ddf.?format=jpeg"),
                    ),
                    hSizedBox2,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("DOT",
                                style: KCustomTextStyle.kBold(
                                    context, FontSize.kMedium)),
                            hSizedBox1,
                            const Icon(Icons.arrow_downward_rounded,
                                color: KConstantColors.faintWhiteColor)
                          ],
                        ),
                        Text("Polkadot",
                            style: KCustomTextStyle.kLight(
                                context,
                                FontSize.kMedium,
                                KConstantColors.faintWhiteColor)),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("~2,678.15",
                            style: KCustomTextStyle.kBold(
                                context,
                                FontSize.kMedium + 6,
                                KConstantColors.whiteColor)),
                        Text("~ \$ 17,110",
                            style: KCustomTextStyle.kLight(
                                context,
                                FontSize.kMedium,
                                KConstantColors.faintWhiteColor)),
                      ],
                    ),
                  ],
                ),
                vSizedBox2,
                const Divider(
                    color: KConstantColors.faintWhiteColor, thickness: 0.3),
                vSizedBox2,
                Row(
                  children: [
                    Text("Total fee",
                        style: KCustomTextStyle.kLight(context,
                            FontSize.kMedium, KConstantColors.faintWhiteColor)),
                    const Spacer(),
                    Text("\$2.09",
                        style: KCustomTextStyle.kBold(context, FontSize.kMedium,
                            KConstantColors.faintWhiteColor)),
                  ],
                ),
                vSizedBox2,
                BounceBackAnimatedButton(
                    color: KConstantColors.faintWhiteColor,
                    textColor: KConstantColors.bgColor,
                    title: "Swap",
                    onTap: () {})
              ],
            ),
          ),
        ),
      );
    }

    return ScaffoldShellForLists(widgets: [
      vSizedBox3,
      vSizedBox3,
      AnimatedCrossFade(
          firstCurve: Curves.easeIn,
          secondCurve: Curves.easeOut,
          firstChild: fullState(),
          secondChild: halfState(),
          crossFadeState:
              isExtend ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(seconds: 1))
    ]);
  }
}
