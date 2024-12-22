import 'package:amwal/core/utils/appcolors.dart';
import 'package:amwal/generated/l10n.dart';
import 'package:amwal/model/currency.dart';
import 'package:amwal/model/customer.dart';
import 'package:amwal/welcome/controller/enter_bloc.dart';
import 'package:amwal/widgets/orange16text.dart';
import 'package:amwal/widgets/white18text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AcountStatment extends StatelessWidget {
  const AcountStatment({
    super.key,
    required this.customer,
  });
  final Customer customer;

  @override
  Widget build(BuildContext context) {
    List<Currency> currencys = context.read<EnterBloc>().state.currencys;
    Currency currencyname = currencys
        .firstWhere((name) => name.guid == customer.dealingCurrencyGuid);
    List<bool> page = [false, false];
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.whiteColorBG,
      appBar: AppBar(
        backgroundColor: AppColor.appbuleBG,
        title: White18text(
          text: S.of(context).acountstatment,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.refresh,
              color: AppColor.whiteColor,
              size: 25,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          children: [
            Orange18text(
              text: "${customer.name} (${currencyname.code})",
            ),
            SizedBox(
              height: size.height / 5,
              width: size.width / 3,
              child: ToggleButtons(
                isSelected: page,
                onPressed: (index) {},
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Text('aaa'),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    child: Text('sssss'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
