import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_mg.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr'),
    Locale('ko'),
    Locale('mg'),
    Locale('zh'),
  ];

  /// No description provided for @continu.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continu;

  /// No description provided for @hello_word.
  ///
  /// In en, this message translates to:
  /// **'Hello World'**
  String get hello_word;

  /// No description provided for @choose_lang.
  ///
  /// In en, this message translates to:
  /// **'Choose a language'**
  String get choose_lang;

  /// No description provided for @select_lang.
  ///
  /// In en, this message translates to:
  /// **'Select a language'**
  String get select_lang;

  /// No description provided for @job_offers.
  ///
  /// In en, this message translates to:
  /// **'Job offers'**
  String get job_offers;

  /// No description provided for @job_applicants.
  ///
  /// In en, this message translates to:
  /// **'Job applicants'**
  String get job_applicants;

  /// No description provided for @training_centers.
  ///
  /// In en, this message translates to:
  /// **'Training centers'**
  String get training_centers;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @zone.
  ///
  /// In en, this message translates to:
  /// **'Zone'**
  String get zone;

  /// No description provided for @view_more.
  ///
  /// In en, this message translates to:
  /// **'View more'**
  String get view_more;

  /// No description provided for @now.
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get now;

  /// No description provided for @jobs.
  ///
  /// In en, this message translates to:
  /// **'Jobs'**
  String get jobs;

  /// No description provided for @post.
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get post;

  /// No description provided for @my_post.
  ///
  /// In en, this message translates to:
  /// **'My posts'**
  String get my_post;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @profession.
  ///
  /// In en, this message translates to:
  /// **'Profession'**
  String get profession;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @actualities.
  ///
  /// In en, this message translates to:
  /// **'Actualities'**
  String get actualities;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @hot.
  ///
  /// In en, this message translates to:
  /// **'Hot'**
  String get hot;

  /// No description provided for @event.
  ///
  /// In en, this message translates to:
  /// **'Event'**
  String get event;

  /// No description provided for @recent.
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get recent;

  /// No description provided for @sign_in.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get sign_in;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @please_sign_in_exist_account.
  ///
  /// In en, this message translates to:
  /// **'Please sign in to your existing account'**
  String get please_sign_in_exist_account;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @remember_me.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get remember_me;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot password'**
  String get forgot_password;

  /// No description provided for @dont_have_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account ?'**
  String get dont_have_account;

  /// No description provided for @sign_up.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get sign_up;

  /// No description provided for @please_contact_to_reset_password.
  ///
  /// In en, this message translates to:
  /// **'Please contact us via phone or email to help you reset your password'**
  String get please_contact_to_reset_password;

  /// No description provided for @via_phone.
  ///
  /// In en, this message translates to:
  /// **'Via phone'**
  String get via_phone;

  /// No description provided for @via_email.
  ///
  /// In en, this message translates to:
  /// **'Via email'**
  String get via_email;

  /// No description provided for @call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get call;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @please_sign_in_to_start.
  ///
  /// In en, this message translates to:
  /// **'Please sign up to get started'**
  String get please_sign_in_to_start;

  /// No description provided for @first_name.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get first_name;

  /// No description provided for @last_name.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get last_name;

  /// No description provided for @email_optional.
  ///
  /// In en, this message translates to:
  /// **'Email (Optional)'**
  String get email_optional;

  /// No description provided for @birth_date.
  ///
  /// In en, this message translates to:
  /// **'Birth date'**
  String get birth_date;

  /// No description provided for @residence.
  ///
  /// In en, this message translates to:
  /// **'Residence'**
  String get residence;

  /// No description provided for @select_residence.
  ///
  /// In en, this message translates to:
  /// **'Select a residence'**
  String get select_residence;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @select_gender.
  ///
  /// In en, this message translates to:
  /// **'Select a gender'**
  String get select_gender;

  /// No description provided for @retype_password.
  ///
  /// In en, this message translates to:
  /// **'Re-type password'**
  String get retype_password;

  /// No description provided for @agree_terms_use.
  ///
  /// In en, this message translates to:
  /// **'I agree with Terms Of Use'**
  String get agree_terms_use;

  /// No description provided for @already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account ?'**
  String get already_have_account;

  /// No description provided for @personal_info.
  ///
  /// In en, this message translates to:
  /// **'Personal info'**
  String get personal_info;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @change_password.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get change_password;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @full_name.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get full_name;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phone_number;

  /// No description provided for @choose_gallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from gallery'**
  String get choose_gallery;

  /// No description provided for @take_photo.
  ///
  /// In en, this message translates to:
  /// **'Take a photo'**
  String get take_photo;

  /// No description provided for @edit_profile.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get edit_profile;

  /// No description provided for @available_balance.
  ///
  /// In en, this message translates to:
  /// **'Available balance'**
  String get available_balance;

  /// No description provided for @transfer.
  ///
  /// In en, this message translates to:
  /// **'Transfer'**
  String get transfer;

  /// No description provided for @kara_usage_history.
  ///
  /// In en, this message translates to:
  /// **'Kara usage history'**
  String get kara_usage_history;

  /// No description provided for @create_new_secure_password.
  ///
  /// In en, this message translates to:
  /// **'Create a new secure password'**
  String get create_new_secure_password;

  /// No description provided for @old_password.
  ///
  /// In en, this message translates to:
  /// **'Old password'**
  String get old_password;

  /// No description provided for @new_password.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get new_password;

  /// No description provided for @update_password.
  ///
  /// In en, this message translates to:
  /// **'Update password'**
  String get update_password;

  /// No description provided for @logout_question.
  ///
  /// In en, this message translates to:
  /// **'Logout ?'**
  String get logout_question;

  /// No description provided for @really_want_logout.
  ///
  /// In en, this message translates to:
  /// **'Do you really want to logout ?'**
  String get really_want_logout;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @hots.
  ///
  /// In en, this message translates to:
  /// **'Hots'**
  String get hots;

  /// No description provided for @events.
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get events;

  /// No description provided for @job_offer.
  ///
  /// In en, this message translates to:
  /// **'Job offer'**
  String get job_offer;

  /// No description provided for @create_job_offer.
  ///
  /// In en, this message translates to:
  /// **'Create a new job offer to find the best candidates for your company'**
  String get create_job_offer;

  /// No description provided for @job_applicant.
  ///
  /// In en, this message translates to:
  /// **'Job applicant'**
  String get job_applicant;

  /// No description provided for @create_job_applicant.
  ///
  /// In en, this message translates to:
  /// **'Create an applicant profile to apply for jobs that match your skills'**
  String get create_job_applicant;

  /// No description provided for @training_center.
  ///
  /// In en, this message translates to:
  /// **'Training center'**
  String get training_center;

  /// No description provided for @register_training_center.
  ///
  /// In en, this message translates to:
  /// **'Register your training center to offer courses and build skills'**
  String get register_training_center;

  /// No description provided for @expert_executive.
  ///
  /// In en, this message translates to:
  /// **'Expert and executive'**
  String get expert_executive;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @post_job_offer.
  ///
  /// In en, this message translates to:
  /// **'Post a job offer'**
  String get post_job_offer;

  /// No description provided for @job_title.
  ///
  /// In en, this message translates to:
  /// **'Job title'**
  String get job_title;

  /// No description provided for @add_job_title.
  ///
  /// In en, this message translates to:
  /// **'Add job title'**
  String get add_job_title;

  /// No description provided for @photo.
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get photo;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @add_description.
  ///
  /// In en, this message translates to:
  /// **'Add description'**
  String get add_description;

  /// No description provided for @category_3_max.
  ///
  /// In en, this message translates to:
  /// **'Category * (3 max)'**
  String get category_3_max;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @actor.
  ///
  /// In en, this message translates to:
  /// **'Actor'**
  String get actor;

  /// No description provided for @post_features.
  ///
  /// In en, this message translates to:
  /// **'Post features'**
  String get post_features;

  /// No description provided for @applicant_deadline.
  ///
  /// In en, this message translates to:
  /// **'Application deadline'**
  String get applicant_deadline;

  /// No description provided for @select_date.
  ///
  /// In en, this message translates to:
  /// **'Select date'**
  String get select_date;

  /// No description provided for @please_fill_fields.
  ///
  /// In en, this message translates to:
  /// **'Please fill all required fields'**
  String get please_fill_fields;

  /// No description provided for @motivation.
  ///
  /// In en, this message translates to:
  /// **'Motivation'**
  String get motivation;

  /// No description provided for @add_motivation.
  ///
  /// In en, this message translates to:
  /// **'Add motivation'**
  String get add_motivation;

  /// No description provided for @resume_optional.
  ///
  /// In en, this message translates to:
  /// **'Resume (optional)'**
  String get resume_optional;

  /// No description provided for @upload.
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get upload;

  /// No description provided for @upload_resume_pdf.
  ///
  /// In en, this message translates to:
  /// **'Upload your resume in PDF format and let members look at it.'**
  String get upload_resume_pdf;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @center_name.
  ///
  /// In en, this message translates to:
  /// **'Center name'**
  String get center_name;

  /// No description provided for @add_center_name.
  ///
  /// In en, this message translates to:
  /// **'Add center name'**
  String get add_center_name;

  /// No description provided for @default_value.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get default_value;

  /// No description provided for @upload_5_photos.
  ///
  /// In en, this message translates to:
  /// **'You can upload up to 5 photos'**
  String get upload_5_photos;

  /// No description provided for @more_description.
  ///
  /// In en, this message translates to:
  /// **'More description'**
  String get more_description;

  /// No description provided for @add_more_description.
  ///
  /// In en, this message translates to:
  /// **'Add more description'**
  String get add_more_description;

  /// No description provided for @domain_5_max.
  ///
  /// In en, this message translates to:
  /// **'Domain * (5 max)'**
  String get domain_5_max;

  /// No description provided for @post_job_applicant.
  ///
  /// In en, this message translates to:
  /// **'Post a job applicant'**
  String get post_job_applicant;

  /// No description provided for @post_training_center.
  ///
  /// In en, this message translates to:
  /// **'Post a training center'**
  String get post_training_center;

  /// No description provided for @post_expert_executive.
  ///
  /// In en, this message translates to:
  /// **'Post an expert and executive'**
  String get post_expert_executive;

  /// No description provided for @notice.
  ///
  /// In en, this message translates to:
  /// **'Notice'**
  String get notice;

  /// No description provided for @notice_expert_executive.
  ///
  /// In en, this message translates to:
  /// **'To post as an Expert or Executive, you need an active subscription. Subscribe now to unlock the ability to create and publish your professional profile and reach potential clients and employers.'**
  String get notice_expert_executive;

  /// No description provided for @subscribe.
  ///
  /// In en, this message translates to:
  /// **'Subscribe'**
  String get subscribe;

  /// No description provided for @subscribe_expert_executive.
  ///
  /// In en, this message translates to:
  /// **'Subscribe to expert and executive'**
  String get subscribe_expert_executive;

  /// No description provided for @add_first_name.
  ///
  /// In en, this message translates to:
  /// **'Add your first name'**
  String get add_first_name;

  /// No description provided for @add_last_name.
  ///
  /// In en, this message translates to:
  /// **'Add your last name'**
  String get add_last_name;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @add_address.
  ///
  /// In en, this message translates to:
  /// **'Add your address'**
  String get add_address;

  /// No description provided for @professional_domain.
  ///
  /// In en, this message translates to:
  /// **'Professional domain'**
  String get professional_domain;

  /// No description provided for @brief_presentation.
  ///
  /// In en, this message translates to:
  /// **'Brief presentation'**
  String get brief_presentation;

  /// No description provided for @add_brief_presentation.
  ///
  /// In en, this message translates to:
  /// **'Add a brief presentation'**
  String get add_brief_presentation;

  /// No description provided for @subscription_needs.
  ///
  /// In en, this message translates to:
  /// **'Subscription needs'**
  String get subscription_needs;

  /// No description provided for @select_language.
  ///
  /// In en, this message translates to:
  /// **'Select a language'**
  String get select_language;

  /// No description provided for @terms_use.
  ///
  /// In en, this message translates to:
  /// **'Terms of use'**
  String get terms_use;

  /// No description provided for @job_offer_detail.
  ///
  /// In en, this message translates to:
  /// **'Job offer detail'**
  String get job_offer_detail;

  /// No description provided for @job_applicant_detail.
  ///
  /// In en, this message translates to:
  /// **'Job applicant detail'**
  String get job_applicant_detail;

  /// No description provided for @training_center_detail.
  ///
  /// In en, this message translates to:
  /// **'Training center detail'**
  String get training_center_detail;

  /// No description provided for @hot_detail.
  ///
  /// In en, this message translates to:
  /// **'Hot detail'**
  String get hot_detail;

  /// No description provided for @event_detail.
  ///
  /// In en, this message translates to:
  /// **'Event detail'**
  String get event_detail;

  /// No description provided for @deadline.
  ///
  /// In en, this message translates to:
  /// **'Deadline'**
  String get deadline;

  /// No description provided for @posted.
  ///
  /// In en, this message translates to:
  /// **'Posted'**
  String get posted;

  /// No description provided for @job_features.
  ///
  /// In en, this message translates to:
  /// **'Job features'**
  String get job_features;

  /// No description provided for @about_client.
  ///
  /// In en, this message translates to:
  /// **'About the client'**
  String get about_client;

  /// No description provided for @verified_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Verified phone number'**
  String get verified_phone_number;

  /// No description provided for @member_since.
  ///
  /// In en, this message translates to:
  /// **'Member since'**
  String get member_since;

  /// No description provided for @job_features_preference.
  ///
  /// In en, this message translates to:
  /// **'Job features preference'**
  String get job_features_preference;

  /// No description provided for @about_applicant.
  ///
  /// In en, this message translates to:
  /// **'About the applicant'**
  String get about_applicant;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @end.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get end;

  /// No description provided for @view_center.
  ///
  /// In en, this message translates to:
  /// **'View center'**
  String get view_center;

  /// No description provided for @make_an_offer.
  ///
  /// In en, this message translates to:
  /// **'Make an offer'**
  String get make_an_offer;

  /// No description provided for @training_center_features.
  ///
  /// In en, this message translates to:
  /// **'Training center features'**
  String get training_center_features;

  /// No description provided for @about_center_publisher.
  ///
  /// In en, this message translates to:
  /// **'About the center publisher'**
  String get about_center_publisher;

  /// No description provided for @hot_offer.
  ///
  /// In en, this message translates to:
  /// **'Hot offer'**
  String get hot_offer;

  /// No description provided for @create_hot_offer.
  ///
  /// In en, this message translates to:
  /// **'Create an hot offer for less duration'**
  String get create_hot_offer;

  /// No description provided for @event_offer.
  ///
  /// In en, this message translates to:
  /// **'Event offer'**
  String get event_offer;

  /// No description provided for @create_event_offer.
  ///
  /// In en, this message translates to:
  /// **'Create an event offer for a long duration'**
  String get create_event_offer;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @add_title.
  ///
  /// In en, this message translates to:
  /// **'Add title'**
  String get add_title;

  /// No description provided for @start_offer.
  ///
  /// In en, this message translates to:
  /// **'Start of the offer'**
  String get start_offer;

  /// No description provided for @end_offer.
  ///
  /// In en, this message translates to:
  /// **'End of the offer'**
  String get end_offer;

  /// No description provided for @post_hot.
  ///
  /// In en, this message translates to:
  /// **'Post an hot'**
  String get post_hot;

  /// No description provided for @post_event.
  ///
  /// In en, this message translates to:
  /// **'Post an event'**
  String get post_event;

  /// No description provided for @one_minute.
  ///
  /// In en, this message translates to:
  /// **'1 minute'**
  String get one_minute;

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **'Minutes'**
  String get minutes;

  /// No description provided for @one_hour.
  ///
  /// In en, this message translates to:
  /// **'1 hour'**
  String get one_hour;

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **'Hours'**
  String get hours;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get days;

  /// No description provided for @one_week.
  ///
  /// In en, this message translates to:
  /// **'1 week'**
  String get one_week;

  /// No description provided for @weeks.
  ///
  /// In en, this message translates to:
  /// **'Weeks'**
  String get weeks;

  /// No description provided for @one_month.
  ///
  /// In en, this message translates to:
  /// **'1 month'**
  String get one_month;

  /// No description provided for @months.
  ///
  /// In en, this message translates to:
  /// **'Months'**
  String get months;

  /// No description provided for @one_year.
  ///
  /// In en, this message translates to:
  /// **'1 year'**
  String get one_year;

  /// No description provided for @years.
  ///
  /// In en, this message translates to:
  /// **'Years'**
  String get years;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @remove_photo.
  ///
  /// In en, this message translates to:
  /// **'Remove photo'**
  String get remove_photo;

  /// No description provided for @resume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get resume;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @domain.
  ///
  /// In en, this message translates to:
  /// **'Domain'**
  String get domain;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @edit_question.
  ///
  /// In en, this message translates to:
  /// **'Edit ?'**
  String get edit_question;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @remove_question.
  ///
  /// In en, this message translates to:
  /// **'Remove ?'**
  String get remove_question;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @view_pdf.
  ///
  /// In en, this message translates to:
  /// **'View PDF'**
  String get view_pdf;

  /// No description provided for @edit_offer.
  ///
  /// In en, this message translates to:
  /// **'Edit offer'**
  String get edit_offer;

  /// No description provided for @edit_job_offer.
  ///
  /// In en, this message translates to:
  /// **'Edit job offer'**
  String get edit_job_offer;

  /// No description provided for @edit_job_applicant.
  ///
  /// In en, this message translates to:
  /// **'Edit job applicant'**
  String get edit_job_applicant;

  /// No description provided for @edit_training_center.
  ///
  /// In en, this message translates to:
  /// **'Edit training center'**
  String get edit_training_center;

  /// No description provided for @edit_job_offer_question.
  ///
  /// In en, this message translates to:
  /// **'Do you want to edit this job offer ?'**
  String get edit_job_offer_question;

  /// No description provided for @edit_job_applicant_question.
  ///
  /// In en, this message translates to:
  /// **'Do you want to edit this job applicant ?'**
  String get edit_job_applicant_question;

  /// No description provided for @edit_training_center_qestion.
  ///
  /// In en, this message translates to:
  /// **'Do you want to edit this training center ?'**
  String get edit_training_center_qestion;

  /// No description provided for @edit_offer_qestion.
  ///
  /// In en, this message translates to:
  /// **'Do you want to edit this offer ?'**
  String get edit_offer_qestion;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @service_unavailable.
  ///
  /// In en, this message translates to:
  /// **'Service unavailable'**
  String get service_unavailable;

  /// No description provided for @not_found.
  ///
  /// In en, this message translates to:
  /// **'Not found'**
  String get not_found;

  /// No description provided for @page_failed_load.
  ///
  /// In en, this message translates to:
  /// **'Page failed to load'**
  String get page_failed_load;

  /// No description provided for @please_check_connection_before_trying.
  ///
  /// In en, this message translates to:
  /// **'Please check your connection before trying again'**
  String get please_check_connection_before_trying;

  /// No description provided for @agree_with.
  ///
  /// In en, this message translates to:
  /// **'I agree with'**
  String get agree_with;

  /// No description provided for @max_3.
  ///
  /// In en, this message translates to:
  /// **'3 max'**
  String get max_3;

  /// No description provided for @max_5.
  ///
  /// In en, this message translates to:
  /// **'5 max'**
  String get max_5;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get email;

  /// No description provided for @remove_job_offer_question.
  ///
  /// In en, this message translates to:
  /// **'Do you want to remove this job offer ?'**
  String get remove_job_offer_question;

  /// No description provided for @remove_job_applicant_question.
  ///
  /// In en, this message translates to:
  /// **'Do you want to remove this job applicant ?'**
  String get remove_job_applicant_question;

  /// No description provided for @remove_training_center_question.
  ///
  /// In en, this message translates to:
  /// **'Do you want to remove this training ?'**
  String get remove_training_center_question;

  /// No description provided for @remove_offer_question.
  ///
  /// In en, this message translates to:
  /// **'Do you want to remove this offer ?'**
  String get remove_offer_question;

  /// No description provided for @remove_history_question.
  ///
  /// In en, this message translates to:
  /// **'Do you want to remove this history ?'**
  String get remove_history_question;

  /// No description provided for @server_under_maintenance.
  ///
  /// In en, this message translates to:
  /// **'The server is under maintenance or encountered an error. Please try again later.'**
  String get server_under_maintenance;

  /// No description provided for @no_enough_kara.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have enough Kara'**
  String get no_enough_kara;

  /// No description provided for @phone_already_exists.
  ///
  /// In en, this message translates to:
  /// **'The phone number already exists.'**
  String get phone_already_exists;

  /// No description provided for @domains.
  ///
  /// In en, this message translates to:
  /// **'Domains'**
  String get domains;

  /// No description provided for @deadline_must_be_today_or_future.
  ///
  /// In en, this message translates to:
  /// **'The deadline must be today or a future date.'**
  String get deadline_must_be_today_or_future;

  /// No description provided for @phone_number_cannot_be_changed.
  ///
  /// In en, this message translates to:
  /// **'Phone number cannot be changed'**
  String get phone_number_cannot_be_changed;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr', 'ko', 'mg', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
    case 'ko':
      return AppLocalizationsKo();
    case 'mg':
      return AppLocalizationsMg();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
