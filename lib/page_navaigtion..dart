
import 'package:flutter/material.dart';
import 'package:test3/widgets/1_design_systems/cupertino_widgets/1_cupertino_action_sheet.dart';
import 'package:test3/widgets/1_design_systems/cupertino_widgets/2_cupertino_activity_indicator.dart';
import 'package:test3/widgets/1_design_systems/cupertino_widgets/3_cupertino_alert_dialoge.dart';
import 'package:test3/widgets/1_design_systems/cupertino_widgets/4_cupertino_context_menu.dart';
import 'package:test3/widgets/1_design_systems/cupertino_widgets/5_cupertino_date_picker.dart';
import 'package:test3/widgets/1_design_systems/cupertino_widgets/6_cupertino_switch.dart';
import 'package:test3/widgets/1_design_systems/material_components/7_chip.dart';
import 'package:test3/widgets/1_design_systems/material_components/8_badge.dart';
import 'package:test3/widgets/2_base_widgets/1_semantics/1_semantics.dart';
import 'package:test3/widgets/2_base_widgets/2_animation/1_animated_modal_variable.dart';
import 'package:test3/widgets/2_base_widgets/2_animation/2_animated_physical_model.dart';

class PageNavigation extends StatefulWidget {
  const PageNavigation({super.key});

  @override
  State<PageNavigation> createState() => _PageNavigationState();
}

class _PageNavigationState extends State<PageNavigation> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _totalPages = 20;
// List<Color> colors= [
//   String  color1= Colors.red
// ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,

      body: Column(
        children: [
          // Main content area with PageView
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _totalPages,
              itemBuilder: (context, index) {
                return _buildPage(index);
              },
            ),
          ),
          // Navigation controls

        ],
      ),
    );
  }

  Widget _buildPage(int index) {
    // List of all widget pages
    final List<Widget> widgetPages = [

      CupertinoSwitchWidget(),
      ChipWidget(),
      BadgeWidget(),
      SemanticsWidget(),
      const CupertinoActionSheetWidget(),
      const CupertinoActivityIndicatorWidget(),
      CupertinoAlertDialogeWidget(),
      CupertinoContextMenuWidget(),
      CupertinoDatePickerWidget(),

      AnimatedModalBarrierWidget(),
      AnimatedPhysicalModelWidget(),

    ];

    if (index < widgetPages.length) {
      return widgetPages[index];
    } else {
      // Placeholder for pages not yet created
      return Container(
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.blue.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.blue.withValues(alpha: 0.3)),
        ),
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
