// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "Authentication": {
    "appbar": "مرحبًا بعودتك !",
    "email": "البريد الالكتروني",
    "password": "كلمة المرور",
    "phoneNumber": "رقم الجوال",
    "forgotPassword": "نسيت كلمة المرور",
    "tryAnotherWay": "طريقة اخرى",
    "resetPassword": "استعادة كلمة المرور",
    "changePassword": "تغيير كلمة المرور",
    "newPassword": "كلمة المرور الجديدة",
    "confirmPassword": "تأكيد كلمة المرور",
    "login": "تسجيل الدخول",
    "sendCode": "ارسل الرمز",
    "confirm": "تأكيد"
  },
  "onBoarding": {
    "team": "فريقنا",
    "goal": "هدفنا",
    "vision": "رؤيتنا",
    "skip": "تخطى",
    "back": "رجوع",
    "start": "بدأ"
  },
  "ContactAdmin": {
    "appbar": "تواصل معنا",
    "headerText": "يمكنك التواصل مع الدعم الفني لإيجاد حل لمشكلتك",
    "contactAdmin": "تواصل مع المشرف",
    "message": "رسالتك",
    "button": "ارسل",
    "or": "او"
  },
  "carPage": {
    "appbar": "سيارتي",
    "knockSensor": "مستشعر الصدمات",
    "waterSensor": "مستشعر المياه",
    "TempSensor": "مستشعر الحرارة"
  },
  "knockSensorPage": {
    "title": "مستشعر الصدمات",
    "subtitle": "خمسة جوانب لسيارتي",
    "center": "الوسط",
    "topRight": "اعلي اليمين",
    "topLeft": "اعلي اليسار",
    "bottomRight": "اسفل اليمين",
    "bottomLeft": "اسفل اليسار"
  },
  "WaterSensorPage": {
    "title": "مستشعر المياه",
    "subtitle": " جانبان لسيارتي",
    "center": "الوسط",
    "top": "اعلي السيارة",
    "bottom": "اسفل السيارة"
  },
  "TempSensorPage": {
    "title": "مستشعر الحرارة",
    "subtitle": " جانب وحيد لسيارتي"
  },
  "SensorsState": {
    "good": "علي ما يرام",
    "normal": "متوسط",
    "problem": " مشكلة"
  },
  "Drawer": {
    "profile": "حسابي",
    "car": "سيارتي",
    "location": "موقعي",
    "contact": "تواصل معنا",
    "privacyPolicy": "سياسة الخصوصية",
    "shareApp": "مشاركة التطبيق",
    "rate": "التقييم",
    "settings": "الاعدادات",
    "logout": "تسجيل الخروج"
  },
  "ratingPage": {
    "headerText": "رأيك يهمنا!",
    "title1": "لقد عملنا بجد لجعل التطبيق أفضل بالنسبة لك،",
    "title2": "ونود أن نعرف: كيف تقيم تطبيقنا؟  ",
    "submit": "ارسل",
    "later": " ربما لاحقا"
  },
  "DialogRating": "نشكرك علي تقييمنا ",
  "LogOutDialog": {
    "headerText": "هل أنت متأكد أنك تريد تسجيل الخروج؟",
    "yes": "نعم",
    "no": "لا"
  },
  "NotificationsPage": {
    "appbar": "الاشعارات",
    "title": " هناك مشكلة في مستشعر الحرارة"
  }
};
static const Map<String,dynamic> _en = {
  "Authentication": {
    "appbar": "Welcome Back !",
    "email": "Email",
    "password": "Password",
    "phoneNumber": "Phone Number",
    "forgotPassword": "Forgot Password",
    "tryAnotherWay": "Try Another Way",
    "resetPassword": "Reset Password",
    "changePassword": "Change Password",
    "newPassword": "New Password",
    "confirmPassword": "Confirm Password",
    "login": "Login",
    "sendCode": "Send Code",
    "confirm": "Confirm"
  },
  "onBoarding": {
    "team": "Team",
    "goal": "Goal",
    "vision": "Vision",
    "skip": "Skip",
    "back": "Back",
    "start": "Start"
  },
  "ContactAdmin": {
    "appbar": "Contact Us",
    "headerText": "You can contact technical support to find a solution to your problem",
    "contactAdmin": "Contact the Admin",
    "message": "Your Message",
    "button": "Send",
    "or": "or"
  },
  "carPage": {
    "appbar": "My Car",
    "knockSensor": "Knock Sensor",
    "waterSensor": "Water Sensor",
    "TempSensor": "Temperature Sensor"
  },
  "knockSensorPage": {
    "title": "Knock Sensor",
    "subtitle": "Five sides of my car",
    "center": "Center",
    "topRight": "Top Right",
    "topLeft": "Top Left",
    "bottomRight": "Bottom Right",
    "bottomLeft": "Bottom Left"
  },
  "WaterSensorPage": {
    "title": "Water Sensor",
    "subtitle": "Two sides of my car",
    "center": "Center",
    "top": "Top of the Car",
    "bottom": "Bottom of the Car"
  },
  "TempSensorPage": {
    "title": "Temperature Sensor",
    "subtitle": "Only one side of my car"
  },
  "SensorsState": {
    "good": "All is Well",
    "normal": "normal",
    "problem": "Problem"
  },
  "Drawer": {
    "profile": "My Account",
    "car": "My Car",
    "location": "My Location",
    "contact": "Contact Us",
    "privacyPolicy": "Privacy Policy",
    "shareApp": "Share App",
    "rate": "Rate Us",
    "settings": "Settings",
    "logout": "Logout"
  },
  "ratingPage": {
    "headerText": "Your opinion matters to us!",
    "title1": "We have worked hard to make the app better for you,",
    "title2": "and we would like to know: How do you rate our app?",
    "submit": "submit",
    "later": "Maybe Later"
  },
  "DialogRating": "Thank you for rating us",
  "LogOutDialog": {
    "headerText": "Are you sure you want to log out?",
    "yes": "Yes",
    "no": "No"
  },
  "NotificationsPage": {
    "appbar": "Notifications",
    "title": "There is a problem with the temperature sensor"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
