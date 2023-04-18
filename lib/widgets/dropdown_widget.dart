import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import 'package:townhall/models/student.dart';
// const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class DropdownButtonWidget extends StatefulWidget {
  final double fontSize;
  final List<String> list;
  final String label;
  final double width;
  final FocusNode focusNode;
  final String selectedNode;
  const DropdownButtonWidget({
    Key? key,
    required this.fontSize,
    required this.list,
    required this.label,
    required this.width,
    required this.focusNode,
    required this.selectedNode,
  }) : super(key: key);

  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  late String dropdownValue = (widget.label == 'Section')?'S1':widget.list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      focusNode: widget.focusNode,
      value: dropdownValue,
      icon: Icon(
        Icons.arrow_downward,
        size: widget.fontSize,
        color: (widget.width>710)?AppColors.backColor:AppColors.whiteColor,
      ),
      elevation: 16,
      style:  GoogleFonts.getFont(
        'Ubuntu',
        fontSize: widget.fontSize,
        color: (widget.width>710)?AppColors.backColor:AppColors.whiteColor,
        fontWeight: FontWeight.w300,
      ),
      underline: Container(
        height: 1,
        color: Colors.transparent,
      ),
      menuMaxHeight: 400,
      dropdownColor: (widget.width<710)?AppColors.backColor:AppColors.whiteColor,
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
