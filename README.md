# Flutter Contact & SMS Backup App

A Flutter mobile application built in **2025** for a Master's-level Mobile Programming module (M1 Information Systems & AI).

The project focuses on data synchronization between the Android device and cloud storage: contacts, SMS messages, and interaction-based favorites.

## Project Context (2025 Academic Work)

This repository is a portfolio-ready revision of the original coursework.

Original module context:
- Course: Mobile Programming (ESISA)
- Supervisor: M. Lahmer
- Year: 2025

Core goals of the assignment-aligned implementation:
- Build a real mobile app with platform-specific permissions.
- Read and process device-native data (contacts and SMS).
- Implement local persistence and cloud backup/restore workflows.
- Structure the app with maintainable layers and clear responsibilities.

## Assignment Requirement Coverage (English Mapping)

Below is a direct mapping of the provided assignment statement to this implementation.

1. **Save/restore contacts and SMS from Firebase, identified by Google account email**
- Implemented through Firebase Authentication + user-scoped data under `users/<uid>` in Realtime Database.
- Google-based identity is integrated in the service layer and app architecture.

2. **Export/Import SMS, Contacts, and Favorites between phone and cloud database**
- Contacts: device read + cloud backup/restore flow implemented.
- SMS: device read + cloud backup/restore flow implemented.
- Favorites: local SQLite persistence first, then cloud sync/restore logic.

3. **Prefer update-aware backup/restore (date-based updates)**
- Sync service includes timestamp-based incremental logic patterns (`last_sync_time`, selective backup strategy).
- Notes: as in most academic prototypes, edge-case conflict resolution can still be hardened.

4. **Contacts view requirements (full name, photo, creation date, phones/emails, favorite icon)**
- Contact UI includes display name, avatar, phones/emails, metadata, and favorite handling.

5. **SMS view requirements (group by contact, show summary then expand messages)**
- SMS messages are grouped by contact/address and rendered with expandable conversation UI.

6. **Favorites view requirements (contact + call count + SMS count, tap to call/SMS)**
- Favorites screen displays interaction counters and quick actions (call/message).
- Counts are stored in SQLite and updated through service methods.

7. **Open design constraint**
- UI is custom Material 3-based and not locked to a provided design template.

8. **Firebase setup and test users**
- README setup includes Firebase project creation/configuration workflow.
- App behavior assumes authenticated users and user-scoped data for test scenarios.

9. **Realtime DB/Firestore structure guidance**
- Current implementation uses Firebase Realtime Database with user data domains for contacts, sms, and favorites.

## Features Implemented

- Firebase Authentication integration (Google + email/password flows in the app architecture).
- Contacts read from device and backup to Firebase Realtime Database.
- SMS read (inbox/sent), cloud backup, and restore pipeline.
- Favorites management with local SQLite statistics (call/SMS interactions).
- Manual backup/restore screen.
- Material 3 UI with Provider-based state management.

## Concepts & Techniques Used

This project demonstrates practical usage of:

- **State management**: `provider` + `ChangeNotifier`.
- **Layered architecture**: `models`, `services`, `views`, `widgets`.
- **Mobile permissions**: runtime permission handling (`contacts`, `sms`, phone-related operations).
- **Device data access**: contact and SMS querying through Flutter plugins.
- **Cloud sync patterns**: user-scoped backup/restore in Firebase Realtime Database.
- **Local persistence**: SQLite schema design, indexing, and CRUD operations.
- **Platform channels**: Android method channel usage for SMS write/delete operations.
- **Defensive UI lifecycle handling**: mounted/context safety around async flows.
- **Static quality checks**: analyzer-driven cleanup and widget-test validation.

## Technical Stack

- `Flutter` / `Dart`
- `provider`
- `firebase_core`, `firebase_auth`, `firebase_database`
- `google_sign_in`
- `flutter_contacts`, `flutter_sms_inbox`, `permission_handler`
- `sqflite`, `path`, `path_provider`
- `url_launcher`

## Project Structure

- `lib/models/`: domain models (`contact`, `sms`, `favorite`).
- `lib/services/`: business/data services (auth, sync, Firebase, local DB).
- `lib/views/`: main screens (auth, contacts, SMS, favorites, backup/restore).
- `lib/widgets/`: reusable UI components.

## Deep Revision Summary (Final Review)

During the final revision pass, the project was hardened for public sharing:

- Converted documentation to fully professional English.
- Removed unnecessary package dependencies.
- Addressed analyzer warnings and asynchronous UI safety issues.
- Validated repository health with:
	- `flutter analyze` -> no issues
	- `flutter test` -> passing

## Why This Project Is Relevant for Recruiters

- It is not a toy counter app; it interacts with real mobile data and permission boundaries.
- It combines cloud integration, local storage, and user-facing synchronization workflows.
- It demonstrates engineering discipline through architecture separation and post-delivery cleanup.

## Local Setup

### Prerequisites

- Flutter SDK installed.
- Android Studio or VS Code with Flutter/Dart extensions.
- A configured Firebase project.
- A real Android device is recommended for full SMS/contacts behavior.

### Steps

1. Clone the repository

```bash
git clone <your-repo-url>
cd contact_sms_app-main
```

2. Install dependencies

```bash
flutter pub get
```

3. Configure Firebase

- Android: place `google-services.json` in `android/app/`
- iOS: place `GoogleService-Info.plist` in `ios/Runner/`
- Regenerate `lib/firebase_options.dart` if needed:

```bash
flutterfire configure
```

4. Run the app

```bash
flutter run
```

## Known Constraints

- SMS restore/write behavior depends on Android restrictions and may require default SMS app status.
- Runtime permissions must be granted for end-to-end testing.
- This remains an academic project baseline, not a production-hardened release.

## Security Notes for Public Publishing

- Do not commit sensitive credentials.
- Use your own Firebase project configuration for forks/deployments.
- If sensitive files were committed in older history, clean git history before public release.

## Roadmap

- Add broader unit and widget test coverage.
- Add visual demo assets (screenshots/GIFs).
- Add CI checks (analyze + tests) with GitHub Actions.
- Introduce structured logging and stronger sync conflict handling.

## License

This project is licensed under MIT. See `LICENSE`.
