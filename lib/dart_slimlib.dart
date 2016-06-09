@JS()
library dart_slimlib;

import 'dart:js';
import 'dart:convert';
import 'package:js/js.dart';
export 'package:js/js.dart' show allowInterop;

@JS('SlimView.Config')
class Config {

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

  external JsObject get extra;

  external set extra(JsObject extraParams);
}

@JS('SlimView.Channel')
class Channel {
  external factory Channel(Config config);

  external Config get config;

  external JsObject get window;

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

Map unboxMessage(JsObject obj) => JSON.decode(_encode(obj));

box(Map<String, String> map) => new JsObject.jsify(map);