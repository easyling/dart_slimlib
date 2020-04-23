@JS()
library dart_slimlib;

import 'dart:convert';
import 'dart:html';

import 'package:js/js.dart';
import 'package:js/js_util.dart' as jsUtil;

export 'package:js/js.dart' show allowInterop;

@JS('SlimView.Config')
abstract class Config {
  external factory Config();

  external String get endpoint;

  external set endpoint(String endpoint);

  external String get token;

  external set token(String token);

  external String get previewPage;

  external set previewPage(String previewPage);

  external String get targetLanguage;

  external set targetLanguage(String targetLangauge);

  external String get projectCode;

  external set projectCode(String projectCode);

  external Object get extra;

  /// [extraParams] must be boxed with [box]
  external set extra(Object extraParams);
}

@JS('SlimView.Channel')
class Channel {
  external factory Channel(Config config);

  external Config get config;

  external WindowBase get window;

  external void openInNewWindow();

  external void highlight(String id);

  external void find(String fragment);

  external void translate(String id, String translation, bool save);

  external void navigate(String page);

  external void enableHighlighting();

  external void disableHighlighting();

  external void onError(callback(message));

  external void onMessage(callback(message));
}

@JS('JSON.stringify')
external String _encode(obj);

typedef ErrorCallback(message);

Map<String, dynamic> unboxMessage(obj) => json.decode(_encode(obj));

box(Map<String, String> map) => jsUtil.jsify(map);
