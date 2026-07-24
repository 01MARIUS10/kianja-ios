import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/shared/app_feature/bloc/app/app_bloc.dart';
import 'package:kianja/core/shared/widgets/avatar/default_avatar.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/shared/widgets/loading/shimmer_job_detail_indicator.dart';
import 'package:kianja/core/shared/widgets/photos/photo_handler.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/app_function.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/jobs/domain/usecases/save_content/save_content_params.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/features/jobs/presentation/bloc/save_content/save_content_bloc.dart';
import 'package:kianja/features/jobs/presentation/widgets/enum/save_content_enum.dart';
import 'package:kianja/routing/routes.dart';
import 'package:url_launcher/url_launcher.dart';

class JobApplicantDetailScreen extends StatefulWidget {
  const JobApplicantDetailScreen({super.key, required this.id});
  final int id;

  @override
  State<JobApplicantDetailScreen> createState() =>
      _JobApplicantDetailScreenState();
}

class _JobApplicantDetailScreenState extends State<JobApplicantDetailScreen> {
  bool _isSaved = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textSecondary = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetIt.instance<JobsBloc>()
                ..add(JobsGetJobApplicantDetailRequested(id: widget.id)),
        ),
        BlocProvider(create: (context) => GetIt.instance<SaveContentBloc>()),
      ],
      child: BaseScreen(
        appBar: TitleHeader(
          title: context.appLoc.job_applicant_detail,
          actions: [
            Builder(
              builder: (context) {
                return BlocBuilder<AppBloc, AppState>(
                  builder: (context, appState) {
                    return IconButton(
                      onPressed: appState.isAuthenticated
                          ? () {
                              setState(() {
                                _isSaved = !_isSaved;
                              });
                              BlocProvider.of<SaveContentBloc>(context).add(
                                SaveContentSaved(
                                  saveContentParams: SaveContentParams(
                                    saveContent: SaveContentEnum.jobApplicants,
                                    id: widget.id,
                                  ),
                                ),
                              );
                            }
                          : () {
                              context.goNamed(Routes.signIn.name);
                            },
                      icon: Icon(
                        _isSaved ? Icons.favorite : Icons.favorite_outline,
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
        child: BlocListener<SaveContentBloc, SaveContentState>(
          listener: (context, state) {
            if (state is SaveContentSuccess) {
              AppMessenger.showSuccess(context, state.message);
            }
            if (state is SaveContentFailure) {
              AppMessenger.showError(context, state.error);
            }
          },
          child: BlocConsumer<JobsBloc, JobsState>(
            listener: (context, state) {
              if (state is JobsGetJobApplicantDetailSuccess) {
                AppDebug.showPrint(
                  'JOB APPLICANT FAVORITE : ${state.jobApplicant.isFavorite}',
                );
                setState(() {
                  _isSaved = state.jobApplicant.isFavorite;
                });
              }
            },
            builder: (context, state) {
              if (state is JobsGetJobApplicantDetailSuccess) {
                final jobApplicant = state.jobApplicant;
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    vertical: Constants.paddingMedium,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Info
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Constants.paddingMedium,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              jobApplicant.title,
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: Constants.spacingSmall),
                            Text(
                              '${context.appLoc.posted}  •  ${AppFunction.dateTimeCounter(jobApplicant.createdAt, context)}',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: Constants.spacingMedium),
                      Divider(
                        color: borderColor,
                        thickness: 1,
                        height: 1,
                        indent: Constants.paddingMedium,
                        endIndent: Constants.paddingMedium,
                      ),
                      const SizedBox(height: Constants.spacingMedium),

                      // Image
                      if (jobApplicant.photoUrl != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: Constants.paddingMedium,
                              ),
                              child: PhotoHandler(
                                width: double.infinity,
                                imageUrls: [jobApplicant.photoUrl]
                                    .map(
                                      (image) =>
                                          '${EnvConfig.baseApiUrl}$image',
                                    )
                                    .toList(),
                              ),
                            ),

                            const SizedBox(height: Constants.spacingMedium),
                            Divider(
                              color: borderColor,
                              thickness: 1,
                              height: 1,
                              indent: Constants.paddingMedium,
                              endIndent: Constants.paddingMedium,
                            ),
                            const SizedBox(height: Constants.spacingMedium),
                          ],
                        ),

                      // Description
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Constants.paddingMedium,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.appLoc.description,
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: Constants.spacingMedium),
                            Linkify(
                              onOpen: _onOpen,
                              text: jobApplicant.motivation,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                height: 1.5,
                              ),
                              linkStyle: theme.textTheme.bodyMedium?.copyWith(
                                color: AppColors.info,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: Constants.spacingMedium),
                      Divider(
                        color: borderColor,
                        thickness: 1,
                        height: 1,
                        indent: Constants.paddingMedium,
                        endIndent: Constants.paddingMedium,
                      ),
                      const SizedBox(height: Constants.spacingMedium),

                      if (jobApplicant.pdfUrl != null &&
                          jobApplicant.pdfUrl!.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Resume
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: Constants.paddingMedium,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    context.appLoc.resume,
                                    style: theme.textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: Constants.spacingMedium,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      context.pushNamed(
                                        Routes.jobApplicantViewPdf.name,
                                        pathParameters: {
                                          'id': jobApplicant.id.toString(),
                                        },
                                        extra: {
                                          'pdfUrl':
                                              '${EnvConfig.baseApiUrl}${jobApplicant.pdfUrl}',
                                        },
                                      );
                                    },
                                    child: Image.asset(Assets.pdf, height: 40),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: Constants.spacingMedium),
                            Divider(
                              color: borderColor,
                              thickness: 1,
                              height: 1,
                              indent: Constants.paddingMedium,
                              endIndent: Constants.paddingMedium,
                            ),
                            const SizedBox(height: Constants.spacingMedium),
                          ],
                        ),

                      // Job features
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Constants.paddingMedium,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.appLoc.job_features_preference,
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: Constants.spacingMedium),
                            _buildFeatureRow(
                              context,
                              label: context.appLoc.categories,
                              value: jobApplicant.categories
                                  .map((category) => category.name)
                                  .join(', '),
                            ),
                            const SizedBox(height: Constants.spacingSmall),
                            _buildFeatureRow(
                              context,
                              label: context.appLoc.location,
                              value: jobApplicant.locations
                                  .map((location) => location.name)
                                  .join(', '),
                            ),
                            // _buildFeatureRow(
                            //   context,
                            //   label: context.appLoc.category,
                            //   value: jobApplicant.category?.name ?? '',
                            // ),
                            // const SizedBox(height: Constants.spacingSmall),
                            // _buildFeatureRow(
                            //   context,
                            //   label: context.appLoc.location,
                            //   value: jobApplicant.location.name,
                            // ),
                            const SizedBox(height: Constants.spacingSmall),
                            _buildFeatureRow(
                              context,
                              label: context.appLoc.gender,
                              value: jobApplicant.gender?.name ?? '',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: Constants.spacingMedium),
                      Divider(
                        color: borderColor,
                        thickness: 1,
                        height: 1,
                        indent: Constants.paddingMedium,
                        endIndent: Constants.paddingMedium,
                      ),
                      const SizedBox(height: Constants.spacingMedium),

                      BlocBuilder<AppBloc, AppState>(
                        builder: (context, state) {
                          if (state.isAuthenticated &&
                              state.user.id == jobApplicant.user.id) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: Constants.paddingMedium,
                              ),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: ElevatedButton(
                                  onPressed: () {
                                    context.pushNamed(
                                      Routes.prolongerJobApplicant.name,
                                      pathParameters: {
                                        'id': jobApplicant.id.toString(),
                                      },
                                    );
                                  },
                                  child: Text(
                                    context.appLoc.extend.toUpperCase(),
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                      color: isDark
                                          ? AppColors.darkTextPrimary
                                          : AppColors.lightTextPrimary,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),

                      // About the applicant
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Constants.paddingMedium,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.appLoc.published_by,
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: Constants.spacingMedium),
                            Row(
                              children: [
                                ClipOval(
                                  child: jobApplicant.user.photoUrl.isNotEmpty
                                      ? CachedNetworkImage(
                                          imageUrl:
                                              '${EnvConfig.baseApiUrl}${jobApplicant.user.photoUrl}',
                                          fit: BoxFit.cover,
                                          width: Constants.size35,
                                          height: Constants.size35,
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator(),
                                          errorWidget: (_, _, _) =>
                                              const DefaultAvatar(
                                                size: Constants.size35,
                                              ),
                                        )
                                      : const DefaultAvatar(
                                          size: Constants.size35,
                                        ),
                                ),
                                const SizedBox(width: Constants.spacingSmall),
                                Text(
                                  '${jobApplicant.user.firstName} ${jobApplicant.user.lastName}',
                                  style: theme.textTheme.bodySmall,
                                ),
                              ],
                            ),
                            const SizedBox(height: Constants.spacingSmall),
                            Row(
                              children: [
                                const Icon(
                                  Icons.verified_user_outlined,
                                  size: Constants.iconSizeExtraSmall,
                                  color: AppColors.success,
                                ),
                                const SizedBox(
                                  width: Constants.spacingExtraSmall,
                                ),
                                Text(
                                  context.appLoc.verified_phone_number,
                                  style: theme.textTheme.bodySmall,
                                ),
                              ],
                            ),
                            const SizedBox(height: Constants.spacingSmall),
                            Text(
                              jobApplicant.user.residence,
                              style: theme.textTheme.bodySmall,
                            ),
                            const SizedBox(height: Constants.spacingSmall),
                            Text(
                              '${context.appLoc.member_since} ${AppFunction.getDate(jobApplicant.user.createdAt)}',
                              style: theme.textTheme.bodySmall,
                            ),
                            const SizedBox(height: Constants.spacingLarge),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is JobsRequestFailure) {
                return ServerFailureScreen(
                  onRetry: () {
                    BlocProvider.of<JobsBloc>(
                      context,
                    ).add(JobsGetJobApplicantDetailRequested(id: widget.id));
                  },
                  message: state.message,
                );
              } else {
                return const ShimmerJobDetailIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureRow(
    BuildContext context, {
    required String label,
    required String value,
  }) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label :',
          style: theme.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: Constants.spacingExtraSmall),
        Expanded(child: Text(value, style: theme.textTheme.bodySmall)),
      ],
    );
  }

  Future<void> _onOpen(LinkableElement link) async {
    if (!await launchUrl(Uri.parse(link.url))) {
      throw Exception('Could not launch ${link.url}');
    }
  }
}
