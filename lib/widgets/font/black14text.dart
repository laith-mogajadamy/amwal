import 'package:amwal/core/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Black14text extends StatelessWidget {
  final String text;
  const Black14text({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text,
      softWrap: true,
      overflow: TextOverflow.visible,
      style: GoogleFonts.cairo(
        fontSize: 14.sp,
        color: AppColor.apptitle,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
