// ignore: avoid_web_libraries_in_flutter
// import '' if (dart.library.io) 'dart:io' if (dart.library.html) 'dart:html';

import 'mailx-engine/imports.dart';

void main() async {
  init();
  runApp(const ZeroMailX());
}

//TODO!: Uncomment when web platform is ready
// if (kIsWeb) test();
// void test() {
//   var siteInfo = document.getElementById('script_init')?.innerHtml;
//   print(siteInfo);
// }