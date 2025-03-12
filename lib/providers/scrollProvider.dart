import 'package:flutter/material.dart';

class ScrollControllerProvider extends ChangeNotifier {
  ScrollController scrollController = ScrollController();
  List<GlobalKey> keys = List.generate(9, (index) => GlobalKey());


 

Future<void> scrollToSection(GlobalKey key) async {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero).dy;

    scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
