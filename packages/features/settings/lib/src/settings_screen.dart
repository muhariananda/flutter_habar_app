import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/src/bloc/settings_bloc.dart';
import 'package:settings/src/widgets/dark_mode_preference_picker.dart';
import 'package:settings/src/widgets/language_preference_selector.dart';
import 'package:settings_repository/settings_repository.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    required this.settingsRepository,
    super.key,
  });

  final SettingsRepository settingsRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (_) => SettingsBloc(
        settingsRepository: settingsRepository,
      ),
      child: const SettingsView(),
    );
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = NewsTheme.of(context)!;
    return StyledStatusBar.dark(
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: theme.screenMargin,
                  vertical: Spacing.mediumLarge,
                ),
                child: Column(
                  children: [
                    LanguagePreferenceSelector(
                      currentValue: state.languagePreference,
                    ),
                    const SizedBox(height: Spacing.large),
                    DarkModePreferencePicker(
                      currentValue: state.darkModePreference,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
