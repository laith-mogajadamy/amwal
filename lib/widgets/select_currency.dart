import 'package:amwal/core/utils/appcolors.dart';
import 'package:amwal/generated/l10n.dart';
import 'package:amwal/model/currency.dart';
import 'package:amwal/welcome/controller/enter_bloc.dart';
import 'package:amwal/widgets/font/black16text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectCurrency extends StatelessWidget {
  const SelectCurrency({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        List<DropdownMenuItem<Currency>> currencyslist = [];
        for (var i = 0; i < state.currencys.length; i++) {
          currencyslist.add(
            DropdownMenuItem(
              value: state.currencys[i],
              child: Black16text(text: state.currencys[i].code),
            ),
          );
        }
        print(currencyslist.length);
        return Container(
          height: size.height / 22,
          width: size.width / 3.5,
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: AppColor.black.withOpacity(0.2),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            child: DropdownButton<Currency>(
              underline: const SizedBox.shrink(),
              icon: const Icon(Icons.keyboard_arrow_down),
              alignment: AlignmentDirectional.topCenter,
              iconSize: 30.r,
              isExpanded: true,
              dropdownColor: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(20.r),
              hint: Black16text(text: S.of(context).currency),
              items: currencyslist,
              value: (state.selectedcurrency ==
                      const Currency(guid: '', code: '', iddefault: ''))
                  ? null
                  //state.currencys[0]
                  : state.selectedcurrency,
              onChanged: (value) {
                context.read<EnterBloc>().add(
                      CurrencyChanged(
                        currency: value,
                      ),
                    );
              },
            ),
          ),
        );
      },
    );
  }
}
