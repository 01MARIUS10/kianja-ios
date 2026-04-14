// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:kianja/core/themes/app_colors.dart';
// import 'package:kianja/core/utils/constants.dart';

// class JobSectionWithFloatingButton extends StatefulWidget {
//   const JobSectionWithFloatingButton({
//     super.key,
//     required this.child,
//     required this.onPressed,
//   });
//   final Widget child;
//   final VoidCallback onPressed;

//   @override
//   State<JobSectionWithFloatingButton> createState() =>
//       _JobSectionWithFloatingButtonState();
// }

// class _JobSectionWithFloatingButtonState
//     extends State<JobSectionWithFloatingButton>
//     with SingleTickerProviderStateMixin {
//   late ScrollController _scrollController;
//   late AnimationController _animationController;
//   late Animation<Offset> _slideAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     );
//     _slideAnimation = Tween<Offset>(begin: Offset.zero, end: const Offset(0, 2))
//         .animate(
//           CurvedAnimation(
//             parent: _animationController,
//             curve: Curves.easeInOut,
//           ),
//         );

//     _scrollController.addListener(() {
//       if (_scrollController.position.userScrollDirection ==
//           ScrollDirection.reverse) {
//         if (!_animationController.isAnimating) {
//           _animationController.forward();
//         }
//       } else if (_scrollController.position.userScrollDirection ==
//           ScrollDirection.forward) {
//         if (!_animationController.isAnimating) {
//           _animationController.reverse();
//         }
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isDark = Theme.of(context).brightness == Brightness.dark;

//     return Stack(
//       children: [
//         SingleChildScrollView(
//           controller: _scrollController,
//           child: widget.child,
//         ),
//         Positioned(
//           bottom: Constants.spacingSmall,
//           right: Constants.spacingZero,
//           child: SlideTransition(
//             position: _slideAnimation,
//             child: ElevatedButton(
//               onPressed: widget.onPressed,
//               style: ElevatedButton.styleFrom(
//                 elevation: 2,
//                 shape: const CircleBorder(),
//                 shadowColor: isDark
//                     ? AppColors.lightSurface
//                     : AppColors.darkSurface,
//               ),
//               child: const Icon(Icons.add),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
