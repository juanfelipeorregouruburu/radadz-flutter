import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';

class CreateBlurtDriverPage extends StatefulWidget {
  const CreateBlurtDriverPage({Key? key}) : super(key: key);

  @override
  State<CreateBlurtDriverPage> createState() => _CreateBlurtDriverPageState();
}

class _CreateBlurtDriverPageState extends State<CreateBlurtDriverPage> {

  final prefs = new Preferences();
  final GlobalKey<FormState> formState = new GlobalKey<FormState>();

  BlurtCreateBloc _blurtCreateBloc = new BlurtCreateBloc();
  bool _isLoading = false;

  static OutlineInputBorder borderinput = OutlineInputBorder(
    borderRadius: BorderRadius.circular(25.0),
    borderSide: BorderSide(color: Colors.white),
  );


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    statusBarDark();
  }

  TextEditingController _inputTextBlurt = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final listBlurtProvider = context.watch<ListBlurtDriverBloc>();

    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      listBlurtProvider.setStateButton(false);
                    },
                    child: Container(
                      width: 95.h,
                      height: 30.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.w),
                        color: StyleGeneral.BLACK ,
                      ),
                      child: Text(
                        'register_blurt_back'.tr(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(12),
                          fontFamily: 'Poppins-Semi',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Center(
                    child: Text(
                      'register_blurt'.tr(),
                      style: StyleGeneral.styleTextTitle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Form(
                    key: formState,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          TextFormField(
                            controller: _inputTextBlurt,
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.done,
                            maxLines: 3,
                            maxLength: 50,
                            decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.all(20.r),
                              filled: true,
                              fillColor: StyleGeneral.GREY,
                              hintText: 'register_message_textarea'.tr(),
                              enabledBorder: borderinput,
                              border: borderinput,
                              focusedBorder: borderinput,
                            ),
                            style: new TextStyle(
                              color: StyleGeneral.BLACK,
                              fontSize: ScreenUtil().setSp(15),
                              fontFamily: "Poppins-Regular",
                            ),
                            validator: (String? value) {
                              if (value!.isEmpty) return 'required_field'.tr();
                              return null;
                            },
                          ),

                          SizedBox(
                            height: 25.h,
                          ),

                          _isLoading ? ActivityIndicator() :CustomButton(
                            text: 'tab_blurt_driver_button'.tr(),
                            fullscreen: true,
                            onTap: () {
                              _blurtCreate();
                              listBlurtProvider.setStateButton(false);
                            },
                          )
                        ]
                      )
                    )
                  )
                ]
              )
            )
          )
        )
    );

  }



  _blurtCreate() async {

    if (formState.currentState!.validate()) {

      setState(() {
        _isLoading = true;
      });

      _blurtCreateBloc.driver_id = Preferences.getDriverId;
      _blurtCreateBloc.message = _inputTextBlurt.text.trim();


      _blurtCreateBloc.BlurtCreate();

      _blurtCreateBloc.data.listen((data) {

        setState(() {
          _isLoading = false;
        });

        String icon = data.error == 1 ? 'success' : 'error';
        if(data.error == 1){
          Future.microtask(() => context.read<ListBlurtDriverBloc>().getBlurtsDriver(driver_id: Preferences.getDriverId));
        }

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
}
