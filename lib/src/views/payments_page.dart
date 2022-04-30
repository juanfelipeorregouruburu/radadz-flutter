import 'package:flutter/material.dart';
import 'package:radadz_app/src/slider/navigation.dart';
import 'package:radadz_app/src/utils/export.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PaymentsPage extends StatefulWidget with NavigationStates{
  const PaymentsPage({Key key}) : super(key: key);

  @override
  _PaymentsPageState createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {

  final prefs = new Preferences();
  bool _isCalendar = false;
  bool _isDataPayment = false;
  bool _buttonSearch = true;
  bool _buttonFilter = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String _selectedStartDate = '';
  String _selectedEndDate = '';
  String _range = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
        // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';

        _selectedStartDate = DateFormat('yyyy-MM-dd').format(args.value.startDate);
        _selectedEndDate = DateFormat('yyyy-MM-dd').format(args.value.endDate);

        _buttonFilter = true;

      }
    });

  }


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.h),
          child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              flexibleSpace : ToolbarTitleCustom(title: 'payment_title'.tr())
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    children: [
                      _buttonSearch ? CustomButton(
                        text: 'payment_buton_search_title'.tr(),
                        fullscreen: true,
                        onTap: (){
                            setState(() {
                              _isCalendar = true;
                              _buttonSearch = false;
                              _isDataPayment = false;
                            });
                        },
                      ) : Container(),

                      _buttonFilter ? CustomButton(
                        text: 'payment_buton_search_filter'.tr(),
                        fullscreen: true,
                        onTap: (){
                          setState(() {
                            _isCalendar = false;
                            _buttonSearch = false;
                            _filterData();
                          });
                        },
                      ): Container(),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          _range,
                          style: TextStyle(
                              color: StyleGeneral.BLACK,
                              letterSpacing: .5,
                              fontSize: ScreenUtil().setSp(12),
                              fontFamily: 'Poppins-Semi'),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      _isCalendar ?  SfDateRangePicker(
                        onSelectionChanged: _onSelectionChanged,
                        selectionMode: DateRangePickerSelectionMode.range,
                        initialSelectedRange: PickerDateRange(
                            DateTime.now().subtract(const Duration(days: 4)),
                            DateTime.now().add(const Duration(days: 3))),
                      ) : Container(),
                    ],
                  ),
                ),

                _isDataPayment ? CardPaymentReceivedWidget() :Container()
              ],
            ),
          ),
        ),
      ),
    );
  }

  _filterData() {
    Future.microtask(() =>context.read<ListPaymentReceivedDriverBloc>().getPaymentReceivedDriver(driver_id: prefs.getDriverId, start_time: _selectedStartDate, end_date:_selectedEndDate));

    _isDataPayment = true;
    _buttonSearch = true;
    _buttonFilter = false;
  }
}
