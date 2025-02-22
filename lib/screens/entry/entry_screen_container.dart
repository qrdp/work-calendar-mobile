import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:it2g_calendar_mobile/screens/entry/entry_screen.dart';
import 'package:it2g_calendar_mobile/store/settings/settings_map.dart';
import 'package:it2g_calendar_mobile/store/store.dart';

class EntryScreenContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SettingsMapState>(
        builder: (context, mapState) => EntryScreen(
              setServerUrl: mapState.setServerUrl,
            ),
        converter: getSettingsMapState);
  }
}
