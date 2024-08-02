part of 'colors.dart';

abstract class BrandColor {
  /// Use this method if you want to change brand colors after initialization.
  ///
  /// ```dart
  /// BrandColor.rebrand(
  ///   lightColorHex: '#FFCAA9',
  ///   mediumColorHex: '#F47526',
  ///   baseColorHex: '#F0481C',
  ///   darkColorHex: '#5903af',
  /// );
  /// ```
  static void rebrand({
    required String lightColorHex,
    required String mediumColorHex,
    required String baseColorHex,
    required String darkColorHex,
  }) {
    BrandColor.light = HexColor.fromHex(lightColorHex);
    BrandColor.medium = HexColor.fromHex(mediumColorHex);
    BrandColor.base = HexColor.fromHex(baseColorHex);
    BrandColor.dark = HexColor.fromHex(darkColorHex);
  }

  static Color light = HexColor.fromHex('#e9f2d2');

  static Color medium = HexColor.fromHex('#aed356');

  static Color base = HexColor.fromHex('#00975d');

  static Color dark = HexColor.fromHex('#1a402f');
}
