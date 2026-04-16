import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skinsync_clinic_portal/utils/color_constant.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:skinsync_clinic_portal/view_models/auth_view_model.dart';

import '../screens/sign_in_screen.dart';
import '../services/locator.dart';
import '../services/storage_service.dart';
import '../utils/assets.dart';
import '../utils/responsive.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showLogo;
  const CustomAppBar({super.key, this.showLogo = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 101.h,
      color: CustomColors.whiteColor,
      constraints: BoxConstraints(minHeight: 101.h),
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showLogo)
            Row(
              children: [
                Image.asset(PngAssets.splashLogo, width: 40.w),
                SizedBox(width: 10.w,),
                Image.asset(PngAssets.logo),
                SizedBox(width: 15.w,),
              ],
            ),
          context.isLandscape
              ? SizedBox(
                  width: 380.r,
                  child: CupertinoSearchTextField(
                    backgroundColor: Color(0xFFF3F3F5),
                  ),
                )
              : _buildMobileActions(context),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.bell, size: 24.r),
          ),
          context.isLandscape ? SizedBox(width: 30.r) : SizedBox.shrink(),
          context.isLandscape
              ? Consumer(
                  builder: (context, ref, _) {
                    final image = ref
                        .watch(authViewModelProvider)
                        .user
                        ?.clinic
                        ?.logo;
                    return ClipOval(
                      child: Image.network(
                        image ?? "",
                        width: 44.r,
                        height: 44.r,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.broken_image, size: 22.sp);
                        },
                      ),
                    );
                  },
                )
              : SizedBox.shrink(),

          context.isLandscape
              ? Row(
                  children: [
                    SizedBox(width: 20.w),
                    Consumer(
                      builder: (context, ref, _) {
                        final name = ref
                            .watch(authViewModelProvider)
                            .user
                            ?.name;
                        return Text(
                          name ?? "N/A",
                          style: CustomFonts.black16w600,
                        );
                      },
                    ),
                    SizedBox(width: 20.w),
                    PopupMenuButton(
                      offset: Offset(0, 40.h),
                      icon: Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        size: 18.sp,
                        color: CustomColors.blackColor,
                      ),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          height: 40.h,
                          onTap: () async {
                            final _secureStorage =
                                locator<SecureStorageService>();
                            await _secureStorage.clearToken();
                            if (!context.mounted) return;
                            context.goNamed(SignInScreen.routeName);
                          },

                          child: Row(
                            children: [
                              Icon(
                                Icons.logout_rounded,
                                color: Colors.red,
                                size: 18.sp,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Logout',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _buildMobileActions(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: Icon(Icons.menu),
        ),
        SizedBox(width: 10.w),
        context.isLandscape
            ? Image.asset(PngAssets.splashLogo, width: 48.r, height: 48.r)
            : ClipOval(
                child: Image.asset(PngAssets.person, width: 44.r, height: 44.r),
              ),
        SizedBox(width: 5.w),
        Text("Scarlet Fox", style: CustomFonts.black22w600),
        SizedBox(width: 40.w),
        PopupMenuButton(
          offset: Offset(0, 40.h),
          icon: Icon(
            Icons.arrow_drop_down_circle_outlined,
            size: 18.sp,
            color: CustomColors.blackColor,
          ),
          itemBuilder: (context) => [
            PopupMenuItem(
              height: 40.h,
              onTap: () {},
              child: Row(
                children: [
                  Icon(Icons.logout_rounded, color: Colors.red, size: 18.sp),
                  SizedBox(width: 8.w),
                  Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 101.h);
}
