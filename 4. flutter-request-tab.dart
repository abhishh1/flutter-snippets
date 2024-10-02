import 'package:instagram_posts/shared/exports/export_boiler_plate.dart';

class RequestTabNotifier extends ChangeNotifier {
  bool isLocal = true;
  void toggleLocalState({required bool value}) {
    isLocal = value;
    notifyListeners();
  }
}

class FlutterRequestTabView extends StatelessWidget {
  const FlutterRequestTabView({super.key});

  @override
  Widget build(BuildContext context) {
    RequestTabNotifier requestTabNotifier({required bool renderUI}) =>
        Provider.of<RequestTabNotifier>(context, listen: renderUI);

    bool isLocal = requestTabNotifier(renderUI: true).isLocal;

    String lorem =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,";

    kTab() {
      return Container(
        decoration: BoxDecoration(
            color: KConstantColors.bgColor,
            borderRadius: BorderRadius.circular(08)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  requestTabNotifier(renderUI: false)
                      .toggleLocalState(value: true);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: isLocal
                          ? KConstantColors.bgColorFaint
                          : KConstantColors.bgColor,
                      borderRadius: BorderRadius.circular(08)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text("Local",
                          style: KCustomTextStyle.kLight(
                              context, FontSize.kMedium)),
                    ),
                  ),
                ),
              ),
              hSizedBox2,
              GestureDetector(
                onTap: () {
                  requestTabNotifier(renderUI: false)
                      .toggleLocalState(value: false);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: !isLocal
                          ? KConstantColors.bgColorFaint
                          : KConstantColors.bgColor,
                      borderRadius: BorderRadius.circular(08)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text("Common",
                          style: KCustomTextStyle.kLight(
                              context, FontSize.kMedium)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    col1() => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Request #2141",
                style: KCustomTextStyle.kBoldArp(context, FontSize.kMedium)),
            Text("Started at 12:14 PM",
                style: KCustomTextStyle.kLight(context, FontSize.kMedium)),
            vSizedBox3,
            kTab()
          ],
        );

    col2() => Container(
          height: 16.h,
          width: 48.w,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm8QHviDsKhfWFi1ehgjERMjfGPFAFHZBDgQ&s"),
                  fit: BoxFit.cover),
              color: KConstantColors.blueColor,
              borderRadius: BorderRadius.circular(08)),
        );

    tab1() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedContainer(
          curve: Curves.fastEaseInToSlowEaseOut,
          height: isLocal ? 36.h : 18.h,
          duration: const Duration(seconds: 3),
          decoration: BoxDecoration(
              color: KConstantColors.bgColorFaint,
              borderRadius: BorderRadius.circular(08)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      col1(),
                      hSizedBox2,
                      col2(),
                    ],
                  ),
                  Text(lorem,
                      style: KCustomTextStyle.kLight(context, FontSize.kMedium))
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: KConstantColors.bgColor,
      body: Center(child: tab1()),
    );
  }
}
