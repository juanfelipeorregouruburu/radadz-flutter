import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';
import 'package:radadz_app/src/widgets/custom_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formState = new GlobalKey<FormState>();

  bool _isLoading = false;

  /* editext*/
  TextEditingController _inputNameFirstController = new TextEditingController();
  TextEditingController _inputNameSecondController = new TextEditingController();
  TextEditingController _inputLastNameFirstController = new TextEditingController();
  TextEditingController _inputLastNameSecondController = new TextEditingController();
  TextEditingController _inputDocumentoController = new TextEditingController();
  TextEditingController _inputEmailController = new TextEditingController();
  TextEditingController _inputPhoneController = new TextEditingController();
  TextEditingController _inputAddressController = new TextEditingController();
  TextEditingController _inputNummberLicenceController = new TextEditingController();
  TextEditingController _inputYearLicenceController = new TextEditingController();
  TextEditingController _inputDateController = new TextEditingController();
  TextEditingController _inputPasswordController = new TextEditingController();

  final FocusNode _nameFirstFocus = FocusNode();
  final FocusNode _nameSecondFocus = FocusNode();
  final FocusNode _lastNameFirstFocus = FocusNode();
  final FocusNode _lastNameSecondFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _documentoFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _addressFocus = FocusNode();
  final FocusNode _numberLicenceFocus = FocusNode();
  final FocusNode _yearLicenceFocus = FocusNode();
  final FocusNode _dateFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  final prefs = new Preferences();

  static OutlineInputBorder borderinput = OutlineInputBorder(
    borderRadius: BorderRadius.circular(25.0),
    borderSide: BorderSide(color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          GestureDetector(
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
                      SizedBox(
                        height: 30.h,
                      ),
                      Center(
                        child: Text(
                          'Registrar conductor',
                          style: StyleGeneral.styleTextTitle,
                          textAlign: TextAlign.left,
                        ),
                      ),

                      SizedBox(
                        height: 25.h,
                      ),

                      Form(
                        key: formState,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            // InputTextfield(
                            //   focusNode: _emailFocus,
                            //   controller: _inputEmailController,
                            //   keyboardType: TextInputType.emailAddress,
                            //   onFieldSubmitted: (term) {
                            //     _fieldFocusChange(context, _emailFocus, _phoneFocus);
                            //   },
                            //   hintText: 'Correo electronico',
                            //   validator: (value) {
                            //     if (value.isEmpty) return 'El correo es obligatorio';
                            //     return null;
                            //   },
                            // ) ,

                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                    flex: 2,
                                    child: InputCustom(
                                      focusNode: _nameFirstFocus,
                                      controller: _inputNameFirstController,
                                      onFieldSubmitted: (term) {
                                        _fieldFocusChange(context, _nameFirstFocus, _nameSecondFocus);
                                      },
                                      hintText: 'Primer nombre',
                                      validator: (value) {
                                        if (value.isEmpty) return 'El nombre es obligatorio';
                                        return null;
                                      },
                                    )
                                ),

                                SizedBox(
                                  width: 15.w,
                                ),

                                Flexible(
                                    flex: 2,
                                    child: InputCustom(
                                      focusNode: _nameSecondFocus,
                                      controller: _inputNameSecondController,
                                      onFieldSubmitted: (term) {
                                        _fieldFocusChange(context, _nameSecondFocus, _lastNameFirstFocus);
                                      },
                                      hintText: 'Segundo nombre',
                                      validator: (value) {
                                        if (value.isEmpty) return 'El nombre es obligatorio';
                                        return null;
                                      },
                                    )
                                ),

                              ],
                            ),

                            SizedBox(
                              height: 15.h,
                            ),

                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                    flex: 2,
                                    child: InputCustom(
                                      focusNode: _lastNameFirstFocus,
                                      controller: _inputLastNameFirstController,
                                      onFieldSubmitted: (term) {
                                        _fieldFocusChange(context, _lastNameFirstFocus, _lastNameSecondFocus);
                                      },
                                      hintText: 'Primer apellido',
                                      validator: (value) {
                                        if (value.isEmpty) return 'El apellido es obligatorio';
                                        return null;
                                      },
                                    )
                                ),

                                SizedBox(
                                  width: 15.w,
                                ),

                                Flexible(
                                    flex: 2,
                                    child: InputCustom(
                                      focusNode: _lastNameSecondFocus,
                                      controller: _inputLastNameSecondController,
                                      onFieldSubmitted: (term) {
                                        _fieldFocusChange(context, _lastNameSecondFocus, _emailFocus);
                                      },
                                      hintText: 'Segundo apellido',
                                      validator: (value) {
                                        if (value.isEmpty) return 'El apellido es obligatorio';
                                        return null;
                                      },
                                    )
                                ),

                              ],
                            ),

                            SizedBox(
                              height: 15.h,
                            ),

                            Flexible(
                                flex: 2,
                                child: InputCustom(
                                  focusNode: _documentoFocus,
                                  controller: _inputDocumentoController,
                                  keyboardType: TextInputType.number,
                                  onFieldSubmitted: (term) {
                                    _fieldFocusChange(context, _documentoFocus, _emailFocus);
                                  },
                                  hintText: 'Documento',
                                  validator: (value) {
                                    if (value.isEmpty) return 'El documento es obligatorio';
                                    return null;
                                  },
                                )
                            ),

                            SizedBox(
                              height: 15.h,
                            ),

                            Flexible(
                                flex: 2,
                                child: InputCustom(
                                  focusNode: _emailFocus,
                                  controller: _inputEmailController,
                                  keyboardType: TextInputType.emailAddress,
                                  onFieldSubmitted: (term) {
                                    _fieldFocusChange(context, _emailFocus, _phoneFocus);
                                  },
                                  hintText: 'Correo electronico',
                                  validator: (value) {
                                    if (value.isEmpty) return 'El correo es obligatorio';
                                    return null;
                                  },
                                )
                            ),

                            SizedBox(
                              height: 15.h,
                            ),

                            Flexible(
                                flex: 2,
                                child: InputCustom(
                                  focusNode: _phoneFocus,
                                  controller: _inputPhoneController,
                                  keyboardType: TextInputType.phone,
                                  onFieldSubmitted: (term) {
                                    _fieldFocusChange(context, _phoneFocus, _addressFocus);
                                  },
                                  hintText: 'teléfono',
                                  validator: (value) {
                                    if (value.isEmpty) return 'El teléfono es obligatorio';
                                    return null;
                                  },
                                )
                            ),


                            SizedBox(
                              height: 15.h,
                            ),

                            Flexible(
                                flex: 2,
                                child: InputCustom(
                                  focusNode: _addressFocus,
                                  controller: _inputAddressController,
                                  keyboardType: TextInputType.text,
                                  onFieldSubmitted: (term) {
                                    _fieldFocusChange(context, _addressFocus, _numberLicenceFocus);
                                  },
                                  hintText: 'Dirección',
                                  validator: (value) {
                                    if (value.isEmpty) return 'La dirección es obligatorio';
                                    return null;
                                  },
                                )
                            ),

                            SizedBox(
                              height: 15.h,
                            ),

                            Flexible(
                                flex: 2,
                                child: InputCustom(
                                  focusNode: _numberLicenceFocus,
                                  controller: _inputNummberLicenceController,
                                  keyboardType: TextInputType.text,
                                  onFieldSubmitted: (term) {
                                    _fieldFocusChange(context, _numberLicenceFocus, _yearLicenceFocus);
                                  },
                                  hintText: 'Numero licencia',
                                  validator: (value) {
                                    if (value.isEmpty) return 'El número de licencia es obligatorio';
                                    return null;
                                  },
                                )
                            ),


                            SizedBox(
                              height: 15.h,
                            ),

                            Flexible(
                                flex: 2,
                                child: InputCustom(
                                  focusNode: _yearLicenceFocus,
                                  controller: _inputYearLicenceController,
                                  keyboardType: TextInputType.text,
                                  onFieldSubmitted: (term) {
                                    _fieldFocusChange(context, _yearLicenceFocus, _dateFocus);
                                  },
                                  hintText: 'Año vehiculo',
                                  validator: (value) {
                                    if (value.isEmpty) return 'El año de vehiculo es obligatorio';
                                    return null;
                                  },
                                )
                            ),

                            SizedBox(
                              height: 15.h,
                            ),

                            Flexible(
                                flex: 2,
                                child: InputCustom(
                                  focusNode: _dateFocus,
                                  controller: _inputDateController,
                                  keyboardType: TextInputType.text,
                                  onFieldSubmitted: (term) {
                                    _fieldFocusChange(context, _dateFocus, _passwordFocus);
                                  },
                                  hintText: 'Fecha de nacimiento',
                                  validator: (value) {
                                    if (value.isEmpty) return 'La fecha de nacimiento es obligatorio';
                                    return null;
                                  },
                                )
                            ),


                            SizedBox(
                              height: 15.h,
                            ),

                            Flexible(
                                flex: 2,
                                child: InputCustom(
                                  focusNode: _passwordFocus,
                                  controller: _inputPasswordController,
                                  keyboardType: TextInputType.text,
                                  hintText: 'Contraseña',
                                  validator: (value) {
                                    if (value.isEmpty) return 'El año de vehiculo es obligatorio';
                                    return null;
                                  },
                                )
                            ),


                            SizedBox(
                              height: 25.h,
                            ),

                            Text(
                              'Tu rutina diaria',
                              style: StyleGeneral.styleTextDescription,
                              textAlign: TextAlign.left,
                            ),

                            SizedBox(
                              height: 15.h,
                            ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 3,
                                  fit: FlexFit.tight,
                                  child: Text(
                                    "- Manejas diario solo para ir al trabajo.",
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: StyleGeneral.BLACK,
                                      fontSize: ScreenUtil().setSp(14),
                                      fontFamily: 'Poppins-Regular',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 3,
                                  fit: FlexFit.tight,
                                  child: Text(
                                    "- Eres conductor de tiempo completo.",
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: StyleGeneral.BLACK,
                                      fontSize: ScreenUtil().setSp(14),
                                      fontFamily: 'Poppins-Regular',
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 3,
                                  fit: FlexFit.tight,
                                  child: Text(
                                    "- No usas tu carro diariamente.",
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: StyleGeneral.BLACK,
                                      fontSize: ScreenUtil().setSp(14),
                                      fontFamily: 'Poppins-Regular',
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.loose,
                                  child: Container(
                                    width: 35.h,
                                    height: 25.h,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      color: StyleGeneral.WHITE,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: StyleGeneral.RED,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.done,
                                        color: Colors.white,
                                        size: ScreenUtil().setSp(15),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            /////
                            CustomButton(
                              text: 'Registrar',
                              fullscreen: true,
                              onTap: (){
                                if (formState.currentState.validate()) {

                                }
                              },
                            ),

                            SizedBox(
                              height: 25.h,
                            ),






                          ],

                        ),

                      )

                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
