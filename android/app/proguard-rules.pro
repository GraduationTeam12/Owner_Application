# Keep classes for Dio & OkHttp
-keep class okhttp3.** { *; }
-dontwarn okhttp3.**

# Keep classes for Gson (لو بتستخدمه)
-keep class com.google.gson.** { *; }
-dontwarn com.google.gson.**

# لو بتستخدم retrofit
-keep class retrofit2.** { *; }
-dontwarn retrofit2.**

# لو بتستخدم Firebase
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**

-keep class android.content.SharedPreferences { *; }
-keep class android.preference.PreferenceManager { *; }

-keep class com.google.android.gms.maps.** { *; }
-keep interface com.google.android.gms.maps.** { *; }
-dontwarn com.google.android.gms.maps.**


