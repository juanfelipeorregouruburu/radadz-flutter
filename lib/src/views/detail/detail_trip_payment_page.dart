import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';

class DetailTripPaymentPage extends StatefulWidget {
  final int trip_payment_id;
  const DetailTripPaymentPage({Key key , @required this.trip_payment_id}) : super(key: key);

  @override
  State<DetailTripPaymentPage> createState() => _DetailTripPaymentPageState();
}

class _DetailTripPaymentPageState extends State<DetailTripPaymentPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() =>context.read<ListTripPaymentDriverBloc>().getListTripPaymentHistoryDriver(trip_payment_id: widget.trip_payment_id.toString()));
  }

  @override
  Widget build(BuildContext context) {

    return Hero(
        tag: widget.trip_payment_id,
        child: SafeArea(
          child: Scaffold(
           backgroundColor: Colors.white,
           extendBodyBehindAppBar: true,
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                automaticallyImplyLeading: false,
                title: BackButtonCustom(icon: "assets/icono_flecha_atras.png")
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardTripPaymentWidget()
                  ]
                )
              )
            )
          )
        )
    );
  }
}
