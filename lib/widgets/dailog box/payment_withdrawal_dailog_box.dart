import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinsync_clinic_portal/utils/assets.dart';
import 'package:skinsync_clinic_portal/utils/color_constant.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:skinsync_clinic_portal/widgets/dailog%20box/successfully_withdrawal_dailbox.dart';

class PaymentWithDrawalDailogBox extends StatelessWidget {
  const PaymentWithDrawalDailogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        width: 520.w,
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 
                  Text("Withdraw Balance", style: CustomFonts.black30w600),
          
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 32.w,
                      width: 32.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black12),
                      ),
                      child: const Icon(Icons.close, size: 18),
                    ),
                  ),
                ],
              ),
          
              SizedBox(height: 30.h),
              Divider(color: Colors.grey.shade300,),
              Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  decoration: BoxDecoration(
                    
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    children: [
                     
                      SizedBox(height: 80.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "\$",
                            style: CustomFonts.black50w600
                          ),
                          IntrinsicWidth(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: 10,
                                maxWidth: 310.w,
                              ),
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  // Display field with the value + .00
                                  //   _buildFieldWith00(),
                                  TextFormField(
                                    maxLines: null,
                                    minLines: 1,

                                    // inputFormatters: [
                                    //   FilteringTextInputFormatter.digitsOnly,
                                    //   LengthLimitingTextInputFormatter(6),
                                    // ],
                                    textAlign: TextAlign.left,
                                    style: CustomFonts.black50w600,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      border: InputBorder.none,
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      hintText: '0',
                                      hintStyle: CustomFonts.grey50w600
                                    ),
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                          decimal: false,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                           SizedBox(width: 5.w,),
                           Text("USD", 
                           textAlign: TextAlign.end,
                           style: CustomFonts.black30w600,)
                        ],
                      ),
                      SizedBox(height: 80.h),
                      Divider(color: Colors.grey.shade300,),
                      SizedBox(height: 20.w,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.w),
                        child: Row(
                        
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text("Available to withdraw",style: CustomFonts.black18w600,),
                           Text("\$226,565",style: CustomFonts.black18w600,)
                        ],),
                      ),
                      SizedBox(height: 10.w,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.w),
                        child: Row(
                        
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text("Service Charges",style: CustomFonts.black18w600,),
                           Text("\$2",style: CustomFonts.black18w600,)
                        ],),
                      ),
                      SizedBox(height: 75.h,),

                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50.w),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    const SuccessfullyWithdrawalDailogBox(),
                              );
                            },
                            child: Text("Withdraw Funds"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
