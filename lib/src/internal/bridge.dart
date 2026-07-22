part of "../../flutter_document_reader_api.dart";

const _methodChannelID = 'flutter_document_reader_api/method';
const MethodChannel _bridge = const MethodChannel(_methodChannelID);

String _eventPrefix = 'flutter_document_reader_api/event/';
List<String> _eventChannels = [];

void _eventChannel(String id, listen(msg)) {
  if (_eventChannels.contains(id)) return;
  _eventChannels.add(id);
  EventChannel(_eventPrefix + id).receiveBroadcastStream().listen(listen);
}
