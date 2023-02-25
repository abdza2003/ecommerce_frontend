import 'package:advanceproje/core/constant/mediaquery_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

GetnetworkImage({required imageUri, imageSize = null}) {
  return Builder(builder: (context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: CachedNetworkImage(
        errorWidget: (context, url, error) {
          return Center(
            child: Text('not found'),
          );
        },
        // fit: BoxFit.scaleDown,
        imageUrl: '$imageUri',
        fadeInDuration: Duration(seconds: 2),
        placeholderFadeInDuration: Duration(seconds: 1),
        fadeOutDuration: Duration(seconds: 2),
        imageBuilder: (context, imageProvider) => ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
            fit: BoxFit.cover,
            image: imageProvider,
            width: imageSize ?? 200,
            height: imageSize ?? null,
          ),
        ),
        progressIndicatorBuilder: (context, url, downloadProgress) => Container(
          alignment: Alignment.center,
          width: imageSize ?? MediQueryManager(context).width / 2.5,
          height: imageSize ?? MediQueryManager(context).height / 4.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Shimmer(
            duration: Duration(seconds: 3), //Default value
            interval:
                Duration(seconds: 3), //Default value: Duration(seconds: 0)
            color: Colors.white, //Default value
            colorOpacity: 0, //Default value
            enabled: true, //Default value
            direction: ShimmerDirection.fromLTRB(), //Default Value
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 157, 156, 158),
              ),
            ),
          ),
        ),
      ),
    );
  });
}
