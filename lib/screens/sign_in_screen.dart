import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:skinsync_clinic_portal/models/requests/login_request_model.dart';
import 'package:skinsync_clinic_portal/utils/responsive.dart';
import 'package:skinsync_clinic_portal/utils/validators.dart';

import '../utils/assets.dart';
import '../view_models/auth_view_model.dart';
import 'dashboard/home_screen.dart';

class SignInScreen extends ConsumerStatefulWidget {
  static const String routeName = '/sign-in-screen';

  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;
  String selectedValue = 'Doctor (Clinic Owner)';

  final List<String> roles = [
    'Doctor (Clinic Owner)',
    'Receptionist',
    'Assistant',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authViewModelProvider.notifier).initialize();
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          context.isLandscape
              ? Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 200.w,
                            height: 200.h,
                            // decoration: BoxDecoration(
                            //   shape: BoxShape.circle,
                            //   gradient: LinearGradient(
                            //     colors: [Color(0xFF9BA7D4), Color(0xFF7DD3D3)],
                            //     begin: Alignment.topLeft,
                            //     end: Alignment.bottomRight,
                            //   ),
                            // ),
                            child: Image.asset(
                              PngAssets.splashLogo,
                              height: 100.w,
                              width: 100.w,
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Text(
                            "SkinSync AI",
                            style: TextStyle(
                              fontSize: 48.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF6B7BA8),
                              letterSpacing: 4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink(),
          Container(width: 1.w, color: Colors.grey.shade300),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 50.h),
              child: Column(
                children: [
                  Container(
                    height: 64.h,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        value: selectedValue,
                        items: roles
                            .map(
                              (item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },

                        buttonStyleData: ButtonStyleData(
                          height: 50.h,
                          padding: EdgeInsets.zero,
                        ),

                        style: TextStyle(fontSize: 14.sp, color: Colors.black),

                        // Icon
                        iconStyleData: IconStyleData(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),
                          iconSize: 24.sp,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          offset: const Offset(0, -2),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),

                        // Menu item style
                        menuItemStyleData: MenuItemStyleData(
                          height: 45.h,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12.r)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.w,
                        vertical: 40.h,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              SvgAssets.stethoscope,
                              height: 60.h,
                              width: 60.w,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              "Doctor (Clinic Owner)",
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              "Full administrative and clinical access",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            SizedBox(height: 40.h),
                            // Full Name Field
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                  text: "Email Address",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    height: 0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "*",
                                      style: TextStyle(
                                        height: 0,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: Validators.email,
                              decoration: InputDecoration(
                                hintText: "Enter Your Email Address",
                              ),
                            ),
                            SizedBox(height: 20.h),
                            // Password Field
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                  text: "Password",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    height: 0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "*",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            TextFormField(
                              controller: _passwordController,
                              validator: Validators.password,
                              obscureText: _obscurePassword,
                              decoration: InputDecoration(
                                hintText: "Enter your password",
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Colors.grey.shade600,
                                    size: 20.sp,
                                  ),
                                  onPressed: () => setState(
                                    () => _obscurePassword = !_obscurePassword,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () {
                                  // handle forget password
                                  // context.go()
                                },
                                child: Text(
                                  "Forget Password",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Color(0xFF2881F5),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 30.h),
                            GestureDetector(
                              onTap: () {
                                if (!_formKey.currentState!.validate()) return;

                                ref
                                    .read(authViewModelProvider.notifier)
                                    .login(
                                      loginReq: LoginRequestModel(
                                        email: _emailController.text.trim(),
                                        password: _passwordController.text
                                            .trim(),
                                      ),
                                    )
                                    .then((success) {
                                      if (success && context.mounted) {
                                        context.goNamed(HomeScreen.routeName);
                                      }
                                    });
                              },
                              child: Container(
                                width: 215.w,
                                // height: 50.h,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.w,
                                  vertical: 14.h,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.r),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Sign In",
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 8.w),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 20.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
