import 'package:component_library/component_library.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/settings.dart';
import 'package:settings/src/bloc/settings_bloc.dart';

class LanguagePreferenceSelector extends StatelessWidget {
  const LanguagePreferenceSelector({
    required this.currentValue,
    super.key,
  });

  final LanguagePreference currentValue;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SettingsBloc>();
    final l10n = SettingsLocalizations.of(context);
    final theme = NewsTheme.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: theme.screenMargin,
      ),
      child: DropdownButtonFormField<LanguagePreference>(
        decoration: InputDecoration(
          labelText: l10n.languageTitle,
          border: const OutlineInputBorder(),
        ),
        value: currentValue,
        onChanged: (value) => _handleLanguagePreferenceChanged(bloc, value),
        items: items
            .map(
              (item) => DropdownMenuItem<LanguagePreference>(
                value: item.preference,
                child: Text(item.title),
              ),
            )
            .toList(),
      ),
    );
  }

  void _handleLanguagePreferenceChanged(
    SettingsBloc bloc,
    LanguagePreference? preference,
  ) {
    bloc.add(
      SettingsLanguagePreferenceChanged(
        preference ?? LanguagePreference.en,
      ),
    );
  }
}

final items = [
  MenuItem('English', LanguagePreference.en),
  MenuItem('Indonesia', LanguagePreference.id),
];

class MenuItem {
  MenuItem(this.title, this.preference);

  final String title;
  final LanguagePreference preference;
}
