
import 'package:clothingstore/core/constants/enums.dart';
import 'package:intl/intl.dart';

class NFormatters {
  String addressTypeToString(AddressType type) {
    switch (type) {
      case AddressType.home:
        return 'home';
      case AddressType.work:
        return 'work';
      case AddressType.other:
        return 'others';
      default:
        return 'home';
    }
  }

  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat(
      'dd-MMM-yyyy',
    ).format(date); // Keep the date format as needed
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(
      locale: 'en_IN', // Set locale to India
      symbol: '₹', // Set symbol to Indian Rupee
    ).format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    // Assuming a 10-digit Indian phone number format: 12345 67890
    if (phoneNumber.length == 10) {
      return '${phoneNumber.substring(0, 5)} ${phoneNumber.substring(5)}';
    } else if (phoneNumber.length == 11) {
      return '${phoneNumber.substring(0, 1)} ${phoneNumber.substring(1, 6)} ${phoneNumber.substring(6)}';
    }
    // Add more custom phone number formatting logic for different formats if needed.
    return phoneNumber;
  }

  // Not fully tested.
  static String internationalFormatPhoneNumber(String phoneNumber) {
    // Remove any non-digit characters from the phone number
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Extract the country code from the digitsOnly
    String countryCode = '+${digitsOnly.substring(0, 2)}';
    digitsOnly = digitsOnly.substring(2);

    // Add the remaining digits with proper formatting
    final formattedNumber = StringBuffer();
    formattedNumber.write('$countryCode ');

    int i = 0;
    while (i < digitsOnly.length) {
      int groupLength;

      if (i == 0 && countryCode == '+91') {
        // Indian country code
        groupLength = 5; // Indian format has 5 digits, then 5 more
      } else {
        groupLength = 5;
      }

      int end = i + groupLength;
      formattedNumber.write(digitsOnly.substring(i, end));

      if (end < digitsOnly.length) {
        formattedNumber.write(' ');
      }

      i = end;
    }

    return formattedNumber.toString();
  }
}
