import 'package:amwal/core/utils/appcolors.dart';
import 'package:amwal/generated/l10n.dart';
import 'package:amwal/model/customer.dart';
import 'package:amwal/screens/customers/presentation/acount_statment.dart';
import 'package:amwal/widgets/font/black16text.dart';
import 'package:amwal/widgets/font/blue16text.dart';
import 'package:amwal/widgets/font/blue18text.dart';
import 'package:amwal/widgets/font/orange16text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard({
    super.key,
    required this.customer,
  });

  final Customer customer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColor.whiteColor,
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.1),
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              Blue18text(text: "${customer.name}-"),
              Blue18text(text: customer.code),
            ],
          ),
          Orange18text(
              text:
                  "${S.of(context).currentBalance}: ${customer.currentBalance}"),
          Black16text(
              text:
                  "${S.of(context).salesDebtLimit}: ${customer.salesDebtLimit}"),
          Black16text(text: "${S.of(context).address}: ${customer.address}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AcountStatment(
                        customer: customer,
                      ),
                    ),
                  );
                },
                child: Blue16text(text: "${S.of(context).showdetails}>"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
