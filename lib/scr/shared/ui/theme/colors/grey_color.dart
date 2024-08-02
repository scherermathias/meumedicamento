part of 'colors.dart';

abstract class GreyColor {
  /// Preview:
  ///
  /// ![](https://i.imgur.com/hCBEwrv.png)
  static Color get white => HexColor.fromHex('#FFFFFF');

  /// Preview:
  ///
  /// ![](https://i.imgur.com/b3eKDpe.png)
  static Color get lightest => HexColor.fromHex('#F5F5F5');

  /// Preview:
  ///
  /// ![](https://i.imgur.com/j0tdgV8.png)
  static Color get light => HexColor.fromHex('#D6D6D6');

  /// Preview:
  ///
  /// ![](https://i.imgur.com/yw5epoh.png)
  static Color get medium => HexColor.fromHex('#848584');

  /// Preview:
  ///
  /// ![](https://i.imgur.com/9hPBp4Q.png)
  static Color get base => HexColor.fromHex('#495057');

  /// Preview:
  ///
  /// ![](https://i.imgur.com/vsECrwn.png)
  static Color get dark => HexColor.fromHex('#212529');

  /// Preview:
  ///
  /// ![](https://i.imgur.com/hOF1c3n.png)
  static Color get black => HexColor.fromHex('#000000');
}
