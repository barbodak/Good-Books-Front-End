import 'dart:async';
import 'dart:io';
import 'package:the_fidibo_project/user.dart';

import 'package:flutter/material.dart';

class MyNetwork {
  static Future<String> sendRequest(String request) async {
    String res = "";
    request += '\u0000';
    var socket = await Socket.connect("10.0.2.2", 8000);
    socket.write(request);
    socket.flush();
    var subscription = socket.listen((response) {
      res += String.fromCharCodes(response);
    });
    await subscription.asFuture<void>();
    return res;
  }
}
