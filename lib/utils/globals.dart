import 'package:Dagi_Moses_Portfolio/models/header_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Globals {
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
}

final scrollControllerProvider =
    StateProvider<ScrollController>((ref) => ScrollController());

final keysProvider = StateProvider<List<GlobalKey>>((ref) {
  return List.generate(9, (_) => GlobalKey());
});

Size? screenSize;
final scrollToSectionProvider =
    StateProvider<Future<void> Function(GlobalKey)>((ref) {
  final _scrollController = ref.read(scrollControllerProvider);
  return (GlobalKey key) async {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final offset = screenSize!.width < 400
        ? renderBox.localToGlobal(Offset.zero).dy + 100
        : renderBox.localToGlobal(Offset.zero).dy;
    _scrollController.animateTo(offset,
        duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
  };
});

List<HeaderItem> buildHeaderItems(
    Future<void> Function(GlobalKey) scrollToSection, List<GlobalKey> keys) {
  return [
    HeaderItem(
        title: "MY INTRO",
        onTap: () {
          scrollToSection(keys[0]);
        }),
    HeaderItem(
        title: "SERVICES",
        onTap: () {
          scrollToSection(keys[1]);
        }),
    HeaderItem(
        title: "PORTFOLIO",
        onTap: () {
          scrollToSection(keys[3]);
        }),
    HeaderItem(
      title: "EDUCATION",
      onTap: () {
        scrollToSection(keys[4]);
      },
    ),
    HeaderItem(
      title: "CERTIFICATIONS",
      onTap: () {
        scrollToSection(keys[5]);
      },
    ),
    HeaderItem(
        title: "SKILLS",
        onTap: () {
          scrollToSection(keys[6]);
        }),
    HeaderItem(
      title: "HIRE ME",
      onTap: () {
        scrollToSection(keys[8]);
      },
      isButton: true,
    ),
  ];
}

final headerItemsProvider = Provider<List<HeaderItem>>((ref) {
  final scrollToSection = ref.read(scrollToSectionProvider);
  final keys = ref.watch(keysProvider);

  return buildHeaderItems(scrollToSection, keys);
});
