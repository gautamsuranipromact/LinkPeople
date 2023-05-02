import 'package:event_bus_plus/event_bus_plus.dart';

class PostAppEvent extends AppEvent {
  PostAppEvent(this.isPosted, {String? id});

  final bool isPosted;

  @override
  List<Object?> get props => [isPosted];
}
