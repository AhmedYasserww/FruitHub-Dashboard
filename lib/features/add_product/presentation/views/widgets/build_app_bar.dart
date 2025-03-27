import 'package:ecommerce_app_dashboard/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
AppBar buildAppBar( String title) {
  return AppBar(
    title: Text(title,style: AppTextStyles.bold19,),
    centerTitle: true,

  );
}