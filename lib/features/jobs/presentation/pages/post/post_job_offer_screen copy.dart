// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get_it/get_it.dart';
// import 'package:go_router/go_router.dart';
// import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
// import 'package:kianja/core/shared/widgets/fields/date_field.dart';
// import 'package:kianja/core/shared/widgets/fields/label_field.dart';
// import 'package:kianja/core/shared/widgets/fields/text_input_field.dart';
// import 'package:kianja/core/shared/widgets/headers/title_header.dart';
// import 'package:kianja/core/themes/app_colors.dart';
// import 'package:kianja/core/utils/app_messenger.dart';
// import 'package:kianja/core/utils/constants.dart';
// import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
// import 'package:kianja/features/jobs/presentation/widgets/post/single_photo_upload_widget.dart';
// import 'package:kianja/routing/routes.dart';

// class PostJobOfferScreen extends StatefulWidget {
//   const PostJobOfferScreen({super.key});

//   @override
//   State<PostJobOfferScreen> createState() => _PostJobOfferScreenState();
// }

// class _PostJobOfferScreenState extends State<PostJobOfferScreen> {
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _birthDateController = TextEditingController();

//   final List<String> _selectedCategories = ['Agent immobilier'];
//   final List<String> _selectedLocations = ['National'];
//   final List<String> _selectedGenders = ['Female'];
//   final List<String> _selectedActors = ['Entreprise'];

//   String? _uploadedImageUrl;

//   void _clearValues() {
//     _titleController.clear();
//     _descriptionController.clear();
//     _birthDateController.clear();
//     setState(() {
//       _selectedCategories.clear();
//       _selectedLocations.clear();
//       _selectedGenders.clear();
//       _selectedActors.clear();
//       _uploadedImageUrl = null;
//     });
//   }

//   void _postJobOffer(BuildContext context) {
//     if (_titleController.text.trim().isEmpty ||
//         _descriptionController.text.trim().isEmpty ||
//         _birthDateController.text.trim().isEmpty ||
//         _selectedCategories.isEmpty ||
//         _selectedLocations.isEmpty ||
//         _selectedGenders.isEmpty ||
//         _selectedActors.isEmpty ||
//         _uploadedImageUrl == null) {
//       AppMessenger.showWarning(
//         context,
//         'Please fill all required fields and upload a photo',
//       );
//       return;
//     }

//     BlocProvider.of<JobsBloc>(context).add(
//       JobsCreateJobOfferRequested(
//         title: _titleController.text.trim(),
//         imageUrl: _uploadedImageUrl!,
//         description: _descriptionController.text.trim(),
//         categories: _selectedCategories,
//         location: _selectedLocations.first,
//         gender: _selectedGenders.first,
//         actor: _selectedActors.first,
//         limitDate: _birthDateController.text.trim(),
//       ),
//     );
//   }

//   void _toggleCategory(String category) {
//     setState(() {
//       if (_selectedCategories.contains(category)) {
//         _selectedCategories.remove(category);
//       } else {
//         if (_selectedCategories.length < 3) {
//           _selectedCategories.add(category);
//         }
//       }
//     });
//   }

//   void _toggleLocation(String location) {
//     setState(() {
//       if (_selectedLocations.contains(location)) {
//         _selectedLocations.remove(location);
//       } else {
//         _selectedLocations.clear();
//         _selectedLocations.add(location);
//       }
//     });
//   }

//   void _toggleGender(String gender) {
//     setState(() {
//       if (_selectedGenders.contains(gender)) {
//         _selectedGenders.remove(gender);
//       } else {
//         _selectedGenders.clear();
//         _selectedGenders.add(gender);
//       }
//     });
//   }

//   void _toggleActor(String actor) {
//     setState(() {
//       if (_selectedActors.contains(actor)) {
//         _selectedActors.remove(actor);
//       } else {
//         _selectedActors.clear();
//         _selectedActors.add(actor);
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _titleController.dispose();
//     _descriptionController.dispose();
//     _birthDateController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final isDark = theme.brightness == Brightness.dark;

//     return BlocProvider(
//       create: (context) =>
//           GetIt.instance<JobsBloc>()..add(const JobFeaturesFetchRequested()),
//       child: Builder(
//         builder: (context) {
//           return BlocConsumer<JobsBloc, JobsState>(
//             listener: (context, state) {
//               if (state is JobsUploadImageSuccess) {
//                 setState(() {
//                   _uploadedImageUrl = state.jobImage.url;
//                 });
//                 AppMessenger.showSuccess(
//                   context,
//                   'Photo uploaded successfully',
//                 );
//               } else if (state is JobsCreateJobOfferSuccess) {
//                 _clearValues();
//                 context.goNamed(Routes.postSuccessful.name);
//               } else if (state is JobsRequestFailure) {
//                 AppMessenger.showError(context, state.message);
//               }
//             },
//             builder: (context, state) {
//               final isLoading = state is JobsRequestInProgress;

//               return BaseScreen(
//                 appBar: const TitleHeader(title: 'Post a job offer'),
//                 child: GestureDetector(
//                   onTap: () => FocusScope.of(context).unfocus(),
//                   child: SingleChildScrollView(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: Constants.paddingMedium,
//                       vertical: Constants.paddingMedium,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const LabelField(label: 'Job title *'),
//                         const SizedBox(height: Constants.spacingSmall),
//                         TextInputField(
//                           controller: _titleController,
//                           hintText: 'Add job title',
//                           maxLines: 3,
//                           maxLength: 130,
//                         ),
//                         const SizedBox(height: Constants.spacingMedium),

//                         const LabelField(label: 'Photo'),
//                         const SizedBox(height: Constants.spacingSmall),
//                         SinglePhotoUploadWidget(
//                           onPhotoChanged: (photo) {
//                             if (photo != null) {
//                               BlocProvider.of<JobsBloc>(
//                                 context,
//                               ).add(JobsUploadImageRequested(file: photo));
//                             }
//                           },
//                         ),
//                         const SizedBox(height: Constants.spacingMedium),

//                         const LabelField(label: 'Description *'),
//                         const SizedBox(height: Constants.spacingSmall),
//                         TextInputField(
//                           controller: _descriptionController,
//                           hintText: 'Add description',
//                           maxLines: 10,
//                           keyboardType: TextInputType.multiline,
//                         ),
//                         const SizedBox(height: Constants.spacingMedium),

//                         Row(
//                           children: [
//                             Text(
//                               'Category * ',
//                               style: theme.textTheme.titleSmall!.copyWith(
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               '(3 max)',
//                               style: theme.textTheme.bodyMedium?.copyWith(
//                                 fontWeight: FontWeight.bold,
//                                 color: isDark ? Colors.white54 : Colors.black54,
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: Constants.spacingSmall),
//                         Wrap(
//                           spacing: Constants.spacingMedium,
//                           children:
//                               [
//                                 'Agent immobilier',
//                                 'Aide masseur',
//                                 'Bureau',
//                                 'Chauffeur',
//                                 'Chauffeur poids lourd',
//                                 'Coiffure',
//                                 'Construction',
//                                 'Cuisinier',
//                                 'Enseignant',
//                                 'Infirmier',
//                                 'Ingenieur',
//                                 'Main d\'oeuvre',
//                                 'Mecanicien',
//                                 'Programmeur',
//                                 'Promoteur',
//                                 'Secteur primaire',
//                                 'Securite',
//                                 'Vendeur',
//                                 'Autre',
//                               ].map((category) {
//                                 final isSelected = _selectedCategories.contains(
//                                   category,
//                                 );
//                                 return InkWell(
//                                   onTap: () => _toggleCategory(category),
//                                   borderRadius: BorderRadius.circular(4),
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                       vertical: 6,
//                                     ),
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         SizedBox(
//                                           width: 24,
//                                           height: 24,
//                                           child: Checkbox(
//                                             value: isSelected,
//                                             onChanged: (value) =>
//                                                 _toggleCategory(category),
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           width: Constants.spacingExtraSmall,
//                                         ),
//                                         Text(
//                                           category,
//                                           style: theme.textTheme.bodyMedium,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               }).toList(),
//                         ),
//                         const SizedBox(height: Constants.spacingMedium),

//                         const LabelField(label: 'Location *'),
//                         const SizedBox(height: Constants.spacingSmall),
//                         Wrap(
//                           spacing: Constants.spacingMedium,
//                           children:
//                               [
//                                 'National',
//                                 'Antananarivo',
//                                 'Toamasina',
//                                 'Fianarantsoa',
//                                 'Mahajanga',
//                                 'Antsiranana',
//                                 'Toliara',
//                                 'Teletravail',
//                                 'Hors du pays',
//                               ].map((location) {
//                                 final isSelected = _selectedLocations.contains(
//                                   location,
//                                 );
//                                 return InkWell(
//                                   onTap: () => _toggleLocation(location),
//                                   borderRadius: BorderRadius.circular(4),
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                       vertical: 6,
//                                     ),
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         SizedBox(
//                                           width: 24,
//                                           height: 24,
//                                           child: Checkbox(
//                                             value: isSelected,
//                                             onChanged: (value) =>
//                                                 _toggleLocation(location),
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           width: Constants.spacingExtraSmall,
//                                         ),
//                                         Text(
//                                           location,
//                                           style: theme.textTheme.bodyMedium,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               }).toList(),
//                         ),
//                         const SizedBox(height: Constants.spacingMedium),

//                         const LabelField(label: 'Gender *'),
//                         const SizedBox(height: Constants.spacingSmall),
//                         Wrap(
//                           spacing: Constants.spacingMedium,
//                           children: ['Female', 'Male', 'Together'].map((
//                             gender,
//                           ) {
//                             final isSelected = _selectedGenders.contains(
//                               gender,
//                             );
//                             return InkWell(
//                               onTap: () => _toggleGender(gender),
//                               borderRadius: BorderRadius.circular(4),
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                   vertical: 6,
//                                 ),
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     SizedBox(
//                                       width: 24,
//                                       height: 24,
//                                       child: Checkbox(
//                                         value: isSelected,
//                                         onChanged: (value) =>
//                                             _toggleGender(gender),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: Constants.spacingExtraSmall,
//                                     ),
//                                     Text(
//                                       gender,
//                                       style: theme.textTheme.bodyMedium,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                         const SizedBox(height: Constants.spacingMedium),

//                         const LabelField(label: 'Actor *'),
//                         const SizedBox(height: Constants.spacingSmall),
//                         Wrap(
//                           spacing: Constants.spacingMedium,
//                           children:
//                               [
//                                 'Entreprise',
//                                 'Particulier',
//                                 'Organisme publique',
//                                 'ONG',
//                               ].map((actor) {
//                                 final isSelected = _selectedActors.contains(
//                                   actor,
//                                 );
//                                 return InkWell(
//                                   onTap: () => _toggleActor(actor),
//                                   borderRadius: BorderRadius.circular(4),
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                       vertical: 6,
//                                     ),
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         SizedBox(
//                                           width: 24,
//                                           height: 24,
//                                           child: Checkbox(
//                                             value: isSelected,
//                                             onChanged: (value) =>
//                                                 _toggleActor(actor),
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           width: Constants.spacingExtraSmall,
//                                         ),
//                                         Text(
//                                           actor,
//                                           style: theme.textTheme.bodyMedium,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               }).toList(),
//                         ),

//                         const SizedBox(height: Constants.spacingLarge),
//                         const Divider(),
//                         const SizedBox(height: Constants.spacingMedium),

//                         Text(
//                           'Post features',
//                           style: theme.textTheme.titleSmall?.copyWith(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: Constants.spacingMedium),

//                         Text(
//                           'Date limite de canditature *',
//                           style: theme.textTheme.bodyMedium,
//                         ),
//                         const SizedBox(height: Constants.spacingSmall),
//                         DateField(birthDateController: _birthDateController),
//                         const SizedBox(height: Constants.spacingMedium),

//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: ElevatedButton(
//                             onPressed: isLoading
//                                 ? null
//                                 : () => _postJobOffer(context),
//                             child: isLoading
//                                 ? const SizedBox(
//                                     width: 24,
//                                     height: 24,
//                                     child: CircularProgressIndicator(
//                                       strokeWidth: 2,
//                                     ),
//                                   )
//                                 : Text(
//                                     'POST',
//                                     style: theme.textTheme.titleMedium
//                                         ?.copyWith(
//                                           fontWeight: FontWeight.bold,
//                                           letterSpacing: 1.2,
//                                           color: isDark
//                                               ? AppColors.darkTextPrimary
//                                               : AppColors.lightTextPrimary,
//                                         ),
//                                   ),
//                           ),
//                         ),
//                         const SizedBox(height: Constants.spacingLarge),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
