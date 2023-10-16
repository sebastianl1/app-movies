import 'package:intl/intl.dart';

class FormaNum {

  static String number( double number){

    // ignore: non_constant_identifier_names
    final FormatNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '*',
      locale: 'en'
    ).format(number);


    return FormatNumber;




  }







}




