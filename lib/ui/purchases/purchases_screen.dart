import 'package:e_shop_flutter/base/assets_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'purchases_cubit.dart';

class PurchasesPage extends StatefulWidget {
  PurchasesPage({Key? key}) : super(key: key);

  @override
  _PurchasesPageState createState() => _PurchasesPageState();
}

class _PurchasesPageState extends BaseState<PurchasesPage, PurchasesCubit> {
  @override
  void initState() {
    cubit = context.read<PurchasesCubit>();
    super.initState();
  }

  Widget _content() => Container(
        margin: EdgeInsets.only(top: 24, left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Purchases',
              style:
                  GoogleFonts.roboto(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => cubit.changeThemeMode(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  cubit.themeIc,
                  color: cubit.themeIcColor,
                  width: 32,
                  height: 32,
                ),
              ),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<PurchasesCubit, PurchasesState>(
          listener: (context, state) {},
          builder: (context, state) => _content()),
    );
  }
}
