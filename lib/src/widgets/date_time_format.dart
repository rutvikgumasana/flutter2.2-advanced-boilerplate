import 'package:intl/intl.dart';

class DateTimeFormatter {
  String setAcceptRequestDateFormat(date) {
    return DateFormat('dd MMMM yyyy').format(DateTime.parse(date).toLocal());
  }

  String setGameDateFormat(date) {
    return DateFormat('EEE, MMM dd - kk:mm')
        .format(DateTime.parse(date).toLocal());
  }

  String setLastMatchDate(date) {
    return DateFormat('dd MMM').format(DateTime.parse(date).toLocal());
  }

  String getTime(date) {
    return DateFormat('HH:mm').format(DateTime.parse(date).toLocal());
  }

  String dashboardDate(date) {
    return DateFormat('EEE, MMM dd, kk:mm ')
        .format(DateTime.parse(date).toLocal());
  }

  String notificationDate(date) {
    return DateFormat('dd MMMM yyyy').format(DateTime.parse(date).toLocal());
  }

  String preferenceDate(date) {
    // date.toIso8601String();
    return DateFormat('EEE, MMM dd', 'en_US')
        .format(DateTime.parse(date).add(Duration(days: 1)).toLocal());
  }

  String walletDate(date) {
    return DateFormat('MMM dd, yyyy kk:mm a')
        .format(DateTime.parse(date).toLocal());
  }

  String messageDate(date) {
    return DateFormat('MMM dd').format(DateTime.parse(date).toLocal());
  }
}

// class DateFormatter {
//   DateFormatter(this.localizations);

//   AppLocalizations localizations;

//   String getVerboseDateTimeRepresentation(DateTime dateTime) {
//     DateTime now = DateTime.now();
//     DateTime justNow = now.subtract(Duration(minutes: 1));
//     DateTime localDateTime = dateTime.toLocal();

//     if (!localDateTime.difference(justNow).isNegative) {
//       return localizations.translate('dateFormatter_just_now');
//     }

//     String roughTimeString = DateFormat('jm').format(dateTime);

//     if (localDateTime.day == now.day &&
//         localDateTime.month == now.month &&
//         localDateTime.year == now.year) {
//       return roughTimeString;
//     }

//     DateTime yesterday = now.subtract(Duration(days: 1));

//     if (localDateTime.day == yesterday.day &&
//         localDateTime.month == now.month &&
//         localDateTime.year == now.year) {
//       return localizations.translate('dateFormatter_yesterday');
//     }

//     if (now.difference(localDateTime).inDays < 4) {
//       String weekday = DateFormat('EEEE', localizations.locale.toLanguageTag())
//           .format(localDateTime);

//       return '$weekday, $roughTimeString';
//     }

//     return '${DateFormat('yMd', localizations.locale.toLanguageTag()).format(dateTime)}, $roughTimeString';
//   }
// }
