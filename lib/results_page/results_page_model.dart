import '/flutter_flow/flutter_flow_util.dart';
import 'results_page_widget.dart' show ResultsPageWidget;
import 'package:flutter/material.dart';

class ResultsPageModel extends FlutterFlowModel<ResultsPageWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future kk(BuildContext context) async {}
}
