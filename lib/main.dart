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
  final _maths = TextEditingController();
  final _physics = TextEditingController();
  final _chemistry = TextEditingController();
  final _biology = TextEditingController();
  final _sst = TextEditingController();
  final _hindi = TextEditingController();
  final _english = TextEditingController();
  final _additional = TextEditingController();

  String _output = '';

  @override
  void dispose() {
    _maths.dispose();
    _physics.dispose();
    _chemistry.dispose();
    _biology.dispose();
    _sst.dispose();
    _hindi.dispose();
    _english.dispose();
    _additional.dispose();
    super.dispose();
  }

  void _generate() {
    setState(() {
      _output = buildHomework(
        mathsHw: _maths.text,
        physicsHw: _physics.text,
        chemistryHw: _chemistry.text,
        biologyHw: _biology.text,
        sstHw: _sst.text,
        hindiHw: _hindi.text,
        englishHw: _english.text,
        additionalDetails: _additional.text,
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
      appBar: AppBar(title: const Text('Homework Formatter')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _inputField(_maths, 'Maths'),
              _inputField(_physics, 'Physics'),
              _inputField(_chemistry, 'Chemistry'),
              _inputField(_biology, 'Biology'),
              _inputField(_sst, 'SST'),
              _inputField(_hindi, 'Hindi'),
              _inputField(_english, 'English'),
              _inputField(
                _additional,
                'Additional details',
                maxLines: 3,
              ),
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
            '```\n$_output\n```',
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
}
