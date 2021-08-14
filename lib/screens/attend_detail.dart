import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:horse_app/bloc/home/cubit.dart';
import 'package:horse_app/bloc/home/states.dart';
import 'package:horse_app/constants/colors.dart';
import 'package:horse_app/constants/fonts.dart';
import 'package:horse_app/screens/new_attend_screen.dart';
import 'package:horse_app/screens/profile_screen.dart';
import 'package:horse_app/screens/subscribe_detail.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:transitioner/transitioner.dart';
import 'notification_screen.dart';

class AttendDetail extends StatelessWidget {
  final id;

  const AttendDetail({
    this.id,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is CancelAttendSuccess) {
          Fluttertoast.showToast(
            msg: "تم الإرسال بنجاح",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          HomeCubit.get(context).getSubDetail();

          Transitioner(
            context: context,
            child: AttendDetail(
              id: id,
            ),
            animation: AnimationType.fadeIn, // Optional value
            duration: Duration(milliseconds: 300), // Optional value
            replacement: true, // Optional value
            curveType: CurveType.decelerate, // Optional value
          );
        }
        if (state is CancelAttendError) {
          Fluttertoast.showToast(
            msg: "فشل الإرسال، الرجاء إعاده المحاوله",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
      builder: (context, state) {
        HomeCubit _cubit = HomeCubit.get(context);
        return state is! CancelAttendLoading
            ? Scaffold(
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
                                animation: AnimationType.fadeIn,
                                duration: Duration(milliseconds: 300),
                                replacement: true,
                                curveType: CurveType.decelerate,
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
                            duration:
                                Duration(milliseconds: 300), // Optional value
                            replacement: true, // Optional value
                            curveType: CurveType.decelerate, // Optional value
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40.0,
                          child: ClipRRect(
                            child: Image.network(
                              '${_cubit.profileModel!.data!.photo}',
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
                            textDirection: TextDirection.rtl,
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: IconButton(
                                        onPressed: () {
                                          Transitioner(
                                            context: context,
                                            child: SubscribeDetail(
                                              id: id,
                                            ),
                                            animation: AnimationType
                                                .fadeIn, // Optional value
                                            duration: Duration(
                                                milliseconds:
                                                    300), // Optional value
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Center(
                                      child: AutoSizeText(
                                        'جميع طلبات حضور الحصص التدريبية',
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  width: double.infinity,
                                  height: 0.5,
                                  color: Color(0xff707070),
                                ),
                              ),
                              SizedBox(height: 20),
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: MaterialButton(
                                        onPressed: () {
                                          // _cubit.getSubDetail();
                                          Transitioner(
                                            context: context,
                                            child: NewAttendScreen(
                                              id: id,
                                            ),
                                            animation: AnimationType.fadeIn,
                                            duration:
                                                Duration(milliseconds: 300),
                                            replacement: true,
                                            curveType: CurveType.decelerate,
                                          );
                                        },
                                        color: Color(0xff30A401),
                                        minWidth: double.infinity,
                                        height: 50,
                                        child: Text(
                                          'طلب حضور جديد',
                                          style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        width: double.infinity,
                                        child: Center(
                                          child: AutoSizeText(
                                            'المتبقي لديك من الحصص التدريبية ( ${_cubit.subscribeDetails!.data!.where((element) => element.id == id).first.subscription!.info!.restClassCount} )  يمكنك الغاء الحضور اخر موعد قبل الحضور بـ 5 ساعات ',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Cairo',
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0xffD1E7DD),
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          width: 1200,
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                'assets/images/attends_detail.png',
                                                width: 1200,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: double.infinity,
                                                  // height: 500,
                                                  child: ListView.builder(
                                                    itemBuilder:
                                                        (context, index) =>
                                                            _buildItem(
                                                      _cubit.subscribeDetails!
                                                          .data!
                                                          .where((element) =>
                                                              element.id == id)
                                                          .first
                                                          .subscription!
                                                          .attends![index],
                                                      context,
                                                      _cubit,
                                                      state,
                                                    ),
                                                    itemCount: _cubit
                                                        .subscribeDetails!.data!
                                                        .where((element) =>
                                                            element.id == id)
                                                        .first
                                                        .subscription!
                                                        .attends!
                                                        .length,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        scrollDirection: Axis.horizontal,
                                        reverse: true,
                                      ),
                                    ),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            : Scaffold(
                body: LoadingRotating.square(
                  backgroundColor: mPrimaryColor,
                ),
              );
      },
    );
  }

  Widget _buildItem(item, context, HomeCubit _cubit, HomeStates _state) {
    final _formKey = GlobalKey<FormState>();
    final _controller = TextEditingController();

    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xffDEE2E6),
            ),
          ),
          child: Text(
            '${item.day}',
            style: TextStyle(
              fontFamily: mPrimaryArabicFont,
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
            maxLines: 1,
            textDirection: TextDirection.rtl,
            // style: TextStyle(
            //   fontFamily: mPrimaryArabicFont,
            // ),
          ),
          width: 140,
          height: item.statueAr != 'تحت المراجعة' ? 50 : 60,
          padding: const EdgeInsets.all(14),
        ),
        Container(
          width: 165,
          height: item.statueAr != 'تحت المراجعة' ? 50 : 60,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffDEE2E6)),
          ),
          child: Text(
            '${item.date.toString().substring(0, 10)}',
            maxLines: 1,
            textDirection: TextDirection.rtl,
          ),
          padding: const EdgeInsets.all(10),
        ),
        Container(
          width: 152,
          height: item.statueAr != 'تحت المراجعة' ? 50 : 60,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffDEE2E6)),
          ),
          child: Text(
            '${item.time}',
            textDirection: TextDirection.rtl,
          ),
          padding: const EdgeInsets.all(15),
        ),
        Container(
          width: 253,
          height: item.statueAr != 'تحت المراجعة' ? 50 : 60,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffDEE2E6)),
          ),
          child: Text(
            '${_cubit.subscribeDetails!.data!.where((element) => element.id == id).first.trainer!.name}',
            style: TextStyle(
              fontFamily: mPrimaryArabicFont,
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
            textDirection: TextDirection.rtl,
          ),
          padding: const EdgeInsets.all(15),
        ),
        if (item.statueAr != 'تحت المراجعة')
          Container(
            width: 450,
            height: item.statueAr != 'تحت المراجعة' ? 50 : 60,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffDEE2E6)),
            ),
            child: Text(
              '${item.statueAr}',
              style: TextStyle(
                fontFamily: mPrimaryArabicFont,
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
              maxLines: 1,
              textDirection: TextDirection.rtl,
            ),
            padding: const EdgeInsets.all(15),
          ),
        if (item.statueAr == 'تحت المراجعة')
          Container(
            width: 450,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffDEE2E6)),
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  item.cancelRequests.length == 0
                      ? '${item.statueAr}'
                      : 'تم ارسال طلب الغاء',
                  style: TextStyle(
                    fontFamily: mPrimaryArabicFont,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(width: 15),
                item.cancelRequests.length == 0
                    ? MaterialButton(
                        onPressed: () {
                          AwesomeDialog(
                            context: context,
                            animType: AnimType.SCALE,
                            headerAnimationLoop: false,
                            dialogType: DialogType.WARNING,
                            body: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    'هل انت متأكد من ارسال الطلب',
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: mPrimaryArabicFont,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Form(
                                      key: _formKey,
                                      child: TextFormField(
                                        controller: _controller,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'هذا الحقل مطلوب';
                                          }
                                        },
                                        textDirection: TextDirection.rtl,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'أدخل السبب',
                                          hintTextDirection: TextDirection.rtl,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            title: 'This is Ignored',
                            desc: 'This is also Ignored',
                            btnOkOnPress: () {},
                            btnOk: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              color: Color(0xff2ecc71),
                              child: _state is! CancelAttendLoading
                                  ? Text(
                                      'إرسال',
                                      style: TextStyle(
                                        // fontFamily: mPrimaryArabicFont,
                                        fontSize: 18,
                                      ),
                                    )
                                  : Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                              textColor: Colors.white,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Transitioner(
                                    context: context,
                                    child: AttendDetail(
                                      id: id,
                                    ),
                                    animation:
                                        AnimationType.fadeIn, // Optional value
                                    duration: Duration(
                                        milliseconds: 300), // Optional value
                                    replacement: true, // Optional value
                                    curveType:
                                        CurveType.decelerate, // Optional value
                                  );
                                  _cubit.cancelAttend(
                                    id: item.id,
                                    reason: _controller.text,
                                  );
                                }
                              },
                            ),
                            btnCancelText: 'إغلاق',
                            btnCancelOnPress: () {},

                            // btnOkText: 'إرسال',
                          )..show();
                        },
                        child: Text(
                          'طلب إلغاء الحضور',
                          style: TextStyle(
                            fontFamily: mPrimaryArabicFont,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        color: Color(0xff0B5ED7),
                        textColor: Colors.white,
                        height: 50,
                      )
                    : Text(''),
              ],
            ),
            padding: const EdgeInsets.all(15),
          ),
      ],
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.start,
    );
  }
}
