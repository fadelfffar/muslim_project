import 'package:flutter/material.dart';

class MosqueScheduleScreen extends StatefulWidget {
  const MosqueScheduleScreen({super.key});

  @override
  State<MosqueScheduleScreen> createState() => _MosqueScheduleScreenState();
}

class _MosqueScheduleScreenState extends State<MosqueScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mosque Schedule'),
      ),
      body: Center(
        child: Column(
          children: [
            FilledButton(
              onPressed: () async {
                await Navigator.of(context).pushNamed('/table');
              },
              child: const Text('TableView Explorer'),),
            
          ],
        ),
      ),
    );
  }
}