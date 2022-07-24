// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:zeromailx/mailx-engine/imports.dart';

void main() async {
  await ZeroNet.instance.connect("1MaiLX6j5MSddyu8oh5CxxGrhMcSmRo6N8");
  var secrets = {};

  test('testEciesDecryptFuture', () async {
    const nonDecrytablekey =
        "nz3LkmdQOWTRaWYqQSHSHQLKACDv36CCo7ZzEoJjiS091xxTd5Htl+fLOgxD05U9szmAywAgNMj6M6DeZFNainLFing6D4aHmpgIwAttYXwIhNm7OI2CI4aoOl64AGnvRyRLxuhiforIgsDMIdES0k4UYcamIwknPVDD1m77kQ7mIyQqNgiVclWmfnq4UAwgtVRsJNCWS1pn7vZKeRA+WNblYR8OHCt5kxhe/Jdfjve8FHxJw3MDOLuFkpV8UMz3nTXpSo7bf+OUWktjZVTrOmmPYYB6cA==";
    const decrytableKey =
        "yZeQTCSwXcohBolCWCc7JALKACDS7M2Y37fDLN0Q6/yA5IC63A+diV2mgoGajSXUdD+zhQAgxPG/Qa5wGTDmmh496Z6VAnf3glhVpH6b73Vz9WAn2fSHW8n/anS3iWphANq+rLL6N/JnB2SaCDS9s9Qxv/c9SA+8Xi0DvQ3/bn9Zxrh5hIhYnH6RcvxNvyfw8ocvKjJeTJBK5JJMCOfy5FLvG+ZLc+UIrU/WUTBd9MBDU/AVq/yqmdQKXAVjSRv422smEsHoqB3sSKI2gyf13wbTedUtmFz4cHBpGkcM1ZArACr3bdhUprivvaaOSsk2hUm5VFCBdi5ovuSuHNKMaxSfBIzLlT3B8Qa+nYltnN1JT8LSy6fVBhTSZzQp4tVi52E0LCYaIBru1cH0YDXtCjZvGf2mWnTLPL7VcvT7cteoL8+oSnMXthz/n6Ck3zCnqhOR5uQeE69lNKnUVroSn7tcvBcciLGLT8aO0CGKUHPrQ1b1J47SVjM+maFsIjRkuWrCQPLubwnGA8mpE/dakMnZ2oa7u5TvlVYj+kjBw7MXp4j4E1uu9UvqshCre5AvRxnMBYURqGWC9xaHToI3urUBwG5r2oBACuRtwC1wR8yYfEMQuFo/HALD2FVzfBAitUL+LmhL";

    var message = await ZeroNet.instance.eciesDecryptFuture(
      [decrytableKey],
    );
    assert(message.result.first is String);
    secrets = json.decode(message.result.first);
    assert(secrets.isNotEmpty);

    var message2 = await ZeroNet.instance.eciesDecryptFuture(
      [nonDecrytablekey],
    );
    assert(message2.result.first == null);
  });

  test('testUserClass', () async {
    final user = User("1AmeB7f5wBfJm6iR7MRZfFh65xkJzaVCX7", "");
  });

  test('base64NumberTest', () {
    final base64 = base64Encode(utf8.encode('1654959144452'));
    assert(base64 == 'MTY1NDk1OTE0NDQ1Mg==');
    final base64x = base64Encode(utf8.encode('Hello World!'));
    assert(base64x == 'SGVsbG8gV29ybGQh');
  });
}
