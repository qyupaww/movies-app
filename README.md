# Movies App

Flutter aplikasi katalog film yang terintegrasi dengan TMDB API, menggunakan arsitektur BLoC, Retrofit, Dio, dan JSON Serializable. Proyek ini menampilkan hero highlight, daftar horizontal per kategori, pencarian film, detail film, serta fitur favorit yang tersimpan lokal.

## Fitur

- Home dengan beberapa section data dari TMDB:
  - Trending Day, Trending Week, dan genre: Comedy, Drama, History, Horror (`lib/bloc/home_bloc/home_bloc.dart:27–66`).
- Hero movie highlight yang responsif dengan overlay dan metadata ringkas (`lib/widgets/hero_movie_widget.dart:12–99`).
- Daftar horizontal per section dengan navigasi ke detail (`lib/widgets/horizontal_movie_list.dart:25–55`).
- Pencarian dengan debounce dan hasil grid (`lib/views/search_screen.dart:20–44`, `lib/widgets/search_bar_widget.dart:37–97`).
- Halaman detail film: backdrop, informasi, genre, aksi, dan rekomendasi serupa (`lib/views/movie_detail_screen.dart:18–43`, `lib/widgets/movie_body_widget.dart:27–168`).
- Favorit tersimpan lokal menggunakan SharedPreferences (`lib/service/shared_preferences.dart:21–84`, integrasi BLoC di `lib/bloc/movie_detail_bloc/movie_detail_bloc.dart:49–69`).
- Placeholder aman untuk gambar yang gagal dimuat (`lib/widgets/rounded_image_widget.dart:17–26`).

## Arsitektur & Alur

- State management: BLoC (`flutter_bloc`).
  - `HomeBloc` mengambil beberapa endpoint TMDB lalu membentuk `MovieSection` untuk UI home (`lib/bloc/home_bloc/home_bloc.dart:68–101`).
  - `SearchBloc` memuat Now Playing saat inisialisasi dan melakukan pencarian via query (`lib/bloc/search_bloc/search_bloc.dart:20–35, 37–55`).
  - `MovieDetailBloc` mengambil detail dan film serupa, serta toggle favorit (`lib/bloc/movie_detail_bloc/movie_detail_bloc.dart:11–21, 49–69`).
- Networking: Dio + Retrofit dengan interceptor token Bearer (`lib/service/token_interceptor.dart:5–10`).
- Model data: `json_serializable` (`lib/model/…` dengan file `*.g.dart`).
- Navigasi: `Navigator.push` dari list dan grid ke detail (`lib/widgets/horizontal_movie_list.dart:33–49`, `lib/widgets/vertical_movie_grid_widget.dart:47–63`).
- UI komponen:
  - Grid responsif untuk hasil (`lib/widgets/vertical_movie_grid_widget.dart:25–66`).
  - List horizontal untuk section (`lib/widgets/horizontal_movie_list.dart`).
  - Komponen aksi seperti CTA dan icon-label (`lib/widgets/cta_button_widget.dart`, `lib/widgets/icon_label_widget.dart`).

## Dependensi Utama

- `flutter_bloc` untuk BLoC.
- `dio`, `retrofit`, `retrofit_generator` untuk HTTP client.
- `json_annotation`, `json_serializable`, `build_runner` untuk serialisasi model.
- `shared_preferences` untuk penyimpanan lokal favorit.

Lihat `pubspec.yaml` untuk versi lengkap (`pubspec.yaml:9–28`).

## Konfigurasi API

- Token Bearer TMDB diset di `lib/service/api_key.dart`. Interceptor akan menambahkan header `Authorization: Bearer <token>` ke setiap request (`lib/service/token_interceptor.dart:5–10`).
- Pastikan token valid dan memiliki scope `api_read`.

## Menjalankan Proyek

1. Install dependencies:
   ```bash
   flutter pub get
   ```
2. Generate file `*.g.dart` (model dan Retrofit):
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```
3. Jalankan aplikasi:
   ```bash
   flutter run
   ```

## Struktur Proyek Singkat

- `lib/views/…`: layar utama (`home_screen.dart`, `search_screen.dart`, `my_list_screen.dart`, `movie_detail_screen.dart`, `main_navigator_screen.dart`).
- `lib/bloc/…`: logika state (home, search, list, movie_detail).
- `lib/service/…`: HTTP client, interceptor, shared preferences.
- `lib/model/…`: model data dan file generate.
- `lib/widgets/…`: komponen UI yang dapat digunakan kembali.
