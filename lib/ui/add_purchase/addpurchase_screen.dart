import '../../base/assets_provider.dart';
import 'addpurchase_cubit.dart';
import '../main/main_cubit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import '../../base/base_state.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class AddPurchaseScreen extends StatefulWidget {
  static String TAG = '/AddPurchaseScreen';

  @override
  _AddPurchaseState createState() => _AddPurchaseState();
}

class _AddPurchaseState
    extends BaseState<AddPurchaseScreen, AddPurchaseCubit, AddpurchaseState> {
  late MainCubit _mainCubit;

  @override
  void initState() {
    cubit = AddPurchaseCubit();
    _mainCubit = context.read<MainCubit>();
    super.initState();
  }

  Widget _todayAndSum() => Padding(
        padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('12 July 2021',
                style: GoogleFonts.roboto(
                    fontSize: 24, fontWeight: FontWeight.w400)),
            Text('200 Р',
                style: GoogleFonts.roboto(
                    fontSize: 24, fontWeight: FontWeight.w200))
          ],
        ),
      );

  FloatingActionButton _floatingActionButton() =>
      FloatingActionButton(child: Icon(Icons.add), onPressed: () {});

  Widget _purchaseName() => Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 16),
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 250, maxWidth: 340),
                child: IntrinsicWidth(
                  stepWidth: 100,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: cubit.purchaseNameController,
                    style: GoogleFonts.roboto(
                        fontSize: 32, fontWeight: FontWeight.bold),
                    decoration: new InputDecoration(
                        hintStyle: GoogleFonts.roboto(
                            fontSize: 32, fontWeight: FontWeight.bold),
                        hintText: "Enter name..."),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, right: 8),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: SvgPicture.asset(
                    IC_GO_BACK,
                    color: _mainCubit.themeIcColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _content() => Scaffold(
        floatingActionButton: _floatingActionButton(),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [_purchaseName(), _todayAndSum()],
          ),
        ),
      );

  @override
  Widget builder(BuildContext context, AddpurchaseState state) => _content();

  @override
  void listener(BuildContext context, AddpurchaseState state) {}
}
