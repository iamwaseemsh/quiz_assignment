import 'package:flutter/material.dart';
import 'package:quiz_assingments/core/utils/globals/globals.dart';
import '../../router/app_state.dart';
import '../../utils/constants/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShowBackButtonErrorModal {
  show() {
    showDialog(
        context: navigatorKeyGlobal.currentContext!,
        barrierDismissible: true,
        builder: (context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Warning",
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                      ),
                      child: const Text(
                        "Your progress will be lost!",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black26),
                      )),
                  SizedBox(
                    height: 30.h,
                  ),
                  const Divider(
                    color: Colors.black12,
                    height: 1,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Center(
                            child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.black26),
                        )),
                      )),
                      Container(
                        height: 50,
                        width: 1,
                        color: Colors.black12,
                      ),
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          onBackPress = null;
                          Navigator.of(context)
                              .pop();
                          AppState appState = sl();
                          appState.moveToBackScreen();
                        },
                        child: Center(
                            child: Text(
                          "Ok",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        )),
                      )),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
