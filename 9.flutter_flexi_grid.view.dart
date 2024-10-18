import 'package:flutter/cupertino.dart';
import 'package:instagram_posts/shared/exports/export_boiler_plate.dart';

class FlexiGridNotifier extends ChangeNotifier {
  double gridCount = 1;
  void setGridCount({required double kCount}) {
    gridCount = kCount;
    notifyListeners();
  }
}

class FlutterFlexibleGridView extends StatelessWidget {
  const FlutterFlexibleGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlexiGridNotifier flexiGridNotifier({required bool renderUI}) =>
        Provider.of<FlexiGridNotifier>(context, listen: renderUI);

    double gridCount = flexiGridNotifier(renderUI: true).gridCount;

    return ScaffoldShellForLists(widgets: [
      Center(
        child: CupertinoSlider(
            activeColor: KConstantColors.whiteColor,
            min: 1,
            max: 5,
            value: gridCount,
            onChanged: ((value) {
              flexiGridNotifier(renderUI: false).setGridCount(kCount: value);
            })),
      ),
      SizedBox(
        height: 100.h,
        width: 100.w,
        child: AnimatedGrid(
          initialItemCount: 8,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridCount.toInt()),
          itemBuilder:
              (BuildContext context, int index, Animation<double> animation) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  decoration: BoxDecoration(
                      color: KConstantColors.bgColorFaint,
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://images.beta.cosmos.so/5919dc85-e082-4f75-838b-a87d163f513b?format=jpeg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(25))),
            );
          },
        ),
      )
    ]);
  }
}
