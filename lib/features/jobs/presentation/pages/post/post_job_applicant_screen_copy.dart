// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get_it/get_it.dart';
// import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
// import 'package:kianja/core/shared/widgets/fields/label_field.dart';
// import 'package:kianja/core/shared/widgets/fields/text_input_field.dart';
// import 'package:kianja/core/shared/widgets/headers/title_header.dart';
// import 'package:kianja/core/utils/constants.dart';
// import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
// import 'package:kianja/features/jobs/presentation/widgets/post/post_features_section.dart';
// import 'package:kianja/features/jobs/presentation/widgets/post/single_pdf_upload_widget.dart';
// import 'package:kianja/features/jobs/presentation/widgets/post/single_photo_upload_widget.dart';

// class PostJobApplicantScreen extends StatefulWidget {
//   const PostJobApplicantScreen({super.key});

//   @override
//   State<PostJobApplicantScreen> createState() => _PostJobApplicantScreenState();
// }

// class _PostJobApplicantScreenState extends State<PostJobApplicantScreen> {
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _motivationController = TextEditingController();

//   final List<String> _selectedCategories = ['Agent immobilier'];
//   final List<String> _selectedLocations = ['National'];
//   final List<String> _selectedGenders = ['Female'];

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

//   @override
//   void dispose() {
//     _titleController.dispose();
//     _motivationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final isDark = theme.brightness == Brightness.dark;

//     return BlocProvider(
//       create: (context) => GetIt.instance<JobsBloc>(),
//       child: Builder(
//         builder: (context) {
//           return BaseScreen(
//             appBar: const TitleHeader(title: 'Post a job applicant'),
//             child: GestureDetector(
//               onTap: () => FocusScope.of(context).unfocus(),
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: Constants.paddingMedium,
//                   vertical: Constants.paddingMedium,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const LabelField(label: 'Job title *'),
//                     const SizedBox(height: Constants.spacingSmall),
//                     TextInputField(
//                       controller: _titleController,
//                       hintText: 'Add job title',
//                       maxLines: 3,
//                       maxLength: 130,
//                     ),
//                     const SizedBox(height: Constants.spacingMedium),

//                     const LabelField(label: 'Motivation *'),
//                     const SizedBox(height: Constants.spacingSmall),
//                     TextInputField(
//                       controller: _motivationController,
//                       hintText: 'Add motivation',
//                       maxLines: 10,
//                       keyboardType: TextInputType.multiline,
//                     ),
//                     const SizedBox(height: Constants.spacingMedium),

//                     const LabelField(label: 'Recent photo (optional)'),
//                     const SizedBox(height: Constants.spacingSmall),
//                     SinglePhotoUploadWidget(
//                       onPhotoChanged: (photo) {
//                         // Handle photo update
//                       },
//                     ),

//                     // MultiPhotoUploadWidget(
//                     //   maxPhotos: 5,
//                     //   onPhotosChanged: (photos) {
//                     //     // Handle photos update
//                     //   },
//                     // ),
//                     const SizedBox(height: Constants.spacingMedium),

//                     const LabelField(label: 'Resume (optional)'),
//                     const SizedBox(height: Constants.spacingSmall),
//                     SinglePdfUploadWidget(
//                       text:
//                           'Upload your Resume and\nlet members look at it.\nIn PDF format.',
//                       onPdfChanged: (pdf) {
//                         if (pdf != null) {
//                           BlocProvider.of<JobsBloc>(
//                             context,
//                           ).add(JobsUploadPdfRequested(file: pdf));
//                         }
//                       },
//                     ),
//                     const SizedBox(height: Constants.spacingMedium),

//                     Row(
//                       children: [
//                         Text(
//                           'Category * ',
//                           style: theme.textTheme.titleSmall!.copyWith(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           '(3 max)',
//                           style: theme.textTheme.bodyMedium?.copyWith(
//                             fontWeight: FontWeight.bold,
//                             color: isDark ? Colors.white54 : Colors.black54,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: Constants.spacingSmall),
//                     Wrap(
//                       spacing: Constants.spacingMedium,
//                       children:
//                           [
//                             'Agent immobilier',
//                             'Aide masseur',
//                             'Bureau',
//                             'Chauffeur',
//                             'Chauffeur poids lourd',
//                             'Coiffure',
//                             'Construction',
//                             'Cuisinier',
//                             'Enseignant',
//                             'Infirmier',
//                             'Ingenieur',
//                             'Main d\'oeuvre',
//                             'Mecanicien',
//                             'Programmeur',
//                             'Promoteur',
//                             'Secteur primaire',
//                             'Securite',
//                             'Vendeur',
//                             'Autre',
//                           ].map((category) {
//                             final isSelected = _selectedCategories.contains(
//                               category,
//                             );
//                             return InkWell(
//                               onTap: () => _toggleCategory(category),
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
//                                             _toggleCategory(category),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: Constants.spacingExtraSmall,
//                                     ),
//                                     Text(
//                                       category,
//                                       style: theme.textTheme.bodyMedium,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           }).toList(),
//                     ),
//                     const SizedBox(height: Constants.spacingMedium),

//                     const LabelField(label: 'Location *'),
//                     const SizedBox(height: Constants.spacingSmall),
//                     Wrap(
//                       spacing: Constants.spacingMedium,
//                       children:
//                           [
//                             'National',
//                             'Antananarivo',
//                             'Toamasina',
//                             'Fianarantsoa',
//                             'Mahajanga',
//                             'Antsiranana',
//                             'Toliara',
//                             'Teletravail',
//                             'Hors du pays',
//                           ].map((location) {
//                             final isSelected = _selectedLocations.contains(
//                               location,
//                             );
//                             return InkWell(
//                               onTap: () => _toggleLocation(location),
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
//                                             _toggleLocation(location),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: Constants.spacingExtraSmall,
//                                     ),
//                                     Text(
//                                       location,
//                                       style: theme.textTheme.bodyMedium,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           }).toList(),
//                     ),
//                     const SizedBox(height: Constants.spacingMedium),

//                     const LabelField(label: 'Gender *'),
//                     const SizedBox(height: Constants.spacingSmall),
//                     Wrap(
//                       spacing: Constants.spacingMedium,

//                       children: ['Female', 'Male', 'Together'].map((gender) {
//                         final isSelected = _selectedGenders.contains(gender);
//                         return InkWell(
//                           onTap: () => _toggleGender(gender),
//                           borderRadius: BorderRadius.circular(4),
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 6),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 SizedBox(
//                                   width: 24,
//                                   height: 24,
//                                   child: Checkbox(
//                                     value: isSelected,
//                                     onChanged: (value) => _toggleGender(gender),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   width: Constants.spacingExtraSmall,
//                                 ),
//                                 Text(gender, style: theme.textTheme.bodyMedium),
//                               ],
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     ),

//                     const SizedBox(height: Constants.spacingLarge),
//                     const Divider(),
//                     const SizedBox(height: Constants.spacingMedium),

//                     const PostFeaturesSection(),
//                     const SizedBox(height: Constants.spacingLarge),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
