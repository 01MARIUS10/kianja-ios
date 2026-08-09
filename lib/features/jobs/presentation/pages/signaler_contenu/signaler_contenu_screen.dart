import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/fields/label_field.dart';
import 'package:kianja/core/shared/widgets/fields/text_input_field.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/jobs/domain/entities/motif/motif.dart';
import 'package:kianja/features/jobs/domain/usecases/signaler_contenu/signaler_contenu_params.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';

class SignalerContenuScreen extends StatefulWidget {
  const SignalerContenuScreen({
    super.key,
    required this.contenuId,
    required this.type,
  });
  final int contenuId;
  final String type;

  @override
  State<SignalerContenuScreen> createState() => _SignalerContenuScreenState();
}

class _SignalerContenuScreenState extends State<SignalerContenuScreen> {
  final TextEditingController _descriptionController = TextEditingController();

  int? _selectedMotifId;
  List<Motif> _motifs = [];

  // ── Toggles ──────────────────────────────────────────────────────────────
  void _toggleMotif(BuildContext context, int motifId) {
    setState(() {
      setState(() {
        if (_selectedMotifId == motifId) {
          _selectedMotifId = null;
        } else {
          _selectedMotifId = motifId;
        }
      });
    });
  }

  // ── Clear ─────────────────────────────────────────────────────────────────
  void _clearValues() {
    _descriptionController.clear();
    setState(() {
      _selectedMotifId == null;
    });
  }

  // ── Submit ────────────────────────────────────────────────────────────────
  void _post(BuildContext context) {
    if (_selectedMotifId == null) {
      AppMessenger.showWarning(context, context.appLoc.please_select_a_reason);
      return;
    }
    _submitSignal(context);
  }

  void _submitSignal(BuildContext context) {
    BlocProvider.of<JobsBloc>(context).add(
      JobSignalerContenuRequested(
        signalerContenuParams: SignalerContenuParams(
          contenuId: widget.contenuId,
          type: widget.type,
          motifId: _selectedMotifId!,
          commentaire: _descriptionController.text.trim(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.instance<JobsBloc>()..add(const JobMotifsFetchRequested()),
      child: Builder(
        builder: (context) {
          return BlocConsumer<JobsBloc, JobsState>(
            listener: (context, state) {
              if (state is JobMotifsFetchSuccess) {
                setState(() => _motifs = state.motifs);
              } else if (state is JobSignalerContenuSuccess) {
                _clearValues();
                context.pop();
                AppMessenger.showSuccess(
                  context,
                  context.appLoc.content_reported_successfully,
                );
              } else if (state is JobsRequestFailure) {
                AppMessenger.showError(context, state.message);
              }
            },
            builder: (context, state) {
              final isLoading = state is JobsRequestInProgress;
              final theme = Theme.of(context);
              final isDark = theme.brightness == Brightness.dark;

              return BaseScreen(
                appBar: TitleHeader(title: context.appLoc.report_this_content),
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Constants.paddingMedium,
                      vertical: Constants.paddingMedium,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${context.appLoc.reason} *',
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: Constants.spacingSmall),
                        if (_motifs.isNotEmpty)
                          Wrap(
                            spacing: Constants.spacingMedium,
                            children: _motifs.map((motif) {
                              final isSelected = _selectedMotifId == motif.id;
                              return InkWell(
                                onTap: () => _toggleMotif(context, motif.id),
                                borderRadius: BorderRadius.circular(4),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 6,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: Checkbox(
                                          value: isSelected,
                                          onChanged: (value) =>
                                              _toggleMotif(context, motif.id),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: Constants.spacingExtraSmall,
                                      ),
                                      Text(
                                        motif.libelle,
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          )
                        else
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: CircularProgressIndicator(),
                          ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── More description ──────────────────────────────
                        LabelField(label: context.appLoc.comment),
                        const SizedBox(height: Constants.spacingSmall),
                        TextInputField(
                          controller: _descriptionController,
                          hintText: context.appLoc.add_more_description,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                        ),
                        const SizedBox(height: Constants.spacingMedium),

                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: isLoading ? null : () => _post(context),
                            child: isLoading
                                ? const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Text(
                                    context.appLoc.send.toUpperCase(),
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.2,
                                          color: isDark
                                              ? AppColors.darkTextPrimary
                                              : AppColors.lightTextPrimary,
                                        ),
                                  ),
                          ),
                        ),
                        const SizedBox(height: Constants.spacingLarge),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
