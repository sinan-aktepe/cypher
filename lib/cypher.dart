import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class Cypher {
  static const MethodChannel _channel = const MethodChannel('cypher');

  static Future<String> create(
      {@required int length,
      bool useDigits,
      bool useLowerCase,
      bool useUpperCase,
      bool usePunctuation}) async {
    /**
     *  The length can not be null
     */
    if (length == null) {
      length = 8;
    }

    /**
     *  The password has digits as default
     */
    bool digits = true;
    if (useDigits == false) {
      digits = false;
    }

    /**
     *  The password has lower case characters as default
     */
    bool lowers = true;
    if (useLowerCase == false) {
      lowers = false;
    }

    /**
     *  The password has upper case characters as default
     */
    bool uppers = true;
    if (useUpperCase == false) {
      uppers = false;
    }

    /**
     *  The password does not have punctuations as default
     */
    bool punctuations = false;
    if (usePunctuation == true) {
      punctuations = true;
    }

    /**
     *  Maps the values to use them in plugin
     */
    final Map<String, dynamic> arguments = <String, dynamic>{
      'length': length,
      'digits': digits,
      'lowers': lowers,
      'uppers': uppers,
      'punctuations': punctuations
    };

    /**
     *  Sends values to the plugin and get a password as result
     */
    final String password =
        await _channel.invokeMethod('getPassword', arguments);
    return password;
  }
}
