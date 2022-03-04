import 'package:flutter/material.dart';
import 'package:radadz_app/src/slider/navigation.dart';
import 'package:radadz_app/src/utils/export.dart';

class ProfilePage extends StatefulWidget with NavigationStates {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final prefs = new Preferences();

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

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 35.h,),
                  Text(
                    'Tus datos de perfil',
                    style: StyleGeneral.styleTextTitle,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 15.h),
                  ///1/////
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Text(
                          "Primer nombre",
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
                        fit: FlexFit.tight,
                        child: InputCustom(
                          focusNode: _nameFirstFocus,
                          controller: _inputNameFirstController,
                          onFieldSubmitted: (term) {
                            //_fieldFocusChange(context, _nameFirstFocus, _nameSecondFocus);
                          },
                          hintText: 'Cesar',
                          validator: (value) {
                            if (value.isEmpty) return 'El nombre es obligatorio';
                            return null;
                          },
                        )
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  ////2////
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Text(
                          "Segundo nombre",
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
                          fit: FlexFit.tight,
                          child: InputCustom(
                            focusNode: _nameFirstFocus,
                            controller: _inputNameFirstController,
                            onFieldSubmitted: (term) {
                              _fieldFocusChange(context, _nameSecondFocus, _lastNameFirstFocus);
                            },
                            hintText: 'Jair',
                            validator: (value) {
                              if (value.isEmpty) return 'El nombre es obligatorio';
                              return null;
                            },
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  ////3////
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Text(
                          "Primer apellido",
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
                          fit: FlexFit.tight,
                          child: InputCustom(
                            focusNode: _nameFirstFocus,
                            controller: _inputNameFirstController,
                            onFieldSubmitted: (term) {
                              _fieldFocusChange(context, _nameFirstFocus, _nameSecondFocus);
                            },
                            hintText: 'Cruz',
                            validator: (value) {
                              if (value.isEmpty) return 'El nombre es obligatorio';
                              return null;
                            },
                          )
                      ),
                    ],
                  ),

                  SizedBox(height: 15.h),
                  ////4////
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Text(
                          "Segundo apellido",
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
                          fit: FlexFit.tight,
                          child: InputCustom(
                            focusNode: _nameFirstFocus,
                            controller: _inputNameFirstController,
                            onFieldSubmitted: (term) {
                              //_fieldFocusChange(context, _nameFirstFocus, _nameSecondFocus);
                            },
                            hintText: 'Lizcano',
                            validator: (value) {
                              if (value.isEmpty) return 'El nombre es obligatorio';
                              return null;
                            },
                          )
                      ),
                    ],
                  ),

                  SizedBox(height: 15.h),
                  ////5////
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Text(
                          "email",
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
                          fit: FlexFit.tight,
                          child: InputCustom(
                            focusNode: _nameFirstFocus,
                            controller: _inputNameFirstController,
                            onFieldSubmitted: (term) {
                              //_fieldFocusChange(context, _nameFirstFocus, _nameSecondFocus);
                            },
                            hintText: 'Cesar@hotmail.com',
                            validator: (value) {
                              if (value.isEmpty) return 'El nombre es obligatorio';
                              return null;
                            },
                          )
                      ),
                    ],
                  ),

                  SizedBox(height: 15.h),
                  ////6////
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Text(
                          "Teléfono",
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
                          fit: FlexFit.tight,
                          child: InputCustom(
                            focusNode: _nameFirstFocus,
                            controller: _inputNameFirstController,
                            onFieldSubmitted: (term) {
                              //_fieldFocusChange(context, _nameFirstFocus, _nameSecondFocus);
                            },
                            hintText: '3157302408',
                            validator: (value) {
                              if (value.isEmpty) return 'El nombre es obligatorio';
                              return null;
                            },
                          )
                      ),
                    ],
                  ),

                  SizedBox(height: 15.h),
                  ////6////
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Text(
                          "Dirección",
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
                          fit: FlexFit.tight,
                          child: InputCustom(
                            focusNode: _nameFirstFocus,
                            controller: _inputNameFirstController,
                            onFieldSubmitted: (term) {
                              //_fieldFocusChange(context, _nameFirstFocus, _nameSecondFocus);
                            },
                             hintText: 'Calle 57 # 12a15',
                            validator: (value) {
                              if (value.isEmpty) return 'El nombre es obligatorio';
                              return null;
                            },
                          )
                      ),
                    ],
                  ),

                  SizedBox(height: 15.h),
                  ////7////
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Text(
                          "Fecha nacimiento",
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
                          fit: FlexFit.tight,
                          child: InputCustom(
                            focusNode: _nameFirstFocus,
                            controller: _inputNameFirstController,
                            onFieldSubmitted: (term) {
                              //_fieldFocusChange(context, _nameFirstFocus, _nameSecondFocus);
                            },
                            hintText: 'dd/mm/yy',
                            validator: (value) {
                              if (value.isEmpty) return 'El nombre es obligatorio';
                              return null;
                            },
                          )
                      ),
                    ],
                  ),

                  SizedBox(height: 15.h),
                  ////8////
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Text(
                          "Número licencia",
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
                          fit: FlexFit.tight,
                          child: InputCustom(
                            focusNode: _nameFirstFocus,
                            controller: _inputNameFirstController,
                            onFieldSubmitted: (term) {
                              //_fieldFocusChange(context, _nameFirstFocus, _nameSecondFocus);
                            },
                            hintText: '19287165',
                            validator: (value) {
                              if (value.isEmpty) return 'El nombre es obligatorio';
                              return null;
                            },
                          )
                      ),
                    ],
                  ),

                  SizedBox(height: 25.h),

                  Text(
                    'Datos Bancarios',
                    style: StyleGeneral.styleTextTitle,
                    textAlign: TextAlign.left,
                  ),

                  SizedBox(height: 15.h),
                  ////1////
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Text(
                          "Banco",
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
                          fit: FlexFit.tight,
                          child: InputCustom(
                            focusNode: _nameFirstFocus,
                            controller: _inputNameFirstController,
                            onFieldSubmitted: (term) {
                              //_fieldFocusChange(context, _nameFirstFocus, _nameSecondFocus);
                            },
                            hintText: '',
                            validator: (value) {
                              if (value.isEmpty) return 'El nombre es obligatorio';
                              return null;
                            },
                          )
                      ),
                    ],
                  ),

                  SizedBox(height: 15.h),
                  ////2////
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Text(
                          "Tipo cuenta",
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
                          fit: FlexFit.tight,
                          child: InputCustom(
                            focusNode: _nameFirstFocus,
                            controller: _inputNameFirstController,
                            onFieldSubmitted: (term) {
                              //_fieldFocusChange(context, _nameFirstFocus, _nameSecondFocus);
                            },
                            hintText: '',
                            validator: (value) {
                              if (value.isEmpty) return 'El nombre es obligatorio';
                              return null;
                            },
                          )
                      ),
                    ],
                  ),

                  SizedBox(height: 15.h),
                  ////3////
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Text(
                          "Número cuenta",
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
                          fit: FlexFit.tight,
                          child: InputCustom(
                            focusNode: _nameFirstFocus,
                            controller: _inputNameFirstController,
                            onFieldSubmitted: (term) {
                              //_fieldFocusChange(context, _nameFirstFocus, _nameSecondFocus);
                            },
                            hintText: '19287165',
                            validator: (value) {
                              if (value.isEmpty) return 'El nombre es obligatorio';
                              return null;
                            },
                          )
                      ),
                    ],
                  ),

                  SizedBox(height: 15.h),
                  ////4////
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Text(
                          "Nombres y apellidos",
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 2,
                          style: TextStyle(
                            color: StyleGeneral.BLACK,
                            fontSize: ScreenUtil().setSp(14),
                            fontFamily: 'Poppins-Regular',
                          ),
                        ),
                      ),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: InputCustom(
                            focusNode: _nameFirstFocus,
                            controller: _inputNameFirstController,
                            onFieldSubmitted: (term) {
                              //_fieldFocusChange(context, _nameFirstFocus, _nameSecondFocus);
                            },
                            hintText: 'Cesar Lizcano',
                            validator: (value) {
                              if (value.isEmpty) return 'El nombre es obligatorio';
                              return null;
                            },
                          )
                      ),
                    ],
                  ),

                  SizedBox(height: 15.h),
                  ////4////
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Text(
                          "Número documento",
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
                          fit: FlexFit.tight,
                          child: InputCustom(
                            focusNode: _nameFirstFocus,
                            controller: _inputNameFirstController,
                            onFieldSubmitted: (term) {
                              //_fieldFocusChange(context, _nameFirstFocus, _nameSecondFocus);
                            },
                            hintText: '19019127',
                            validator: (value) {
                              if (value.isEmpty) return 'El nombre es obligatorio';
                              return null;
                            },
                          )
                      ),
                    ],
                  ),

                  SizedBox(height: 25.h,),

                  GestureDetector(
                    onTap: (){
                      //prefs.clearPreferences();
                      Navigator.pushReplacementNamed(context, 'login');
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w , vertical: 10.h),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 50.w , vertical: 10.h),
                        height:55.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.w),
                          color: StyleGeneral.GREEN,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Text( 'Actualizar' , style: StyleGeneral.styleTextButtonCustom),
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
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
