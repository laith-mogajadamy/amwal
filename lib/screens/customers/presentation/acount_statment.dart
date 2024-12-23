import 'package:amwal/core/utils/appcolors.dart';
import 'package:amwal/generated/l10n.dart';
import 'package:amwal/model/currency.dart';
import 'package:amwal/model/customer.dart';
import 'package:amwal/screens/customers/controller/customers_bloc.dart';
import 'package:amwal/welcome/controller/enter_bloc.dart';
import 'package:amwal/widgets/font/black16text.dart';
import 'package:amwal/widgets/font/blue16text.dart';
import 'package:amwal/widgets/font/blue18text.dart';
import 'package:amwal/widgets/font/orange16text.dart';
import 'package:amwal/widgets/font/white18text.dart';
import 'package:amwal/widgets/from_to_date_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AcountStatment extends StatefulWidget {
  const AcountStatment({
    super.key,
    required this.customer,
  });
  final Customer customer;

  @override
  State<AcountStatment> createState() => _AcountStatmentState();
}

class _AcountStatmentState extends State<AcountStatment> {
  List<bool> isSelected = [true, false];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    List<Currency> currencys = context.read<EnterBloc>().state.currencys;
    Currency currencyname = currencys
        .firstWhere((name) => name.guid == widget.customer.dealingCurrencyGuid);
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Orange18text(
              text: "${widget.customer.name} (${currencyname.code})",
            ),
            SizedBox(
              height: 20.h,
              width: size.width,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(4, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: ToggleButtons(
                  isSelected: isSelected,
                  constraints: BoxConstraints(
                    minWidth: size.width / 2.3,
                  ),
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < isSelected.length; i++) {
                        isSelected[i] =
                            i == index; // Toggle only the clicked button
                      }
                    });
                  },
                  borderWidth: 0,
                  selectedColor: AppColor.applightgray.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20.r),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Blue18text(text: S.of(context).acountstatment),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Blue18text(text: S.of(context).agentcard),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            BlocBuilder<CustomersBloc, CustomersState>(
              builder: (context, state) {
                return Row(
                  children: [
                    SizedBox(
                      width: size.width / 2.8,
                      child: RadioListTile<String>(
                        title: Black16text(text: S.of(context).total),
                        value: 'option1',
                        groupValue: state.totalfiter,
                        onChanged: (String? value) {
                          selectedValue = value;
                          context.read<CustomersBloc>().add(
                              ChangeTotalFilter(totalfilter: selectedValue));
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width / 2.2,
                      child: RadioListTile<String>(
                        title: Black16text(text: S.of(context).detailed),
                        value: 'option2',
                        groupValue: state.totalfiter,
                        onChanged: (String? value) {
                          selectedValue = value;
                          context.read<CustomersBloc>().add(
                              ChangeTotalFilter(totalfilter: selectedValue));
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            const FromToDatePick(),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // context.read<EnterBloc>().add(LoginSubmitted());
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(size.width / 1.2, size.height / 18),
                  backgroundColor: AppColor.appblueGray,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    White18text(text: S.of(context).show),
                    SizedBox(
                      width: 10.w,
                    ),
                    Icon(
                      Icons.search,
                      color: AppColor.whiteColor,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Background color
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(4, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Blue16text(text: " ${S.of(context).openningbalance} :"),
                    Black16text(text: widget.customer.currentBalance),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
