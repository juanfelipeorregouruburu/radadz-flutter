import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';


class CardBlurtDriverWidget extends StatefulWidget {
  const CardBlurtDriverWidget({Key? key}) : super(key: key);

  @override
  State<CardBlurtDriverWidget> createState() => _CardBlurtDriverWidgetState();
}

class _CardBlurtDriverWidgetState extends State<CardBlurtDriverWidget> {
  final prefs = new Preferences();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => context.read<ListBlurtDriverBloc>().getBlurtsDriver(driver_id: Preferences.getDriverId));
  }

  @override
  Widget build(BuildContext context) {
    final listBlurtDriverProvider = context.watch<ListBlurtDriverBloc>();

    return listBlurtDriverProvider.isLoading
        ? ActivityIndicator(marginTop: 50.h)
        : listBlurtDriverProvider.blurtListAll!.blurts.length > 0
        ? ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) => SizedBox(height: 5.h),
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(0.0),
          scrollDirection: Axis.vertical,
          itemCount: listBlurtDriverProvider.blurtListAll!.blurts.length ,
          itemBuilder: (BuildContext context, int index) {
            return ItemBlurtDriver(
                index: index,
                blurt: listBlurtDriverProvider.blurtListAll!.blurts[index]
            );
          },

        ) : EmptyDataView(message: 'blurt_message_empty_data'.tr());

  }
}

class ItemBlurtDriver extends StatefulWidget {
  final int index;
  final Blurt blurt ;

  const ItemBlurtDriver({Key? key ,
    required this.index,
    required this.blurt,
  }) : super(key: key);

  @override
  State<ItemBlurtDriver> createState() => _ItemBlurtDriverState();
}

class _ItemBlurtDriverState extends State<ItemBlurtDriver> {
  bool status = false;
  bool statusView = false;
  final prefs = new Preferences();
  BlurtUpdateBloc _blurtUpdateBloc = BlurtUpdateBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    statusView = widget.blurt.statusBlurt.id == 1 ? true :false;

    return Card(
        elevation: 4,
        color: statusView ? StyleGeneral.GREY : StyleGeneral.BLACK_LIGTH_25,
        shadowColor: StyleGeneral.BLACK,
        margin: EdgeInsets.all(10.r),
        shape:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color:statusView ? StyleGeneral.GREY : StyleGeneral.BLACK_LIGTH_25)
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              statusView ?
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlutterSwitch(
                    activeText: 'tab_blurt_switch_active'.tr(),
                    inactiveText: 'tab_blurt_switch_inactive'.tr(),
                    activeTextColor: StyleGeneral.WHITE,
                    inactiveTextColor: StyleGeneral.WHITE,
                    activeToggleColor: StyleGeneral.WHITE,
                    inactiveToggleColor: StyleGeneral.WHITE,
                    activeColor: StyleGeneral.GREEN,
                    inactiveColor: StyleGeneral.BLACK,
                    value: status,
                    valueFontSize: 15.h,
                    width: 125.w,
                    borderRadius: 30.r,
                    showOnOff: true,
                    onToggle: (val) {
                      var dialog = CustomAlertDialog(
                          title: 'tab_blurt_dialog_confirmation_title'.tr(),
                          message: 'tab_blurt_dialog_confirmation_text'.tr(),
                          onPositivePressed: () {
                            _blurtUpdate(widget.blurt.id);
                          },
                          positiveBtnText: 'tab_blurt_dialog_confirmation_possitive_button'.tr(),
                          negativeBtnText: 'tab_blurt_dialog_confirmation_negative_button'.tr());
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) => dialog);
                    },
                  ),
                ],
              ) : Container(),

              SizedBox(height: 15.h),

              Text(
                  widget.blurt.message,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 3,
                  style: StyleGeneral.styleTextTextCardPaymentTitle
              )

            ],
          ),
        )
    );
  }

  _blurtUpdate(blurt_id) async {

    _blurtUpdateBloc.driver_id = Preferences.getDriverId;
    _blurtUpdateBloc.blurt_id = blurt_id;

    _blurtUpdateBloc.BlurtUpdate();

    _blurtUpdateBloc.data.listen((data) {
      String icon = data.error == 1 ? 'success' : 'error';

      var dialog = AlertMessageError(icon: icon, message: data.response);

      showDialog(
          context: context,
          builder: (BuildContext context) {
            Future.delayed(Duration(seconds: 3), () {
              Navigator.of(context).pop(true);
            });
            return dialog;
          });
    });
  }
}
