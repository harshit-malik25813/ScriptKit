import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'homework_functions.dart';

void main() {
  runApp(const HomeworkApp());
}

class HomeworkApp extends StatelessWidget {
  const HomeworkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homework Formatter',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: const HomeworkPage(),
    );
  }
}

class HomeworkPage extends StatefulWidget {
  const HomeworkPage({super.key});

  @override
  State<HomeworkPage> createState() => _HomeworkPageState();
}

class _HomeworkPageState extends State<HomeworkPage> {
  final _className = TextEditingController(text: 'CLASS');
  final _date = TextEditingController(text: _formatDate(DateTime.now()));

  final _lectureSubjects = List.generate(6, (_) => TextEditingController());
  final _lectureClasswork = List.generate(6, (_) => TextEditingController());
  final _lectureHomework = List.generate(6, (_) => TextEditingController());

  final _lectureEmojis = const ['🔴', '🔵', '🟢', '🟡', '🟠', '🟣'];

  String _output = '';

  @override
  void dispose() {
    _className.dispose();
    _date.dispose();
    for (final controller in _lectureSubjects) {
      controller.dispose();
    }
    for (final controller in _lectureClasswork) {
      controller.dispose();
    }
    for (final controller in _lectureHomework) {
      controller.dispose();
    }
    super.dispose();
  }

  void _generate() {
    setState(() {
      _output = buildHomework(
        className: _className.text,
        dateText: _date.text,
        lectures: List.generate(
          6,
          (index) => LectureEntry(
            emoji: _lectureEmojis[index],
            subject: _lectureSubjects[index].text,
            classwork: _lectureClasswork[index].text,
            homework: _lectureHomework[index].text,
          ),
        ),
      );
    });
  }

  Future<void> _copyOutput() async {
    if (_output.isEmpty) return;
    await Clipboard.setData(ClipboardData(text: _output));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Classwork & Homework Formatter')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _inputField(_className, 'Class / Section'),
              _inputField(_date, 'Date (DD/MM/YYYY)'),
              const SizedBox(height: 8),
              ...List.generate(6, _lectureCard),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: _generate,
                child: const Text('Generate'),
              ),
              const SizedBox(height: 16),
              if (_output.isNotEmpty) _outputBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputField(
    TextEditingController controller,
    String label, {
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _lectureCard(int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lecture ${index + 1}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              _inputField(_lectureSubjects[index], 'Subject Name'),
              _inputField(_lectureClasswork[index], 'Classwork', maxLines: 2),
              _inputField(_lectureHomework[index], 'Homework', maxLines: 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _outputBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Output',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton.icon(
                onPressed: _copyOutput,
                icon: const Icon(Icons.copy, size: 16),
                label: const Text('Copy'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SelectableText(
            '\n$_output\n',
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'monospace',
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  static String _formatDate(DateTime now) {
    final day = now.day.toString().padLeft(2, '0');
    final month = now.month.toString().padLeft(2, '0');
    return '$day/$month/${now.year}';
  }
}
