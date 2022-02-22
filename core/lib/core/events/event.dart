import 'dart:async';

import 'package:core/core.dart';

class Event {
  Event({
    required this.name,
    this.args,
  });

  final String name;
  final dynamic args;
}

void dispatch(Event event) {
  eventBus.fire(event);
}

StreamSubscription listen(Function(Event) onEvent) {
  return eventBus.on<Event>().listen(onEvent);
}
