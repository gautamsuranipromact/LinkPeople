import 'package:mime/mime.dart';

const MediaTypeImage = "IMAGE";
const MediaTypeVIDEO = "VIDEO";

bool? isImage(String path) {
  final mimeType = lookupMimeType(path);

  return mimeType?.startsWith('image/');
}