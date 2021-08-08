import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:horse_app/bloc/home/cubit.dart';
import 'package:horse_app/bloc/home/states.dart';
import 'package:horse_app/constants/colors.dart';
import 'package:horse_app/constants/fonts.dart';
import 'package:horse_app/screens/my_ind_subscribe_follow.dart';
import 'package:intl/intl.dart';
import 'package:transitioner/transitioner.dart';
import 'package:flutter/material.dart' as ui;

import 'notification_screen.dart';
import 'profile_screen.dart';

class ConfirmIndSubscribeScreen extends StatelessWidget {
  final _dateteController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final id;

  ConfirmIndSubscribeScreen({required this.id});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is SendIndPaymentSuccess) {
          _dateteController.text = '';
          HomeCubit.get(context).iImage = null;
          Fluttertoast.showToast(
              msg: "تم الإرسال بنجاح",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        if (state is SendIndPaymentError) {
          Fluttertoast.showToast(
              msg: "فشل الإرسال، الرجاء إعاده المحاوله",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context, state) {
        HomeCubit _cubit = HomeCubit.get(context);
        var indImage = HomeCubit.get(context).iImage;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 110,
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Container(
              margin: const EdgeInsets.only(right: 15, top: 15),
              child: Image.asset(
                'assets/images/logo.png',
                width: 140,
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    IconButton(
                      onPressed: () {
                        _cubit.getUserNotification();
                        _cubit.notificationModel!.data!
                            .where((element) => element.seen == '0')
                            .forEach((element) {
                          print(element.id);
                          _cubit.seenAllNotification(noteId: element.id);
                        });
                        Transitioner(
                          context: context,
                          child: NotificationScreen(),
                          animation: AnimationType.fadeIn, // Optional value
                          duration:
                              Duration(milliseconds: 300), // Optional value
                          replacement: true, // Optional value
                          curveType: CurveType.decelerate, // Optional value
                        );
                      },
                      icon: Icon(
                        Icons.notifications_none,
                        size: 30,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 4,
                      child: Container(
                        // padding: const EdgeInsets.all(2),
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30),
                          // border: Border.all(
                          //   color: Color(0xff707070),
                          // ),
                        ),
                        child: Center(
                          child: Text(
                            '${_cubit.notificationModel!.data!.where((element) => element.seen == '0').length}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () {
                    _cubit.getUserDataById();
                    Transitioner(
                      context: context,
                      child: ProfileScreen(),
                      animation: AnimationType.fadeIn, // Optional value
                      duration: Duration(milliseconds: 300), // Optional value
                      replacement: true, // Optional value
                      curveType: CurveType.decelerate, // Optional value
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40.0,
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/images/hore_image.jpeg',
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: LayoutBuilder(
                  builder: (context, constraint) {
                    return Column(
                      textDirection: ui.TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: IconButton(
                                  onPressed: () {
                                    HomeCubit.get(context).iImage = null;
                                    Transitioner(
                                      context: context,
                                      child: MyIndSubscribeFollow(),
                                      animation: AnimationType
                                          .fadeIn, // Optional value
                                      duration: Duration(
                                          milliseconds: 300), // Optional value
                                      replacement: true, // Optional value
                                      curveType: CurveType
                                          .decelerate, // Optional value
                                    );
                                  },
                                  icon: Icon(
                                    Icons.double_arrow,
                                    color: mPrimaryColor,
                                  )),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Center(
                                child: AutoSizeText(
                                  'بيانات الدفع',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: mPrimaryArabicFont,
                                  ),
                                ),
                              ),
                            ),
                          ],
                          alignment: Alignment.centerRight,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            width: double.infinity,
                            height: 0.5,
                            color: Color(0xff707070),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            textDirection: ui.TextDirection.rtl,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              AutoSizeText(
                                'الحسابات البنكيه',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: mPrimaryArabicFont,
                                ),
                                textDirection: ui.TextDirection.rtl,
                              ),
                              SizedBox(height: 25),
                              Image.asset('assets/images/group_56843.jpg'),
                              SizedBox(height: 30),
                              AutoSizeText(
                                'التاريخ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: mPrimaryArabicFont,
                                ),
                              ),
                              SizedBox(height: 5),
                              Form(
                                child: Container(
                                  child: TextFormField(
                                    controller: _dateteController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'هذا الحقل مطلوب';
                                      }
                                    },
                                    onTap: () {
                                      showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime(2222))
                                          .then((value) =>
                                              _dateteController.text =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(value!));
                                    },
                                    textInputAction: TextInputAction.done,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  width: double.infinity,
                                ),
                                key: _formKey,
                              ),
                              SizedBox(height: 20),
                              Column(
                                children: [
                                  AutoSizeText(
                                    'أرفق صوره التحويل',
                                    style: TextStyle(
                                      fontFamily: mPrimaryArabicFont,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  indImage == null
                                      ? GestureDetector(
                                          child: Image.asset(
                                              'assets/images/choose.jpg'),
                                          onTap: () {
                                            HomeCubit.get(context).iGetImage();
                                          },
                                        )
                                      : AutoSizeText(
                                          indImage.path,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                ],
                                textDirection: ui.TextDirection.rtl,
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                              SizedBox(height: 20),
                              Center(
                                child: MaterialButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      if (indImage == null) {
                                        Fluttertoast.showToast(
                                            msg: "لم تحدد أي صور",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      } else {
                                        final _image =
                                            await MultipartFile.fromFile(
                                                indImage.path);

                                        final formData = FormData.fromMap(
                                          {
                                            'transaction_date':
                                                _dateteController.text,
                                            'transaction_image': _image,
                                            '_method': 'put',
                                          },
                                        );
                                        // var formData = FormData.fromMap(
                                        //   {
                                        //     'transaction_image':
                                        //         await MultipartFile.fromFile(
                                        //       indImage.path,
                                        //       filename: fileName,
                                        //     ),
                                        //     'transaction_date':
                                        //         _dateteController.text,
                                        //   },
                                        // );

                                        HomeCubit.get(context)
                                            .sendIndPaymentInfo(
                                          formData: formData,
                                          id: id,
                                        );
                                      }
                                    }
                                  },
                                  minWidth: double.infinity,
                                  height: 50,
                                  child: state is! SendIndPaymentLoading
                                      ? AutoSizeText(
                                          'إرسال',
                                          style: TextStyle(
                                            fontFamily: 'Cairo',
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        )
                                      : Center(
                                          child: CircularProgressIndicator(
                                              color: Colors.white),
                                        ),
                                  color: Color(0xff157347),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
