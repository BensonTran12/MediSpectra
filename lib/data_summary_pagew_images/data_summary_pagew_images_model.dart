import '/flutter_flow/flutter_flow_util.dart';
import 'data_summary_pagew_images_widget.dart'
    show DataSummaryPagewImagesWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DataSummaryPagewImagesModel
    extends FlutterFlowModel<DataSummaryPagewImagesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
