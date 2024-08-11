import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkView extends StatelessWidget {
  const WorkView({required this.observable, required this.itemBuilder, super.key});

  final Iterable observable;
  final Widget Function(dynamic) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: observable.length,
        separatorBuilder: (context, index) => SizedBox(height: 8.h),
        itemBuilder: (context, index) {
          return itemBuilder(observable.elementAt(index));
        },
      ),
    );
  }
}
