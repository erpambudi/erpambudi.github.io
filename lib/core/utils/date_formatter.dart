import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter._();

  static final DateFormat _fullFormat = DateFormat(
    'dd MMMM yyyy, HH:mm',
    'id_ID',
  );
  static final DateFormat _dateOnly = DateFormat('dd MMM yyyy', 'id_ID');
  static final DateFormat _shortFormat = DateFormat('dd/MM/yyyy', 'id_ID');
  static final DateFormat _timeOnly = DateFormat('HH:mm', 'id_ID');

  static String formatFull(DateTime date) {
    return _fullFormat.format(date);
  }

  static String formatDateOnly(DateTime date) {
    return _dateOnly.format(date);
  }

  static String formatShort(DateTime date) {
    return _shortFormat.format(date);
  }

  static String formatTime(DateTime date) {
    return _timeOnly.format(date);
  }

  static String formatRelative(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inMinutes < 1) {
      return 'Baru saja';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} menit lalu';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} jam lalu';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} hari lalu';
    } else {
      return formatDateOnly(date);
    }
  }
}
