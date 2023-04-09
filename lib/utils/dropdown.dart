import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app_colors.dart';
import 'package:townhall/models/student.dart';
// const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class DropdownButtonExample extends StatefulWidget {
  final double fontSize;
  final List<String> list;
  final String label;
  const DropdownButtonExample({
    Key? key,
    required this.fontSize,
    required this.list,
    required this.label,
  }) : super(key: key);

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  late String dropdownValue = (widget.label == 'Section')?(Student.year != '1st Year')?'I':'S1':widget.list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(
        Icons.arrow_downward,
        size: widget.fontSize,
      ),
      elevation: 16,
      style: GoogleFonts.getFont(
        'Ubuntu',
        fontSize: widget.fontSize,
        color: AppColors.backColor,
        fontWeight: FontWeight.w600,
      ),
      underline: Container(
        height: 2,
        color: Colors.transparent,
      ),
      onChanged: (String? value) {
        setState(() {
          // DropDownSelector.selectedDropDown = 'None';
          dropdownValue = value!;
          if (widget.label == 'Year') {
            Student.year = dropdownValue.toString();
          } else if (widget.label == 'Branch') {
            Student.branch = dropdownValue.toString();
          } else {
            Student.section = dropdownValue.toString();
          }
        });
      },
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
    );
  }
}
