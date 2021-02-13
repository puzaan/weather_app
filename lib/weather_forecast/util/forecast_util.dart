import 'package:intl/intl.dart';

class Util{
  //adding api with your own key
  static String appId = "ed60fcfbd110ee65c7150605ea8aceea";
  
  static String getFormattedDate(DateTime dateTime){
    return new DateFormat("EEEE, MMM d, y").format(dateTime);
  }
}