import 'package:flutter/services.dart';

class AndroidChannel {
  static const EventChannel eventChannel = EventChannel('my_event_channel');

  static Stream<dynamic> startEventStream() {
    return eventChannel.receiveBroadcastStream();
  }
}
