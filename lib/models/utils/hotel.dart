

class HotelUtils{

  static num getRatingStar(String category){
    // Regular expression to capture a number potentially surrounded by other text
    var match = RegExp(r'(\d+)').firstMatch(category);
    if (match != null) {
      return int.tryParse(match.group(1)!) ?? 0;  // Default to 3 if parsing fails
    }

    // Assume luxury levels for codes with specific keywords
    if (category.contains('LUX')) {
      return 5;
    }

    // Default based on other key identifiers
    if (category.contains('VTV') || category.contains('STD') || category.startsWith('H')) {
      return 3;  // More flexible handling of common codes
    }

    // Default to a middle rating if no other rules match
    return 0;
  }

  static hasFreeCancellation(json) {
    return false;
  }



}