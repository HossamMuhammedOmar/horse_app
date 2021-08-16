import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horse_app/bloc/home/cubit.dart';
import 'package:horse_app/bloc/home/states.dart';
import 'package:horse_app/constants/colors.dart';
import 'package:horse_app/constants/fonts.dart';
import 'package:horse_app/models/categories_model.dart';
import 'package:horse_app/screens/contact_screen.dart';
import 'package:horse_app/screens/posts_detail_screen.dart';
import 'package:horse_app/screens/profile_screen.dart';
import 'package:horse_app/screens/reservation_screen.dart';
import 'package:transitioner/transitioner.dart';
import 'notification_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        HomeCubit.get(context).getUserNotification();
        HomeCubit.get(context).getAllActiveSubcribe();
        HomeCubit.get(context).getAllEndSubcribe();
        return BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            HomeCubit _cubit = HomeCubit.get(context);
            var acounte = _cubit.activeCount;
            var endCount = _cubit.endCount;
            // ignore: unused_local_variable
            var catId;
            return state is! GetUserNotificationLoading &&
                    _cubit.categoriesModel != null &&
                    _cubit.postsModel != null
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
                                    _cubit.seenAllNotification(
                                        noteId: element.id);
                                  });
                                  Transitioner(
                                    context: context,
                                    child: NotificationScreen(),
                                    animation:
                                        AnimationType.fadeIn, // Optional value
                                    duration: Duration(
                                        milliseconds: 300), // Optional value
                                    replacement: true, // Optional value
                                    curveType:
                                        CurveType.decelerate, // Optional value
                                  );
                                },
                                icon: Icon(
                                  Icons.notifications_none,
                                  size: 30,
                                ),
                              ),
                              _cubit.notificationModel != null
                                  ? Positioned(
                                      right: 0,
                                      top: 4,
                                      child: Container(
                                        // padding: const EdgeInsets.all(2),
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          // border: Border.all(
                                          //   color: Color(0xff707070),
                                          // ),
                                        ),

                                        child: Center(
                                          child: Text(
                                            '${_cubit.notificationModel!.data!.where((element) => element.seen == '0').length}',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Positioned(
                                      right: 0,
                                      top: 4,
                                      child: Container(
                                        // padding: const EdgeInsets.all(2),
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          // border: Border.all(
                                          //   color: Color(0xff707070),
                                          // ),
                                        ),

                                        child: Center(
                                          child: Text(
                                            '0',
                                            style:
                                                TextStyle(color: Colors.white),
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
                                animation:
                                    AnimationType.fadeIn, // Optional value
                                duration: Duration(
                                    milliseconds: 300), // Optional value
                                replacement: true, // Optional value
                                curveType:
                                    CurveType.decelerate, // Optional value
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
                    floatingActionButton: Container(
                      height: 65.0,
                      width: 65.0,
                      child: FittedBox(
                        child: FloatingActionButton(
                          elevation: 0,
                          backgroundColor: Colors.white,
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Image.asset('assets/images/home.png'),
                          ),
                        ),
                      ),
                    ),
                    body: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/bg.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: LayoutBuilder(
                              builder: (context, constraint) {
                                var topHeight = constraint.maxHeight;
                                var topWidht = constraint.maxWidth;
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Center(
                                        // child: RichText(
                                        //   textAlign: TextAlign.center,
                                        //   text: TextSpan(
                                        //     text: 'إشتراك ',
                                        //     style: TextStyle(
                                        //       fontSize: 16,
                                        //       fontFamily: mPrimaryArabicFont,
                                        //       color: mPrimaryColor,
                                        //     ),
                                        //     children: const <TextSpan>[
                                        //       TextSpan(
                                        //         text: 'فعال',
                                        //         style: TextStyle(
                                        //           color: Color(0xff079606),
                                        //         ),
                                        //       ),
                                        //       TextSpan(text: ' ( )'),
                                        //       TextSpan(text: ' '),
                                        //       TextSpan(text: ' إشتراك '),
                                        //       TextSpan(
                                        //         text: 'منتهي ',
                                        //         style: TextStyle(
                                        //           color: Color(0xffEE1313),
                                        //         ),
                                        //       ),
                                        //       TextSpan(text: '( 0 )'),
                                        //     ],
                                        //   ),
                                        // ),
                                        child: Row(
                                          children: [
                                            Text(
                                              'إشتراك',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: mPrimaryArabicFont,
                                                color: mPrimaryColor,
                                              ),
                                              textDirection: TextDirection.rtl,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              'فعال',
                                              textAlign: TextAlign.center,
                                              textDirection: TextDirection.rtl,
                                              style: TextStyle(
                                                color: Color(0xff079606),
                                                fontSize: 16,
                                                fontFamily: mPrimaryArabicFont,
                                              ),
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              '$acounte',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              'إشتراك',
                                              textAlign: TextAlign.center,
                                              textDirection: TextDirection.rtl,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: mPrimaryArabicFont,
                                                color: mPrimaryColor,
                                              ),
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              'منتهي',
                                              textAlign: TextAlign.center,
                                              textDirection: TextDirection.rtl,
                                              style: TextStyle(
                                                color: Color(0xffEE1313),
                                                fontSize: 16,
                                                fontFamily: mPrimaryArabicFont,
                                              ),
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              '$endCount',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                          textDirection: TextDirection.rtl,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Container(
                                        width: double.infinity,
                                        height: 0.5,
                                        color: Color(0xff707070),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 1,
                                                    color: Colors.grey
                                                        .withOpacity(0.9),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: DecoratedBox(
                                                  decoration: ShapeDecoration(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(3.0),
                                                      ),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 20,
                                                    ),
                                                    child:
                                                        DropdownButtonHideUnderline(
                                                      child: DropdownButton(
                                                        icon: Icon(Icons
                                                            .keyboard_arrow_down_sharp),
                                                        iconEnabledColor:
                                                            mPrimaryColor,
                                                        items:
                                                            _cubit.service.map(
                                                          (s) {
                                                            return DropdownMenuItem(
                                                              onTap: () {
                                                                catId = s.id;
                                                                _cubit
                                                                    .getAllCategoriesPackage(
                                                                  catId: s.id,
                                                                );
                                                              },
                                                              value: s.name,
                                                              child: Container(
                                                                child:
                                                                    AutoSizeText(
                                                                  s.name,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 1,
                                                                  style:
                                                                      TextStyle(
                                                                    color:
                                                                        mPrimaryColor,
                                                                    fontFamily:
                                                                        mPrimaryArabicFont,
                                                                    fontSize:
                                                                        13,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).toList(),
                                                        value: _cubit
                                                            .selectedService,
                                                        onChanged: (value) {
                                                          _cubit.selecteService(
                                                              value);
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 30),
                                            Container(
                                              // color: Colors.black,
                                              width: double.infinity,
                                              height: topHeight / 2.6,
                                              child: ListView.separated(
                                                physics:
                                                    BouncingScrollPhysics(),
                                                reverse: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  if (index == 3) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 20.0,
                                                      ),
                                                      child:
                                                          _buildHorizontalItem(
                                                        topWidht,
                                                        topHeight,
                                                        _cubit.packagesModel !=
                                                                null
                                                            ? _cubit
                                                                .packagesModel!
                                                                .data!
                                                                .packages![index]
                                                            : null,
                                                        _cubit.packagesModel !=
                                                                null
                                                            ? _cubit
                                                                .packagesModel!
                                                                .data
                                                            : null,
                                                        _cubit.categoriesModel!,
                                                        _cubit
                                                            .categoriesModel!
                                                            .data!
                                                            .first
                                                            .packages![index]
                                                            .title,
                                                        index,
                                                        context,
                                                      ),
                                                    );
                                                  } else if (index == 0) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 20.0),
                                                      child:
                                                          _buildHorizontalItem(
                                                        topWidht,
                                                        topHeight,
                                                        _cubit.packagesModel !=
                                                                null
                                                            ? _cubit
                                                                .packagesModel!
                                                                .data!
                                                                .packages![index]
                                                            : null,
                                                        _cubit.packagesModel !=
                                                                null
                                                            ? _cubit
                                                                .packagesModel!
                                                                .data
                                                            : null,
                                                        _cubit.categoriesModel!,
                                                        _cubit
                                                            .categoriesModel!
                                                            .data!
                                                            .first
                                                            .packages![index]
                                                            .title,
                                                        index,
                                                        context,
                                                      ),
                                                    );
                                                  } else {
                                                    return _buildHorizontalItem(
                                                      topWidht,
                                                      topHeight,
                                                      _cubit.packagesModel !=
                                                              null
                                                          ? _cubit
                                                              .packagesModel!
                                                              .data!
                                                              .packages![index]
                                                          : null,
                                                      _cubit.packagesModel !=
                                                              null
                                                          ? _cubit
                                                              .packagesModel!
                                                              .data
                                                          : null,
                                                      _cubit.categoriesModel!,
                                                      _cubit
                                                          .categoriesModel!
                                                          .data!
                                                          .first
                                                          .packages![index]
                                                          .title,
                                                      index,
                                                      context,
                                                    );
                                                  }
                                                },
                                                separatorBuilder:
                                                    (context, index) =>
                                                        SizedBox(width: 20),
                                                itemCount:
                                                    _cubit.packagesModel != null
                                                        ? _cubit
                                                            .packagesModel!
                                                            .data!
                                                            .packages!
                                                            .length
                                                        : _cubit
                                                            .categoriesModel!
                                                            .data!
                                                            .first
                                                            .packages!
                                                            .length,
                                              ),
                                            ),
                                            SizedBox(height: 40),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 20,
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                // color: Colors.black,
                                                child: ListView.separated(
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemBuilder:
                                                      (conext, index) =>
                                                          _buildVerticalItem(
                                                    topHeight,
                                                    topWidht,
                                                    _cubit.postsModel!
                                                        .data![index],
                                                    context,
                                                  ),
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          SizedBox(height: 10),
                                                  itemCount: 1,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: mPrimaryColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12)),
                              ),
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height / 13.5,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Transitioner(
                                          context: context,
                                          child: ContactScreen(),
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
                                      child: Image.asset(
                                        'assets/images/mail_bulk.png',
                                        width: 30,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _cubit.getUserDataById();
                                        Transitioner(
                                          context: context,
                                          child: ProfileScreen(),
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
                                      child: Image.asset(
                                        'assets/images/chalkboard.png',
                                        width: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
                : Scaffold(
                    body: Center(
                      child: Image.asset('assets/images/loading.gif'),
                    ),
                  );
          },
        );
      },
    );
  }

  // HELPER METHODS
  Widget _buildHorizontalItem(
      topWidht, height, item, p, CategoriesModel c, title, index, context) {
    return GestureDetector(
      onTap: () {
        if (item == null) {
          Transitioner(
            context: context,
            child: ReservationScreen(
              id: c.data!.first.packages![index].id,
              price: c.data!.first.packages![index].price,
              title: c.data!.first.packages![index].title,
              classCount: c.data!.first.packages![index].classCount,
              subDays: c.data!.first.packages![index].subDays,
              image: c.data!.first.packages![index].image,
              conditions: c.data!.first.packages![index].conditions,
            ),
            animation: AnimationType.fadeIn,
            duration: Duration(milliseconds: 300),
            replacement: true,
            curveType: CurveType.decelerate,
          );
        }
        if (item != null) {
          Transitioner(
            context: context,
            child: ReservationScreen(
              id: item.id,
              price: item.price,
              title: item.title,
              classCount: item.classCount,
              subDays: item.subDays,
              image: item.image,
              conditions: item.conditions,
            ),
            animation: AnimationType.fadeIn,
            duration: Duration(milliseconds: 300),
            replacement: true,
            curveType: CurveType.decelerate,
          );
        }
      },
      child: Container(
        width: topWidht / 2,
        child: Column(
          textDirection: TextDirection.rtl,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FancyShimmerImage(
                  imageUrl: item != null
                      ? '${item.image}'
                      : '${c.data!.first.packages!.first.image}',
                  errorWidget: Image.network(
                      'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                  boxFit: BoxFit.cover,
                  height: height / 4.4,
                ),
              ),
              width: double.infinity,
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: AutoSizeText(
                item != null ? '${item.title}' : '$title',
                maxLines: 2,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Cairo',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVerticalItem(height, width, item, context) {
    return GestureDetector(
      onTap: () {
        Transitioner(
          context: context,
          child: PostsDetailScreen(
            id: item.id,
            name: item.title,
            content: item.content,
            date: item.createdAt,
            image: item.image,
          ),
          animation: AnimationType.fadeIn,
          duration: Duration(milliseconds: 300),
          replacement: true, // Optional value
          curveType: CurveType.decelerate,
        );
      },
      child: Container(
        width: double.infinity,
        height: height / 6,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: Color(0xff707070).withOpacity(0.7),
            width: .7,
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 7, left: 20),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Image.network(
                        '${item.image}',
                        filterQuality: FilterQuality.low,
                        width: width / 4.8,
                        height: height / 8,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          '${item.content}',
                          overflow: TextOverflow.ellipsis,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: mPrimaryArabicFont,
                          ),
                        ),
                        SizedBox(height: 5),
                        AutoSizeText(
                          '${item.createdAt.toString().substring(0, 10)}',
                          overflow: TextOverflow.ellipsis,
                        ),
                        AutoSizeText(
                          '${item.title}',
                          overflow: TextOverflow.ellipsis,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontFamily: mPrimaryArabicFont, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Image.asset(
                'assets/images/arrow_double.png',
                width: width / 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
