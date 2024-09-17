import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: ScrollbarExample(),
    ),
  ));
}

class ScrollbarExample extends StatelessWidget {
  final ScrollController _verticalScroll = ScrollController();
  final ScrollController _horizontalScroll = ScrollController();

  ScrollbarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 400,
        ),
        child: Scrollbar(
          controller: _verticalScroll,
          thumbVisibility: true,
          child: SingleChildScrollView(
            controller: _verticalScroll,
            scrollDirection: Axis.vertical,
            child: Scrollbar(
              controller: _horizontalScroll,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: _horizontalScroll,
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: List.generate(
                    10,
                    (index) => DataColumn(label: Text('Column $index')),
                  ),
                  rows: List.generate(
                    50,
                    (index) => DataRow(
                      cells: List.generate(
                        10,
                        (cellIndex) =>
                            DataCell(Text('Row $index, Cell $cellIndex')),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
