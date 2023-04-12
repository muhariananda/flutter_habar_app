import 'package:timeago/timeago.dart' as timeago;

extension StringToTimeAgo on String {
  String toTimeAgo() {
    final date = DateTime.parse(this);
    return timeago.format(date);
  }
}
