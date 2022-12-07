import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';

class CardBlurtAllWidget extends StatefulWidget {
  const CardBlurtAllWidget({Key? key}) : super(key: key);

  @override
  State<CardBlurtAllWidget> createState() => _CardBlurtAllWidgetState();
}

class _CardBlurtAllWidgetState extends State<CardBlurtAllWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => context.read<ListBlurtAllBloc>().getBlurtsAll());
  }

  @override
  Widget build(BuildContext context) {
    final listBlurtAllProvider = context.watch<ListBlurtAllBloc>();

    return listBlurtAllProvider.isLoading
        ? ActivityIndicator(marginTop: 50.h)
        : listBlurtAllProvider.blurtListAll!.blurts.length > 0
        ? SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) => SizedBox(height: 5.h),
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(0.0),
            scrollDirection: Axis.vertical,
            itemCount: listBlurtAllProvider.blurtListAll!.blurts.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemBlurtAll(
                index: index,
                blurt: listBlurtAllProvider.blurtListAll!.blurts[index]
              );
            },
          )
        ) : EmptyDataView(message: 'blurt_message_empty_data'.tr());
  }
}

class ItemBlurtAll extends StatefulWidget {
  final int index;
  final Blurt blurt ;

  const ItemBlurtAll({Key? key ,
    required this.index,
    required this.blurt,
    }) : super(key: key);

  @override
  State<ItemBlurtAll> createState() => _ItemBlurtAllState();
}

class _ItemBlurtAllState extends State<ItemBlurtAll> {
  bool status = false;
  bool statusView = false;
  final prefs = new Preferences();
  BlurtUpdateBloc _blurtUpdateBloc = new BlurtUpdateBloc();

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countDown
  );

  startTime(){
    _stopWatchTimer.setPresetSecondTime(60);
    _stopWatchTimer.fetchEnded.listen((value) {
      if(value){
        status = false;
        setState(() {});
      }
    });
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
  }

  @override
  Widget build(BuildContext context) {
    statusView = widget.blurt.statusBlurt == 1 ? true :false;

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
        padding: EdgeInsets.fromLTRB(15.w, 15.h, 5.w, 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

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
                        title: 'tab_blurt_dialog_confirmation_text'.tr(),
                        message: 'tab_blurt_before_activated_text'.tr(),
                        onPositivePressed: () {
                          _blurtUpdate(widget.blurt.id);
                        },
                        positiveBtnText: 'tab_blurt_dialog_confirmation_positive_button'.tr(),
                        negativeBtnText: 'tab_blurt_dialog_confirmation_negative_button'.tr()
                    );
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => dialog);
                  }
                )
              ]
            ),

            SizedBox(height: 15.h),

            Text(
                widget.blurt.message,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 2,
                style: StyleGeneral.styleTextTextCardPaymentTitle
            ),

            SizedBox(height: 15.h),

            if(status)
              Row(
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 2,
                        child: Text(
                            'tab_blurt_time_down_text'.tr(),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 3,
                            style: StyleGeneral.styleTextTextCardPaymentDescription
                        )
                    ),


                    Flexible(
                        fit: FlexFit.tight,
                        flex: 2,
                        child: StreamBuilder<int>(
                            stream: _stopWatchTimer.rawTime,
                            initialData: _stopWatchTimer.rawTime.value,
                            builder: (context, snap) {
                              final value = snap.data;
                              final displayTime = StopWatchTimer.getDisplayTime(value!, hours: false , milliSecond: false);
                              return Text(
                                  displayTime,
                                  textAlign: TextAlign.end,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: TextStyle(fontSize: ScreenUtil().setSp(24) , color: StyleGeneral.BLACK ,fontFamily: 'Poppins-Semi')
                              );
                            }
                        )
                    )
                  ]
              )
          ]
        )
      )
    );
  }

  _blurtUpdate(blurt_id) async {

      _blurtUpdateBloc.driver_id = Preferences.getDriverId;
      _blurtUpdateBloc.blurt_id = blurt_id;

      _blurtUpdateBloc.BlurtUpdate();

      _blurtUpdateBloc.data.listen((data) {

        if(data.error == 1){
          setState(() {
            status = true;
            startTime();
          });
        }
        String icon = data.error == 1 ? 'success' : 'error';

        var dialog = AlertMessageError(icon: icon, message: 'tab_blurt_activated_text'.tr());

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
