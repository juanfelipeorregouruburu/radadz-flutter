import 'package:flutter/material.dart';
import 'package:radadz_app/src/models/payment_model.dart';
import 'package:radadz_app/src/utils/export.dart';
import 'package:radadz_app/src/views/payment/widgets/payment_card_widget.dart';

class PaymentPage extends StatelessWidget with NavigationStates{
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repository = Repository();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.h),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace : ToolbarTitleCustom(title: 'payment_title'.tr())
        )
      ),
      body: FutureBuilder<PaymentModel>(
        future: repository.getPaymentListRepository(Preferences.getDriverId),
        builder: (context, snapshot){

          if(snapshot.hasData){
            return snapshot.data!.data.isNotEmpty ? SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) => SizedBox(height: 5.h),
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(0.0),
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return PaymentCardWidget(datum: snapshot.data!.data[index]);
                }
              )
            ) : EmptyDataView(message: 'blurt_message_empty_data'.tr());
          }

          return ActivityIndicator(marginTop: 50.h);
        }
      )
    );
  }
}
