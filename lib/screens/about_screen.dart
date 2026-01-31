import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  int selectedTab = 0; // 0 = Terms & Conditions, 1 = Privacy Policy

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 250.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with back button and title
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back,
                        size: 24.sp,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      'About',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              // Divider
              Divider(height: 1.h, thickness: 1, color: Colors.grey.shade200),

              SizedBox(height: 16.h),

              // Tab Row
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildTab(
                        title: 'Terms & Conditions',
                        isSelected: selectedTab == 0,
                        onTap: () => setState(() => selectedTab = 0),
                      ),
                      _buildTab(
                        title: 'Privacy Policy',
                        isSelected: selectedTab == 1,
                        onTap: () => setState(() => selectedTab = 1),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              // Content based on selected tab
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Colors.white,
                    ),

                    child: selectedTab == 0
                        ? _buildTermsAndConditions()
                        : _buildPrivacyPolicy(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.black87 : Colors.grey.shade200,
            width: 1.r,
          ),
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(6.r),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected ? Colors.black : Colors.grey.shade600,
          ),
        ),
      ),
    );
  }

  Widget _buildTermsAndConditions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Terms & Conditions',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 20.h),
        _buildSection(
          number: '1',
          title: 'Acceptance of Terms',
          content:
              'By accessing and using SkinSync AI, you accept and agree to be bound by the terms and provision of this agreement. If you do not agree to these terms, please do not use this service.',
        ),
        _buildSection(
          number: '2',
          title: 'Use License',
          content:
              'Permission is granted to temporarily use SkinSync AI for personal, non-commercial transitory viewing only. This is the grant of a license, not a transfer of title.',
        ),
        _buildSection(
          number: '3',
          title: 'Medical Information Disclaimer',
          content:
              'SkinSync AI provides AI-powered recommendations for aesthetic treatments. All recommendations should be reviewed and approved by licensed medical professionals. The AI analysis is for guidance purposes only and does not replace professional medical judgment.',
        ),
        _buildSection(
          number: '4',
          title: 'Data Security and HIPAA Compliance',
          content:
              'We are committed to protecting patient data and maintaining HIPAA compliance. All patient information is encrypted and stored securely. Access to patient data is restricted to authorized personnel only.',
        ),
        _buildSection(
          number: '5',
          title: 'Limitation of Liability',
          content:
              'SkinSync AI shall not be liable for any damages arising out of or in connection with the use or inability to use the service, even if we have been advised of the possibility of such damages.',
        ),
        _buildSection(
          number: '6',
          title: 'Modifications',
          content:
              'SkinSync AI may revise these terms at any time without notice. By using this application, you are agreeing to be bound by the current version of these terms.',
        ),
        SizedBox(height: 24.h),
      ],
    );
  }

  Widget _buildPrivacyPolicy() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Privacy Policy',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 20.h),
        _buildSection(
          number: '1',
          title: 'Information Collection',
          content:
              'We collect information you provide directly to us, including personal information such as your name, email address, and any other information you choose to provide.',
        ),
        _buildSection(
          number: '2',
          title: 'Use of Information',
          content:
              'We use the information we collect to provide, maintain, and improve our services, to communicate with you, and to personalize your experience.',
        ),
        _buildSection(
          number: '3',
          title: 'Information Sharing',
          content:
              'We do not share your personal information with third parties except as described in this privacy policy or with your consent.',
        ),
        _buildSection(
          number: '4',
          title: 'Data Security',
          content:
              'We take reasonable measures to help protect your personal information from loss, theft, misuse, unauthorized access, disclosure, alteration, and destruction.',
        ),
        _buildSection(
          number: '5',
          title: 'Your Rights',
          content:
              'You have the right to access, update, or delete your personal information at any time. You may also opt out of receiving promotional communications from us.',
        ),
        _buildSection(
          number: '6',
          title: 'Contact Us',
          content:
              'If you have any questions about this Privacy Policy, please contact us through the app or via email at support@skinsync.ai.',
        ),
        SizedBox(height: 24.h),
      ],
    );
  }

  Widget _buildSection({
    required String number,
    required String title,
    required String content,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number. $title',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            content,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade700,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
