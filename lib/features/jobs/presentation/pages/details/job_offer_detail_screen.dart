import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/shared/app_feature/bloc/app/app_bloc.dart';
import 'package:kianja/core/shared/widgets/avatar/default_avatar.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/shared/widgets/loading/shimmer_job_detail_indicator.dart';
import 'package:kianja/core/shared/widgets/photos/photo_handler.dart';
import 'package:kianja/core/shared/widgets/photos/photo_type_enum.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_function.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/jobs/domain/usecases/save_content/save_content_params.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/features/jobs/presentation/bloc/save_content/save_content_bloc.dart';
import 'package:kianja/features/jobs/presentation/widgets/apply_button.dart';
import 'package:kianja/features/jobs/presentation/widgets/enum/save_content_enum.dart';
import 'package:kianja/routing/routes.dart';
import 'package:url_launcher/url_launcher.dart';

class JobOfferDetailScreen extends StatefulWidget {
  const JobOfferDetailScreen({
    super.key,
    required this.id,
    this.matchedLocation,
  });
  final int id;
  final String? matchedLocation;

  @override
  State<JobOfferDetailScreen> createState() => _JobOfferDetailScreenState();
}

class _JobOfferDetailScreenState extends State<JobOfferDetailScreen> {
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
                ..add(JobsGetJobOfferDetailRequested(id: widget.id)),
        ),
        BlocProvider(create: (context) => GetIt.instance<SaveContentBloc>()),
      ],
      child: BaseScreen(
        appBar: TitleHeader(
          title: context.appLoc.job_offer_detail,
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
                                    saveContent: SaveContentEnum.jobOffers,
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
              if (state is JobsGetJobOfferDetailSuccess) {
                setState(() {
                  _isSaved = state.jobOffer.isFavorite;
                });
              }
            },
            builder: (context, state) {
              if (state is JobsGetJobOfferDetailSuccess) {
                final jobOffer = state.jobOffer;
                final isExpired = AppFunction.isExpired(jobOffer.dateLimit);
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    vertical: Constants.paddingMedium,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
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
                                  jobOffer.title,
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: Constants.spacingSmall),
                                Row(
                                  children: [
                                    Text(
                                      '${context.appLoc.deadline}  ',
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    Icon(
                                      Icons.access_time,
                                      size: Constants.iconSizeExtraSmall,
                                      color: isExpired
                                          ? AppColors.danger
                                          : AppColors.success,
                                    ),
                                    const SizedBox(
                                      width: Constants.spacingExtraSmall,
                                    ),
                                    Text(
                                      isExpired
                                          ? '${AppFunction.getDate(jobOffer.dateLimit)} (${context.appLoc.expired})'
                                          : AppFunction.getDate(
                                              jobOffer.dateLimit,
                                            ),
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                            color: isExpired
                                                ? AppColors.danger.withValues(
                                                    alpha: 0.7,
                                                  )
                                                : AppColors.success,
                                          ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: Constants.spacingExtraSmall,
                                ),
                                Text(
                                  '${context.appLoc.posted}  •  ${AppFunction.dateTimeCounter(jobOffer.createdAt, context)}',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
                      if (jobOffer.images != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: Constants.paddingMedium,
                              ),
                              child: PhotoHandler(
                                photoTypeEnum: PhotoTypeEnum.hiring,
                                width: double.infinity,
                                imageUrls: jobOffer.images!
                                    .map(
                                      (image) =>
                                          '${EnvConfig.baseApiUrl}${image.url}',
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
                              text: jobOffer.description,
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

                      // Job features
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Constants.paddingMedium,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.appLoc.job_features,
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: Constants.spacingMedium),
                            _buildFeatureRow(
                              context,
                              label: context.appLoc.categories,
                              value: jobOffer.categories
                                  .map((category) => category.name)
                                  .join(', '),
                            ),
                            const SizedBox(height: Constants.spacingSmall),
                            _buildFeatureRow(
                              context,
                              label: context.appLoc.location,
                              value: jobOffer.locations
                                  .map((location) => location.name)
                                  .join(', '),
                            ),
                            // _buildFeatureRow(
                            //   context,
                            //   label: context.appLoc.location,
                            //   value: jobOffer.location?.name ?? '',
                            // ),
                            const SizedBox(height: Constants.spacingSmall),
                            _buildFeatureRow(
                              context,
                              label: context.appLoc.gender,
                              value: jobOffer.gender?.name ?? '',
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

                      // Actor
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Constants.paddingMedium,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.appLoc.actor,
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: Constants.spacingMedium),
                            Text(
                              jobOffer.actor?.name ?? '',
                              style: theme.textTheme.bodySmall,
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
                      if (jobOffer.preference != null &&
                          jobOffer.preference?.showPostButton == true)
                        // widget.matchedLocation != '/account/applications'
                        //     ?
                        // if (widget.matchedLocation != '/account/applications')
                        jobOffer.alreadyPostuler
                            ? Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: Constants.paddingMedium,
                                    vertical: Constants.paddingMedium,
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: Constants.paddingExtraSmall,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.info,
                                      borderRadius: BorderRadius.circular(
                                        Constants.borderRadiusSmall,
                                      ),
                                    ),
                                    child: Text(
                                      context.appLoc.application_already_sent,
                                      style: theme.textTheme.bodyLarge
                                          ?.copyWith(color: Colors.white),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: Constants.paddingMedium,
                                ),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: ApplyButton(jobId: widget.id),
                                ),
                              ),
                      // About the client
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
                            InkWell(
                              onTap: () {
                                context.pushNamed(
                                  Routes.viewUserProfile.name,
                                  pathParameters: {
                                    'id': jobOffer.user.id.toString(),
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  ClipOval(
                                    child: jobOffer.user.photoUrl.isNotEmpty
                                        ? CachedNetworkImage(
                                            imageUrl:
                                                '${EnvConfig.baseApiUrl}${jobOffer.user.photoUrl}',
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
                                    '${jobOffer.user.firstName} ${jobOffer.user.lastName}',
                                    style: theme.textTheme.bodySmall,
                                  ),
                                ],
                              ),
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
                            // Text(
                            //   '10 jobs posted',
                            //   style: theme.textTheme.bodySmall,
                            // ),
                            // const SizedBox(height: Constants.spacingSmall),
                            Text(
                              jobOffer.user.residence,
                              style: theme.textTheme.bodySmall,
                            ),
                            const SizedBox(height: Constants.spacingSmall),
                            Text(
                              '${context.appLoc.member_since} ${AppFunction.getDate(jobOffer.user.createdAt)}',
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
                    ).add(JobsGetJobOfferDetailRequested(id: widget.id));
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
