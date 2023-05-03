import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:settings_repository/settings_repository.dart';

part 'settings_state.dart';
part 'settings_event.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required this.settingsRepository,
  }) : super(
          const SettingsState(),
        ) {
    on<SettingsStarted>(
      (_, emit) async {
        await emit.onEach(
          Rx.combineLatest2<DarkModePreference, LanguagePreference,
              SettingsState>(
            settingsRepository.getDarkModePreference(),
            settingsRepository.getLanguagePreference(),
            (darkModePreference, languagePreference) => SettingsState(
              darkModePreference: darkModePreference,
              languagePreference: languagePreference,
            ),
          ),
          onData: emit.call,
        );
      },
      transformer: (events, mapper) => events.flatMap(
        mapper,
      ),
    );

    on<SettingsDarkModePreferenceChanged>(
      (event, emit) async {
        await settingsRepository.upsertDarkModePreference(
          event.preference,
        );

        emit(
          state.copyWith(
            darkModePreference: event.preference,
          ),
        );
      },
    );

    on<SettingsLanguagePreferenceChanged>(
      (event, emit) async {
        await settingsRepository.upsertLanguagePreference(
          event.preference,
        );

        emit(
          state.copyWith(
            languagePreference: event.preference,
          ),
        );
      },
    );

    add(
      const SettingsStarted(),
    );
  }

  final SettingsRepository settingsRepository;
}
