import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CastLoading extends StatefulWidget {
  const CastLoading({ Key? key }) : super(key: key);

  @override
  State<CastLoading> createState() => _CastLoadingState();
}

class _CastLoadingState extends State<CastLoading> {
  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: ((overscroll) {
        overscroll.disallowGlow();
        return true;
      }), child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            SizedBox(height: 20,),
            SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[500]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              height: 180,
                              width: 120,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[500]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              height: 180,
                              width: 120,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[500]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              height: 180,
                              width: 120,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  
          ],
        ),
      )
      );
  }
}