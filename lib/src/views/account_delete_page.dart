import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';

class AccountDeletePage extends StatefulWidget {
  const AccountDeletePage({Key? key}) : super(key: key);

  @override
  State<AccountDeletePage> createState() => _AccountDeletePageState();
}

class _AccountDeletePageState extends State<AccountDeletePage> {

  DeleteAccountBloc _deleteAccountBloc = new DeleteAccountBloc();
  bool _isLoading = false;

  final prefs = new Preferences();

  deleteAccount(){
    setState(() {
      _isLoading = true;
    });


    _deleteAccountBloc.userId = Preferences.getDriverId;

    _deleteAccountBloc.SetDeleteAccount();

    _deleteAccountBloc.data.listen((data) {

      setState(() {
        _isLoading = false;
      });


      if(data.error == 1){
        var dialog = CustomDialogDeleteAccount(
          message: 'account_delete_text_success'.tr()
        );

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => dialog
        );

        Future.delayed(const Duration(seconds: 10), () {
          Navigator.of(context).pop();
          Navigator.pushNamed(context, "login");
          prefs.clearPreferences();
        });
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: StyleGeneral.WHITE,
        appBar: AppBar(
          backgroundColor: StyleGeneral.BLACK_DARK,
          leading: BackButton(color: Colors.white),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 20.h),
                  child: Text(
                    'account_delete_title'.tr(),
                    maxLines: 2,
                    style: TextStyle(color: StyleGeneral.BLACK, fontSize: ScreenUtil().setSp(15), fontFamily: 'Poppins-Semi'),
                    textAlign: TextAlign.center,
                  )
                ),

                SizedBox(height: 20.h),
                Text(
                  'account_delete_paragraphs_1'.tr(),
                  style: StyleGeneral.styleTextParagraphs,
                  textAlign: TextAlign.justify,
                ),

                SizedBox(height: 20.h),
                Text(
                  'account_delete_paragraphs_2'.tr(),
                  style: StyleGeneral.styleTextParagraphsWeight,
                  textAlign: TextAlign.justify,
                ),

                SizedBox(height: 20.h),
                Text(
                  'account_delete_paragraphs_3'.tr(),
                  style: StyleGeneral.styleTextParagraphs,
                  textAlign: TextAlign.justify,
                ),

                SizedBox(height: 20.h),
                Text(
                  'account_delete_paragraphs_4'.tr(),
                  style: StyleGeneral.styleTextParagraphs,
                  textAlign: TextAlign.justify,
                ),

                SizedBox(height: 20.h),
                Text(
                  'account_delete_paragraphs_5'.tr(),
                  style: StyleGeneral.styleTextParagraphsWeight,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20.h),

                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        height: 35.h,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(10.r)),
                        child: Text('account_delete_paragraphs_button_negative'.tr(), style: TextStyle(color: Colors.white, fontSize: 12.sp))
                      ),
                      onTap: () {

                      }
                    ) ,
                    SizedBox(height: 10.h),
                    _isLoading ? ActivityIndicator(color: Colors.black, size: 50.w) : InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        height: 35.h,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10.r)),
                        child: Text('account_delete_paragraphs_button_positive'.tr(), style: TextStyle(color: Colors.white, fontSize: 12.sp))
                      ),
                      onTap: () {
                       deleteAccount();
                      }
                    )
                  ]
                )
              ]
            )
          )
        )
      )
    );
  }
}
