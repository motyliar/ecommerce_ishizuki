import 'package:flutter/material.dart';

const List<DropdownMenuItem<String>> dropDownItems = [
  DropdownMenuItem<String>(
    value: 'EU',
    child: Text(
      'EU',
    ),
  ),
  DropdownMenuItem<String>(
    value: 'USA',
    child: Text('USA'),
  ),
  DropdownMenuItem<String>(
    value: 'UK',
    child: Text('UK'),
  ),
  DropdownMenuItem<String>(
    value: 'Other',
    child: Text('Other'),
  ),
  DropdownMenuItem<String>(
    value: '',
    child: Text('Choose'),
  ),
];

const List<DropdownMenuItem<String>> productKind = [
  DropdownMenuItem(
      value: 'Slab',
      child: Text(
        'Slab',
      )),
  DropdownMenuItem(value: 'Rock', child: Text('Rock')),
  DropdownMenuItem(value: 'Pot', child: Text('Pot')),
];
