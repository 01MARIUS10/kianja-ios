import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/app_feature/bloc/app/app_bloc.dart';
import 'package:kianja/core/shared/app_feature/presentation/modify_app_lang_screen.dart';
import 'package:kianja/core/shared/widgets/photos/photo_viewer_screen.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/features/about/presentation/pages/about_screen.dart';
import 'package:kianja/features/account/presentation/pages/account_screen.dart';
import 'package:kianja/features/account/presentation/pages/change_password/change_password_screen.dart';
import 'package:kianja/features/account/presentation/pages/personal_info/personal_info_screen.dart';
import 'package:kianja/features/account/presentation/pages/personal_info/update_personal_info_screen.dart';
import 'package:kianja/features/account/presentation/pages/terms_of_use/terms_of_use_screen.dart';
import 'package:kianja/features/account/presentation/pages/wallet/wallet_screen.dart';
import 'package:kianja/features/auth/presentation/pages/signin_screen.dart';
import 'package:kianja/features/auth/presentation/pages/signup_screen.dart';
import 'package:kianja/features/choose_lang/presentation/pages/choose_lang_screen.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/jobs/domain/entities/training/hot_event.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';
import 'package:kianja/features/jobs/presentation/pages/details/hot_event_detail_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/details/job_applicant_detail_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/details/job_applicant_view_pdf_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/details/job_offer_detail_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/details/training_center_detail.dart';
import 'package:kianja/features/jobs/presentation/pages/jobs_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/post/hot_event/create_hot_event_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/post/hot_event/post_hot_event_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/post/post_experts_executives_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/post/post_job_applicant_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/post/post_job_offer_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/post/post_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/post/post_training_center_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/post/subscribe_experts_executives_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/post/successful/post_executive_successful_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/post/successful/post_hot_event_successful_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/post/successful/post_job_applicant_successful_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/post/successful/post_job_offer_successful_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/post/successful/post_training_successful_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/training_center/training_center_category_view_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/view_all/job_applicants_view_all_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/view_all/job_category_view_all_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/view_all/training_center_hot_event_view_all_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/view_all/training_center_view_all_screen.dart';
import 'package:kianja/features/my_post/presentation/pages/edit/my_post_hot_event_edit.dart';
import 'package:kianja/features/my_post/presentation/pages/edit/my_post_job_applicant_edit.dart';
import 'package:kianja/features/my_post/presentation/pages/edit/my_post_job_offer_edit.dart';
import 'package:kianja/features/my_post/presentation/pages/edit/my_post_training_center_edit.dart';
import 'package:kianja/features/my_post/presentation/pages/my_post_screen.dart';
import 'package:kianja/routing/navigation/navigation.dart';
import 'package:kianja/routing/routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _rootNavigatorPostKey = GlobalKey<NavigatorState>();
final _shellNavigatorJobsKey = GlobalKey<NavigatorState>();
final _shellNavigatorMyPostKey = GlobalKey<NavigatorState>();
final _shellNavigatorAccountKey = GlobalKey<NavigatorState>();

abstract class AppRouter {
  static final _appBlocNotifier = _AppBlocNotifier();
  static GoRouter buildRouter(AppBloc appBloc) {
    _appBlocNotifier.update(appBloc);
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      // initialLocation: Routes.chooseLang.path,
      initialLocation: Routes.loading.path,
      debugLogDiagnostics: true,
      refreshListenable: _appBlocNotifier,
      redirect: (context, state) {
        final appState = appBloc.state;
        final isAuthenticated = appState.isAuthenticated;
        AppDebug.showPrint('AppRouter redirect');
        AppDebug.showPrint('matchedLocation: ${state.matchedLocation}');
        AppDebug.showPrint(
          'isAlreadyChosenLang: ${appState.isAlreadyChosenLang}',
        );
        AppDebug.showPrint('isAuthenticated: $isAuthenticated');

        // While the app is still initializing, stay on the /loading route.
        // The native splash screen covers it — no UI is visible yet.
        if (appState.appInitStatus != AppInitStatus.loaded) {
          return null;
        }

        // App is ready. Dispatch from the loading route to the correct screen.
        // This runs before the native splash is removed, so there is no flash.
        if (state.matchedLocation == Routes.loading.path) {
          return appState.isAlreadyChosenLang
              ? Routes.jobs.path
              : Routes.chooseLang.path;
        }

        // Guard protected routes that require authentication.
        if (state.matchedLocation == Routes.chooseLang.path &&
            appState.isAlreadyChosenLang == true) {
          return Routes.jobs.path;
        }
        if (state.matchedLocation == Routes.myPost.path &&
            isAuthenticated == false) {
          return Routes.signIn.path;
        }
        if (state.matchedLocation == Routes.post.path &&
            isAuthenticated == false) {
          return Routes.signIn.path;
        }
        if (state.matchedLocation == Routes.account.path &&
            isAuthenticated == false) {
          return Routes.signIn.path;
        }

        return null;
      },
      routes: [
        // ================= LOADING (initial, hidden under native splash) =====
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          name: Routes.loading.name,
          path: Routes.loading.path,
          builder: (context, state) => const SizedBox.shrink(),
        ),
        // ================= CHOOSE LANG =================
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          name: Routes.chooseLang.name,
          path: Routes.chooseLang.path,
          builder: (context, state) {
            return const ChooseLangScreen();
          },
        ),
        // ================= CHOOSE LANG =================

        // ================= NAVIGATION (SHELL) =================
        StatefulShellRoute.indexedStack(
          parentNavigatorKey: _rootNavigatorKey,
          branches: [
            // Jobs branch
            StatefulShellBranch(
              navigatorKey: _shellNavigatorJobsKey,
              routes: [
                GoRoute(
                  name: Routes.jobs.name,
                  path: Routes.jobs.path,
                  builder: (context, state) {
                    return const JobsScreen();
                  },
                  routes: [
                    GoRoute(
                      name: Routes.about.name,
                      path: Routes.about.path,
                      builder: (context, state) {
                        return const AboutScreen();
                      },
                    ),
                    GoRoute(
                      name: Routes.modifyAppLang.name,
                      path: Routes.modifyAppLang.path,
                      builder: (context, state) {
                        return const ModifyAppLangScreen();
                      },
                    ),
                    GoRoute(
                      name: Routes.jobOfferDetail.name,
                      path: Routes.jobOfferDetail.path,
                      builder: (context, state) {
                        final params = state.pathParameters;
                        return JobOfferDetailScreen(
                          id: int.parse(params['id'] ?? '0'),
                        );
                      },
                    ),
                    GoRoute(
                      name: Routes.jobCategoryViewAll.name,
                      path: Routes.jobCategoryViewAll.path,
                      builder: (context, state) {
                        final extra = state.extra as Map<String, String>? ?? {};
                        AppDebug.showPrint('title ${extra['title']}');
                        AppDebug.showPrint('query ${extra['query']}');
                        return JobCategoryViewAllScreen(
                          title: extra['title'] ?? '',
                          query: extra['query'] ?? '',
                        );
                      },
                    ),
                    GoRoute(
                      name: Routes.jobApplicantDetail.name,
                      path: Routes.jobApplicantDetail.path,
                      builder: (context, state) {
                        final params = state.pathParameters;
                        return JobApplicantDetailScreen(
                          id: int.parse(params['id'] ?? '0'),
                        );
                      },
                      routes: [
                        GoRoute(
                          parentNavigatorKey: _rootNavigatorKey,
                          name: Routes.jobApplicantViewPdf.name,
                          path: Routes.jobApplicantViewPdf.path,
                          builder: (context, state) {
                            final extra =
                                state.extra as Map<String, String>? ?? {};
                            return JobApplicantViewPdfScreen(
                              pdfUrl: extra['pdfUrl'] ?? '',
                            );
                          },
                        ),
                      ],
                    ),
                    GoRoute(
                      name: Routes.jobApplicantViewAll.name,
                      path: Routes.jobApplicantViewAll.path,
                      builder: (context, state) {
                        final extra = state.extra as Map<String, String>? ?? {};
                        AppDebug.showPrint('title ${extra['title']}');
                        AppDebug.showPrint('query ${extra['query']}');
                        return JobApplicantsViewAllScreen(
                          title: extra['title'] ?? '',
                          query: extra['query'] ?? '',
                        );
                      },
                    ),
                    GoRoute(
                      name: Routes.trainingCenterHotEventDetail.name,
                      path: Routes.trainingCenterHotEventDetail.path,
                      builder: (context, state) {
                        final params = state.pathParameters;
                        final extra = state.extra as Map<String, String>? ?? {};
                        return HotEventDetailScreen(
                          id: int.parse(params['id'] ?? '0'),
                          name: extra['category'] ?? '',
                          query: extra['query'] ?? '',
                        );
                      },
                    ),
                    GoRoute(
                      name: Routes.trainingCenterDetail.name,
                      path: Routes.trainingCenterDetail.path,
                      builder: (context, state) {
                        final params = state.pathParameters;
                        return TrainingCenterDetail(
                          id: int.parse(params['trainingCenterId'] ?? '0'),
                        );
                      },
                      routes: [
                        GoRoute(
                          parentNavigatorKey: _rootNavigatorKey,
                          name: Routes.photoViewer.name,
                          path: Routes.photoViewer.path,
                          builder: (context, state) {
                            final extra =
                                state.extra as Map<String, dynamic>? ?? {};
                            return PhotoViewerScreen(
                              imageUrls:
                                  extra['imageUrls'] as List<String>? ?? [],
                              initialIndex:
                                  int.tryParse(extra['initialIndex'] ?? '0') ??
                                  0,
                            );
                          },
                        ),
                        GoRoute(
                          name: Routes.postHotEvent.name,
                          path: Routes.postHotEvent.path,
                          builder: (context, state) {
                            final params = state.pathParameters;
                            return PostHotEventScreen(
                              trainingCenterId: int.parse(
                                params['trainingCenterId'] ?? '0',
                              ),
                            );
                          },
                          routes: [
                            GoRoute(
                              name: Routes.createHotEvent.name,
                              path: Routes.createHotEvent.path,
                              builder: (context, state) {
                                final extra =
                                    state.extra as Map<String, dynamic>? ?? {};
                                final params = state.pathParameters;
                                return CreateHotEventScreen(
                                  trainingCenterId: int.parse(
                                    params['trainingCenterId'] ?? '0',
                                  ),
                                  type: extra['type'] ?? '',
                                );
                              },
                              routes: [
                                GoRoute(
                                  name: Routes.createHotEventSuccessful.name,
                                  path: Routes.createHotEventSuccessful.path,
                                  builder: (context, state) {
                                    final params = state.pathParameters;
                                    return PostHotEventSuccessfulScreen(
                                      id: int.parse(params['id'] ?? '0'),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    GoRoute(
                      name: Routes.trainingCenterHotEventViewAll.name,
                      path: Routes.trainingCenterHotEventViewAll.path,
                      builder: (context, state) {
                        final extra = state.extra as Map<String, String>? ?? {};
                        AppDebug.showPrint('title ${extra['title']}');
                        AppDebug.showPrint('query ${extra['query']}');
                        return TrainingCenterHotEventViewAllScreen(
                          title: extra['title'] ?? '',
                          query: extra['query'] ?? '',
                        );
                      },
                    ),
                    GoRoute(
                      name: Routes.trainingCenterViewAll.name,
                      path: Routes.trainingCenterViewAll.path,
                      builder: (context, state) {
                        final extra = state.extra as Map<String, String>? ?? {};
                        AppDebug.showPrint('title ${extra['title']}');
                        AppDebug.showPrint('query ${extra['query']}');
                        return TrainingCenterViewAllScreen(
                          title: extra['title'] ?? '',
                          query: extra['query'] ?? '',
                        );
                      },
                    ),
                    GoRoute(
                      name: Routes.trainingCenterViewCategory.name,
                      path: Routes.trainingCenterViewCategory.path,
                      builder: (context, state) {
                        final params = state.pathParameters;
                        final extra = state.extra as Map<String, String>? ?? {};
                        return TrainingCenterCategoryViewScreen(
                          id: int.parse(params['id'] ?? '0'),
                          category: extra['category'] ?? '',
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            // Post branch
            StatefulShellBranch(
              navigatorKey: _rootNavigatorPostKey,
              routes: [
                GoRoute(
                  name: Routes.post.name,
                  path: Routes.post.path,
                  builder: (context, state) {
                    return const PostScreen();
                  },
                  routes: [
                    GoRoute(
                      name: Routes.postJobApplicant.name,
                      path: Routes.postJobApplicant.path,
                      builder: (context, state) {
                        return const PostJobApplicantScreen();
                      },
                      routes: [
                        GoRoute(
                          name: Routes.postJobApplicantSuccessful.name,
                          path: Routes.postJobApplicantSuccessful.path,
                          builder: (context, state) {
                            final params = state.pathParameters;
                            return PostJobApplicantSuccessfulScreen(
                              id: int.parse(params['id'] ?? '0'),
                            );
                          },
                        ),
                      ],
                    ),
                    GoRoute(
                      name: Routes.postJobOffer.name,
                      path: Routes.postJobOffer.path,
                      builder: (context, state) {
                        return const PostJobOfferScreen();
                      },
                      routes: [
                        GoRoute(
                          name: Routes.postJobOfferSuccessful.name,
                          path: Routes.postJobOfferSuccessful.path,
                          builder: (context, state) {
                            final params = state.pathParameters;
                            return PostJobOfferSuccessfulScreen(
                              id: int.parse(params['id'] ?? '0'),
                            );
                          },
                        ),
                      ],
                    ),
                    GoRoute(
                      name: Routes.postTrainingCenter.name,
                      path: Routes.postTrainingCenter.path,
                      builder: (context, state) {
                        return const PostTrainingCenterScreen();
                      },
                      routes: [
                        GoRoute(
                          name: Routes.postTrainingCenterSuccessful.name,
                          path: Routes.postTrainingCenterSuccessful.path,
                          builder: (context, state) {
                            final params = state.pathParameters;
                            return PostTrainingSuccessfulScreen(
                              id: int.parse(params['id'] ?? '0'),
                            );
                          },
                        ),
                      ],
                    ),
                    GoRoute(
                      name: Routes.postExpertExecutive.name,
                      path: Routes.postExpertExecutive.path,
                      builder: (context, state) {
                        return const PostExpertsExecutivesScreen();
                      },
                      routes: [
                        GoRoute(
                          name: Routes.subscribeExpertExecutive.name,
                          path: Routes.subscribeExpertExecutive.path,
                          builder: (context, state) {
                            return const SubscribeExpertsExecutivesScreen();
                          },
                          routes: [
                            GoRoute(
                              name: Routes.postExpertExecutiveSuccessful.name,
                              path: Routes.postExpertExecutiveSuccessful.path,
                              builder: (context, state) {
                                final params = state.pathParameters;
                                return PostExecutiveSuccessfulScreen(
                                  id: int.parse(params['id'] ?? '0'),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            // My post branch
            StatefulShellBranch(
              navigatorKey: _shellNavigatorMyPostKey,
              routes: [
                GoRoute(
                  name: Routes.myPost.name,
                  path: Routes.myPost.path,
                  builder: (context, state) {
                    return const MyPostScreen();
                  },
                  routes: [
                    GoRoute(
                      name: Routes.myPostJobOfferEdit.name,
                      path: Routes.myPostJobOfferEdit.path,
                      builder: (context, state) {
                        final params = state.pathParameters;
                        final jobOffer = state.extra;
                        return MyPostJobOfferEditScreen(
                          jobOfferId: int.parse(params['id'] ?? '0'),
                          initialJobOffer: jobOffer is JobOffer
                              ? jobOffer
                              : null,
                        );
                      },
                    ),
                    GoRoute(
                      name: Routes.myPostJobApplicantEdit.name,
                      path: Routes.myPostJobApplicantEdit.path,
                      builder: (context, state) {
                        final params = state.pathParameters;
                        final jobApplicant = state.extra;
                        return MyPostJobApplicantEditScreen(
                          jobApplicantId: int.parse(params['id'] ?? '0'),
                          initialJobApplicant: jobApplicant is JobApplicant
                              ? jobApplicant
                              : null,
                        );
                      },
                    ),
                    GoRoute(
                      name: Routes.myPostTrainingCenterEdit.name,
                      path: Routes.myPostTrainingCenterEdit.path,
                      builder: (context, state) {
                        final params = state.pathParameters;
                        final trainingCenter = state.extra;
                        return MyPostTrainingCenterEditScreen(
                          trainingCenterId: int.parse(params['id'] ?? '0'),
                          initialTrainingCenter:
                              trainingCenter is TrainingCenter
                              ? trainingCenter
                              : null,
                        );
                      },
                    ),
                    GoRoute(
                      name: Routes.myPostHotEventEdit.name,
                      path: Routes.myPostHotEventEdit.path,
                      builder: (context, state) {
                        final params = state.pathParameters;
                        final hotEvent = state.extra as HotEvent;
                        return MyPostHotEventEditScreen(
                          hotEventId: int.parse(params['id'] ?? '0'),
                          type: hotEvent.type,
                          initialHotEvent: hotEvent,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            // Account branch
            StatefulShellBranch(
              navigatorKey: _shellNavigatorAccountKey,
              routes: [
                GoRoute(
                  name: Routes.account.name,
                  path: Routes.account.path,
                  builder: (context, state) {
                    return const AccountScreen();
                  },
                  routes: [
                    GoRoute(
                      name: Routes.personalInfo.name,
                      path: Routes.personalInfo.path,
                      builder: (context, state) {
                        return const PersonalInfoScreen();
                      },
                      routes: [
                        GoRoute(
                          name: Routes.updatePersonalInfo.name,
                          path: Routes.updatePersonalInfo.path,
                          builder: (context, state) {
                            return const UpdatePersonalInfoScreen();
                          },
                        ),
                      ],
                    ),
                    GoRoute(
                      name: Routes.kara.name,
                      path: Routes.kara.path,
                      builder: (context, state) {
                        return const WalletScreen();
                      },
                    ),
                    GoRoute(
                      name: Routes.changePassword.name,
                      path: Routes.changePassword.path,
                      builder: (context, state) {
                        return const ChangePasswordScreen();
                      },
                    ),
                    GoRoute(
                      name: Routes.termsOfUse.name,
                      path: Routes.termsOfUse.path,
                      builder: (context, state) {
                        return const TermsOfUseScreen();
                      },
                    ),
                  ],
                ),
                GoRoute(
                  parentNavigatorKey: _shellNavigatorAccountKey,
                  name: Routes.signIn.name,
                  path: Routes.signIn.path,
                  builder: (context, state) {
                    return const SignInScreen();
                  },
                ),
                GoRoute(
                  parentNavigatorKey: _shellNavigatorAccountKey,
                  name: Routes.signUp.name,
                  path: Routes.signUp.path,
                  builder: (context, state) {
                    return const SignUpScreen();
                  },
                ),
              ],
            ),
          ],
          builder: (context, state, navigationShell) {
            return Navigation(navigationShell: navigationShell);
          },
        ),
      ],
    );
  }
}

class _AppBlocNotifier extends ChangeNotifier {
  StreamSubscription? _subscription;

  void update(AppBloc appBloc) {
    _subscription?.cancel();
    _subscription = appBloc.stream.listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
