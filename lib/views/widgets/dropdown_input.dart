import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownInput extends StatefulWidget {
  final List<String> options;
  final Function onChanged;
  final String hintText;
  final String labelText;
  final String errorText;
  final bool isError;

  DropdownInput({
    this.hintText = '',
    this.labelText = '',
    this.options,
    this.isError = false,
    this.errorText = '',
    this.onChanged,
  });

  @override
  _DropdownInputState createState() => _DropdownInputState();
}

class _DropdownInputState extends State<DropdownInput>{

  String _value;

  @override
  void initState() {
    _value = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.only(left: 12, right: 12),
          margin: EdgeInsets.only(left: 42, right: 42, bottom: 7),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.isError ? widget.errorText : widget.labelText,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                color: widget.isError ? Colors.red : Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 12, right: 12),
          margin: EdgeInsets.only(left: 42, right: 42),
          height: 47.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: const Color(0x7b000000),
            border: widget.isError ? Border.all(width: 1, color: Colors.red) : null,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: Text(
                widget.hintText,
                style: TextStyle(
                  fontSize: 20,
                  color: const Color(0x98ffffff),
                  fontWeight: FontWeight.w700,
                ),
              ),
              dropdownColor: const Color(0x7b000000),
              onChanged: (value) {
                FocusScope.of(context).requestFocus(FocusNode());
                widget.onChanged(value);
                setState(() {
                  _value = value;
                });
              },
              isExpanded: true,
              value: _value,
              items: widget.options.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}