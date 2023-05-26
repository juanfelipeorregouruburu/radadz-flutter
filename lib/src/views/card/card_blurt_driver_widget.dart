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

  String textStatus = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNameStatus();
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();  // Need to call dispose function.
  }

  getNameStatus(){
    switch(widget.blurt.statusBlurt){
      case 1:
        textStatus = 'tab_blurt_status_accepted'.tr();
        setState(() {});
        break;
      case 2:
        textStatus = 'tab_blurt_status_refused'.tr();
        setState(() {});
        break;

      case 3:
        textStatus = 'tab_blurt_status_pending_review'.tr();
        setState(() {});
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    statusView = widget.blurt.statusBlurt == 1 ? true : false;

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
                          title: 'tab_blurt_dialog_confirmation_text'.tr(),
                          message: 'tab_blurt_before_activated_text'.tr(),
                          onPositivePressed: () {
                            _blurtUpdate(widget.blurt.id);
                          },
                          positiveBtnText: 'tab_blurt_dialog_confirmation_positive_button'.tr(),
                          negativeBtnText: 'tab_blurt_dialog_confirmation_negative_button'.tr());
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) => dialog);
                    },
                  ),
                ],
              ) : Container(),

              SizedBox(height: 10.h) ,

              Text(
                widget.blurt.message,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 3,
                style: StyleGeneral.styleTextTextCardPaymentTitle
              ),

              SizedBox(height: 15.h),

              Text(
                textStatus,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 3,
                style: StyleGeneral.styleTextTextCardPaymentDescription
              ),
              SizedBox(height: 10.h),

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

    });
  }
}
