import java.util.Properties
import java.io.FileInputStream
import java.util.Date
import java.text.SimpleDateFormat

plugins {
    id("com.android.application")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

fun getVersionCodeTimestamp(): Int {
    val date = Date()
    val formatter = SimpleDateFormat("yyMMddHH")
    val formattedDate = formatter.format(date)
    val code = formattedDate.toInt()
    println("VersionCode: $code")
    return code
}

// val agpMajor = com.android.Version.ANDROID_GRADLE_PLUGIN_VERSION.substringBefore('.').toInt()

// if (agpMajor < 9) {
//   apply(plugin = "org.jetbrains.kotlin.android")
// }

base {
    archivesName.set("KIANJA_v${flutter.versionName}-${getVersionCodeTimestamp()}")
}

android {
    namespace = "com.mundolucia.kianja"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    

    kotlin {
        compilerOptions {
            jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
        }
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.mundolucia.kianja"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        // versionCode = flutter.versionCode
        versionCode = getVersionCodeTimestamp()
        versionName = flutter.versionName
        // setProperty("archivesBaseName", "KIANJA_v${versionName}-${versionCode}")
        // archivesName.set("KIANJA_v${flutter.versionName}-${getVersionCodeTimestamp()}")
    }

    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties["keyAlias"] as String
            keyPassword = keystoreProperties["keyPassword"] as String
            storeFile = keystoreProperties["storeFile"]?.let { file(it) }
            storePassword = keystoreProperties["storePassword"] as String
        }
    }

    buildTypes {
        release {
            // Enables code-related app optimization.
            isMinifyEnabled = true

            // Enables resource shrinking.
            isShrinkResources = true

            proguardFiles(
                // Default file with automatically generated optimization rules.
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )

            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now,
            // so `flutter run --release` works.
            // signingConfig = signingConfigs.getByName("debug")
            signingConfig = signingConfigs.getByName("release")
        }
    }
}

project.extensions.configure(org.jetbrains.kotlin.gradle.dsl.KotlinAndroidProjectExtension::class.java) {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}
