import 'package:flutter/material.dart';

class PageVew extends StatefulWidget {
  const PageVew({super.key});

  @override
  State<PageVew> createState() => _PageVewState();
}

class _PageVewState extends State<PageVew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        // A flexible app bar
        const SliverAppBar(
          backgroundColor: Colors.blue,
          title: Text('App Barskpk'),
          expandedHeight: 20,
          pinned: true,
        ),
        // Uses the remaining space
        SliverFillRemaining(
          // Renders a scrollable list
          child: ListView.builder(
            itemBuilder: (context, index) => ListTile(
              title: Text(
                'Text $index',
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
