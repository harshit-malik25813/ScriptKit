String textBold(String value) => '*$value*';

String textItalic(String value) => '_${value}_';

String textBoldItalic(String value) => '*_${value}_*';

String _trimmedOrFallback(String value, String fallback) {
  final trimmed = value.trim();
  return trimmed.isEmpty ? fallback : trimmed;
}

String _trimmed(String value) => value.trim();

String formatDate(DateTime now) {
  final day = now.day.toString().padLeft(2, '0');
  final month = now.month.toString().padLeft(2, '0');
  return '$day/$month/${now.year}';
}

class LectureEntry {
  const LectureEntry({
    required this.emoji,
    required this.subject,
    required this.classwork,
    required this.homework,
  });

  final String emoji;
  final String subject;
  final String classwork;
  final String homework;
}

String _lectureBlock({
  required int number,
  required LectureEntry lecture,
}) {
  final subject = _trimmedOrFallback(lecture.subject, 'Subject Name');
  final classwork = _trimmed(lecture.classwork);
  final homework = _trimmed(lecture.homework);
  return [
    '${lecture.emoji} ${textBold('LECTURE $number: $subject')}',
    '${textBold('Classwork')} : $classwork',
    '${textBold('Homework')} : $homework',
    '',
  ].join('\n');
}

String buildHomework({
  required String className,
  required String dateText,
  required List<LectureEntry> lectures,
  DateTime? now,
}) {
  final buffer = StringBuffer();
  final resolvedDate = _trimmed(dateText).isEmpty
      ? formatDate(now ?? DateTime.now())
      : _trimmed(dateText);

  // ignore: unnecessary_string_interpolations
  buffer.writeln('${textBoldItalic("DAILY CLASSWORK & HOMEWORK UPDATE")}');
  buffer.writeln();
  buffer.writeln('${textBoldItalic(_trimmedOrFallback(className, 'CLASS'))}-');
  buffer.writeln('${textBold('Date')} : $resolvedDate');
  buffer.writeln();

  for (var index = 0; index < lectures.length; index++) {
    buffer.write(_lectureBlock(number: index + 1, lecture: lectures[index]));
  }

  return buffer.toString().trimRight();
}
