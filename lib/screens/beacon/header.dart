//  Copyright (c) 2018 Loup Inc.
//  Licensed under Apache License v2.0

import 'dart:io';

import 'package:beacon_bus/blocs/login/login_provider.dart';
import 'package:beacon_bus/constants.dart';
import 'package:beacon_bus/screens/teacher/teacher_bus_screen.dart';
import 'package:beacons/beacons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:beacon_bus/screens/teacher/teacher_home_screen.dart';

class Header extends StatefulWidget {
  const Header({
    Key key,
    this.regionIdentifier,
    this.running,
    this.onStart,
  }) : super(key: key);

  final String regionIdentifier;
  final bool running;
  final ValueChanged<BeaconRegion> onStart;

  @override
  _HeaderState createState() => new _HeaderState();
}

class _HeaderState extends State<Header> {
  FormType _formType;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _formType = Platform.isIOS ? FormType.iBeacon : FormType.generic;
  }

  void _onTapSubmit() {
    if (widget.running) {
    } else {
      if (!_formKey.currentState.validate()) {
        return;
      }
      List<dynamic> ids = [];
      BeaconRegion region =
          BeaconRegion(identifier: widget.regionIdentifier, ids: ids);

      // ignore: missing_enum_constant_in_switch
      switch (_formType) {
        case FormType.iBeacon:
          region = BeaconRegionIBeacon.from(region);
          break;
      }

      widget.onStart(region);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          new Form(
            key: _formKey,
            child: _formType == FormType.generic
                ? new _FormGeneric(
                    running: widget.running,
                  )
                : new _FormIBeacon(
                    running: widget.running,
                  ),
          ),
          _Button(
            running: widget.running,
            onTap: _onTapSubmit,
          )
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  _Button({
    @required this.running,
    @required this.onTap,
  });

  final bool running;
  final VoidCallback onTap;
  int carNum = TeacherHomeScreen.carNum;
  @override
  Widget build(BuildContext context) {
    final bloc = LoginProvider.of(context);
    String teacherName = bloc.prefs.getString(USER_NAME);
    return CupertinoButton(
      child: Text(
        "운행 시작",
        style: TextStyle(
          color: Color(0xFF1EA8E0),
        ),
      ),
      onPressed: () {
        onTap();
        Firestore.instance
            .collection('Kindergarden')
            .document('hamang')
            .collection('Bus')
            .document(carNum.toString() + '호차')
            .updateData({
          'teacher': teacherName,
        });
        Navigator.of(context).pop();
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TeacherBusScreen(
                    carNum: carNum,
                  )),
        );
      },
    );
  }
}

enum FormType { generic, iBeacon }

class _FormGeneric extends StatelessWidget {
  const _FormGeneric({
    Key key,
    this.running,
  }) : super(key: key);

  final bool running;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _FormIBeacon extends StatelessWidget {
  const _FormIBeacon({
    Key key,
    this.running,
  }) : super(key: key);

  final bool running;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
