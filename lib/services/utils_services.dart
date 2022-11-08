abstract class UtilsServices {
  static String verifyText(int id) {
    final numberText = id.toString();

    if (numberText.length == 1) {
      return '#${numberText.padLeft(3, '0')}';
    } else if (numberText.length == 2) {
      return '#${numberText.padLeft(3, '0')}';
    } else {
      return '#$numberText';
    }
  }
}
