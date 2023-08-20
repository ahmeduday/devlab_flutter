import 'package:devlab_flutter/src/layout/yaru/providers/is_drawer_open_provider.dart';
import 'package:devlab_flutter/src/layout/yaru/ui/ui_menu.dart';
import 'package:devlab_flutter/src/settings/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart' as responsive;

class AppLayout extends ConsumerWidget {
  final Widget? child;

  const AppLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context, ref) {
    final settings = ref.watch(settingsProvider);

    ThemeData theme(bool highContrast, ThemeMode themeMode) {
      if (themeMode == ThemeMode.dark) {
        if (highContrast) {
          return ThemeData(
            colorScheme: const ColorScheme.highContrastDark(),
          );
        } else {
          return ThemeData(
            colorScheme: const ColorScheme.dark(),
          );
        }
      } else {
        //light mode
        if (highContrast) {
          return ThemeData(
            colorScheme: const ColorScheme.highContrastLight(),
          );
        } else {
          return ThemeData(
            colorScheme: const ColorScheme.light(),
          );
        }
      }
    }

    return Theme(
      data: theme(settings.highContrast, settings.themeMode).copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: settings.colorSeed),
      ), // YaruThemeData(highContrast: settings.highContrast, variant: settings.yaruVariant, themeMode: settings.themeMode),
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  responsive.ResponsiveVisibility(
                    hiddenWhen: const [responsive.Condition.smallerThan(name: 'TABLET_LARGE')],
                    visible: !ref.watch(isDrawerOpenProvider),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 5,
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            width: 1,
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ),
                      ),
                      child: const UiMenu(),
                    ),
                  ),
                  Expanded(
                    child: child ?? const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
