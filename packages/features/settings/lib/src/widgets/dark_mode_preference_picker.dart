import 'package:component_library/component_library.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/settings.dart';
import 'package:settings/src/bloc/settings_bloc.dart';

class DarkModePreferencePicker extends StatelessWidget {
  const DarkModePreferencePicker({
    required this.currentValue,
    super.key,
  });

  final DarkModePreference currentValue;

  @override
  Widget build(BuildContext context) {
    final theme = NewsTheme.of(context)!;
    final l10n = SettingsLocalizations.of(context);
    final bloc = context.read<SettingsBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.themeModeTitle,
          style: theme.text.titleMedium,
        ),
        const SizedBox(height: Spacing.medium),
        ...getRadioTileList(context).map(
          (tile) => RadioListTile<DarkModePreference>(
            activeColor: theme.colors.primary,
            value: tile.preference,
            groupValue: currentValue,
            onChanged: (newOption) =>
                _handleDarkModePreferenceChanged(bloc, newOption),
            title: Text(
              tile.title,
              style: theme.text.titleSmall,
            ),
          ),
        ),
      ],
    );
  }

  void _handleDarkModePreferenceChanged(
    SettingsBloc bloc,
    DarkModePreference? preference,
  ) {
    bloc.add(
      SettingsDarkModePreferenceChanged(
        preference ?? DarkModePreference.useSystemSettings,
      ),
    );
  }
}

List<Tile> getRadioTileList(BuildContext context) {
  final l10n = SettingsLocalizations.of(context);
  return [
    Tile(
      l10n.darkModePreferenceAlwaysLightLabel,
      DarkModePreference.alwaysLight,
    ),
    Tile(
      l10n.darkModePreferenceAlwaysDarkLabel,
      DarkModePreference.alwaysDark,
    ),
    Tile(
      l10n.darkModePreferenceUseSystemSettingsLabel,
      DarkModePreference.useSystemSettings,
    )
  ];
}

class Tile {
  Tile(this.title, this.preference);

  final String title;
  final DarkModePreference preference;
}
