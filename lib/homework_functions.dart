String textBold(String value) => '*$value*';

String maths(String hw) {
  final value = hw.trim();
  if (value.isEmpty) return '';
  return '${textBold('Maths')}: $value\n\n';
}

String phy(String hw) {
  final value = hw.trim();
  if (value.isEmpty) return '';
  return '${textBold('Physics')}: $value\n\n';
}

String chem(String hw) {
  final value = hw.trim();
  if (value.isEmpty) return '';
  return '${textBold('Chemistry')}: $value\n\n';
}

String bio(String hw) {
  final value = hw.trim();
  if (value.isEmpty) return '';
  return '${textBold('Biology')}: $value\n\n';
}

String sst(String hw) {
  final value = hw.trim();
  if (value.isEmpty) return '';
  return '${textBold('SST')}: $value\n\n';
}

String hindi(String hw) {
  final value = hw.trim();
  if (value.isEmpty) return '';
  return '${textBold('Hindi')}: $value\n\n';
}

String eng(String hw) {
  final value = hw.trim();
  if (value.isEmpty) return '';
  return '${textBold('English')}: $value\n\n';
}

String additional(String detail) => detail.trim();

String printHeader(DateTime now) {
  final date = '${now.day.toString().padLeft(2, '0')}-'
      '${now.month.toString().padLeft(2, '0')}-'
      '${now.year}';
  return '${textBold('Homework')}\n\n${textBold(date)}\n\n';
}

String buildHomework({
  required String mathsHw,
  required String physicsHw,
  required String chemistryHw,
  required String biologyHw,
  required String sstHw,
  required String hindiHw,
  required String englishHw,
  required String additionalDetails,
  DateTime? now,
}) {
  final buffer = StringBuffer();
  buffer.write(printHeader(now ?? DateTime.now()));
  buffer.write(maths(mathsHw));
  buffer.write(phy(physicsHw));
  buffer.write(chem(chemistryHw));
  buffer.write(bio(biologyHw));
  buffer.write(sst(sstHw));
  buffer.write(hindi(hindiHw));
  buffer.write(eng(englishHw));

  final extra = additional(additionalDetails);
  if (extra.isNotEmpty) {
    if (!buffer.toString().endsWith('\n')) {
      buffer.writeln();
    }
    buffer.writeln();
    buffer.write(extra);
  }

  return buffer.toString().trimRight();
}
