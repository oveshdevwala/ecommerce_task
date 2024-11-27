// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_task/core/theme/colors_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageTile extends StatelessWidget {
  const ImageTile({
    super.key,
    required this.url,
  });
  final String url;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12).r,
            color: AppColors.grey100),
        child: Center(
            child: SizedBox(
          width: 0.7.sw,
          height: 230,
          child: CachedNetworkImage(
            imageUrl: url,
            fit: BoxFit.scaleDown,
          ),
        )),
      ),
    );
  }
}
