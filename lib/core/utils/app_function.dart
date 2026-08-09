import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/core/shared/app_feature/data/datasources/app_shared_prefs.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/core/utils/input_formatters/phone_formatter.dart';

abstract class AppFunction {
  static String formatPhoneNumber(String phone) {
    const mgMask = '3X XX XXX XX';
    final formatted = PhoneInputFormatter(
      mask: mgMask,
    ).formatEditUpdate(TextEditingValue.empty, TextEditingValue(text: phone));
    return formatted.text;
  }

  static String codePhoneNumber(String phone) {
    // Remove spaces, parentheses, dashes, etc.
    var normalized = phone.replaceAll(RegExp(r'\D'), '');
    // Remove leading 0 from local phone number
    if (normalized.startsWith('0')) {
      normalized = normalized.substring(1);
    }
    // Madagascar: 3X XX XXX XX
    if (RegExp(r'^3\d{8}$').hasMatch(normalized)) {
      return '+261';
    }
    // France: 6X XX XX XX XX
    if (RegExp(r'^6\d{8}$').hasMatch(normalized)) {
      return '+33';
    }
    // United Kingdom: 7XXX XXX XXX
    if (RegExp(r'^7\d{9}$').hasMatch(normalized)) {
      return '+44';
    }
    // China: 1XX XXXX XXXX
    if (RegExp(r'^1\d{10}$').hasMatch(normalized)) {
      return '+86';
    }
    // South Korea: 1X XXXX XXXX
    if (RegExp(r'^1\d{9}$').hasMatch(normalized)) {
      return '+82';
    }
    return '';
  }

  static String getDate(String dateInput) {
    if (dateInput.isEmpty) return '';

    DateTime inputDate;
    try {
      inputDate = DateTime.parse(dateInput).toLocal();
    } catch (e) {
      return dateInput;
    }

    final String? lang = GetIt.instance<AppSharedPrefs>().get(Constants.lang);
    final String currentLang = lang ?? 'en';

    final int day = inputDate.day;
    final int month = inputDate.month;
    final int year = inputDate.year;

    const List<String> frenchMonths = [
      '',
      'Janvier',
      'Février',
      'Mars',
      'Avril',
      'Mai',
      'Juin',
      'Juillet',
      'Août',
      'Septembre',
      'Octobre',
      'Novembre',
      'Décembre',
    ];

    const List<String> englishMonths = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    const List<String> malagasyMonths = [
      '',
      'Janoary',
      'Febroary',
      'Martsa',
      'Aprily',
      'Mey',
      'Jona',
      'Jolay',
      'Aogositra',
      'Septambra',
      'Oktobra',
      'Novambra',
      'Desambra',
    ];

    const List<String> chineseMonths = [
      '',
      '一月',
      '二月',
      '三月',
      '四月',
      '五月',
      '六月',
      '七月',
      '八月',
      '九月',
      '十月',
      '十一月',
      '十二月',
    ];

    const List<String> koreanMonths = [
      '',
      '1월',
      '2월',
      '3월',
      '4월',
      '5월',
      '6월',
      '7월',
      '8월',
      '9월',
      '10월',
      '11월',
      '12월',
    ];

    if (currentLang == 'fr') {
      return '$day ${frenchMonths[month]} $year';
    } else if (currentLang == 'mg') {
      return '${malagasyMonths[month]} $day, $year';
    } else if (currentLang == 'zh') {
      return '$year年${chineseMonths[month]}$day日';
    } else if (currentLang == 'ko') {
      return '$year년 ${koreanMonths[month]} $day일';
    } else {
      return '${englishMonths[month]} $day, $year';
    }
  }

  static String dateTimeCounter(String dateInput, BuildContext context) {
    DateTime inputDate;
    try {
      // Attempt to parse the input ISO string (e.g., "2025-02-03T12:52:31.000000Z")
      inputDate = DateTime.parse(dateInput).toLocal();
    } catch (e) {
      // If parsing fails, return a default value.
      return 'N/A';
    }

    final DateTime now = DateTime.now();
    final Duration diff = now.difference(inputDate);

    final int totalMinutes = diff.inMinutes;
    final int totalHours = diff.inHours;
    final int totalDays = diff.inDays;

    // Less than 1 minute → À l'instant
    if (totalMinutes < 1) {
      return context.appLoc.now;
    }

    // Less than 1 hour → X minute(s)
    if (totalHours < 1) {
      return totalMinutes == 1
          ? context.appLoc.one_minute
          : '$totalMinutes ${context.appLoc.minutes.toLowerCase()}';
    }

    // Less than 24 hours → X heure(s)
    if (totalDays < 1) {
      return totalHours == 1
          ? context.appLoc.one_hour
          : '$totalHours ${context.appLoc.hours.toLowerCase()}';
    }

    // Yesterday
    final DateTime yesterday = DateTime(now.year, now.month, now.day - 1);
    final DateTime inputDay = DateTime(
      inputDate.year,
      inputDate.month,
      inputDate.day,
    );
    if (inputDay == yesterday) {
      return context.appLoc.yesterday;
    }

    // Less than 7 days → X jour(s)
    if (totalDays < 7) {
      return '$totalDays ${context.appLoc.days}';
    }

    // Compute full months difference for finer bucketing
    int monthsDiff =
        (now.year - inputDate.year) * 12 + (now.month - inputDate.month);
    // Adjust if the day hasn't been reached yet this month
    if (now.day < inputDate.day) monthsDiff--;

    // Less than 4 weeks (≈ 1 month) → X semaine(s)
    if (monthsDiff < 1) {
      final int weeks = (totalDays / 7).floor();
      return weeks == 1
          ? context.appLoc.one_week
          : '$weeks ${context.appLoc.weeks}';
    }

    // Less than 12 months → X mois
    if (monthsDiff < 12) {
      return monthsDiff == 1
          ? context.appLoc.one_month
          : '$monthsDiff ${context.appLoc.months}';
    }

    // 12+ months → X an(s)
    final int years = (monthsDiff / 12).floor();
    return years == 1
        ? context.appLoc.one_year
        : '$years ${context.appLoc.years}';
  }

  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  static String formatNumberWithSpaces(int number) {
    final numberString = number.toString();
    final buffer = StringBuffer();

    int counter = 0;

    for (int i = numberString.length - 1; i >= 0; i--) {
      buffer.write(numberString[i]);
      counter++;

      if (counter % 3 == 0 && i != 0) {
        buffer.write(' ');
      }
    }

    return buffer.toString().split('').reversed.join();
  }

  static bool isExpired(String dateInput) {
    try {
      final DateTime inputDate = DateTime.parse(dateInput).toLocal();
      return DateTime.now().isAfter(inputDate);
    } catch (e) {
      return false;
    }
  }
}
