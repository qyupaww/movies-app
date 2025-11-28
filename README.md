# Movix

Flutter aplikasi katalog film yang terintegrasi dengan TMDB API, menggunakan arsitektur State Management BLoC, Retrofit, Dio, dan JSON Serializable. App ini menampilkan, daftar movies per kategori, pencarian film, detail film, serta fitur favorit yang tersimpan lokal.

## Fitur

- Home dengan beberapa section data dari TMDB:
  - Trending Day, Trending Week, dan genre: Comedy, Drama, History, Horror (`lib/bloc/home_bloc/home_bloc.dart:27–66`).
- Daftar horizontal per section dengan navigasi ke detail (`lib/widgets/horizontal_movie_list.dart:25–55`).
- Pencarian dengan debounce dan hasil grid (`lib/views/search_screen.dart:20–44`, `lib/widgets/search_bar_widget.dart:37–97`).
- Halaman detail film: backdrop, informasi, genre, aksi, dan rekomendasi serupa (`lib/views/movie_detail_screen.dart:18–43`, `lib/widgets/movie_body_widget.dart:27–168`).
- Favorit tersimpan lokal menggunakan SharedPreferences (`lib/service/shared_preferences.dart:21–84`, integrasi BLoC di `lib/bloc/movie_detail_bloc/movie_detail_bloc.dart:49–69`).
- Placeholder aman untuk gambar yang gagal dimuat (`lib/widgets/rounded_image_widget.dart:17–26`).
- Pagination UI untuk mengurangi beban render awal:
  - Horizontal list menambah item saat mendekati ujung scroll (`lib/widgets/horizontal_movie_list.dart:35–47, 94–95`).
  - Grid menambah item via tombol “Load More” (`lib/widgets/vertical_movie_grid_widget.dart:126–149`).
- Autentikasi & Profil (mock lokal):
  - Login menyimpan user di `SharedPreferences` (`lib/bloc/auth_bloc/auth_bloc.dart:20–34`, `lib/service/shared_preferences.dart:20–48`).
  - Tab Profile untuk melihat info dan logout (`lib/views/main_navigator_screen.dart:40–45, 110–119`; `lib/views/profile_screen.dart:1–163`).

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
- Autentikasi lokal:
  - `AuthBloc` mengelola status login/logout (`lib/bloc/auth_bloc/auth_bloc.dart:1–45`).
  - `ProfileScreen` menampilkan form login atau profil jika sudah login (`lib/views/profile_screen.dart:1–163`).

## Dependensi Utama

- `flutter_bloc` untuk BLoC.
- `dio`, `retrofit`, `retrofit_generator` untuk HTTP client.
- `json_annotation`, `json_serializable`, `build_runner` untuk serialisasi model.
- `shared_preferences` untuk penyimpanan lokal favorit.

Lihat `pubspec.yaml` untuk versi lengkap (`pubspec.yaml:9–28`).

## Konfigurasi API

- Token Bearer TMDB diset di `lib/service/api_key.dart`. Interceptor akan menambahkan header `Authorization: Bearer <token>` ke setiap request (`lib/service/token_interceptor.dart:5–10`).
- Pastikan token valid dan memiliki scope `api_read`.

## Autentikasi & Profil

- Implementasi saat ini adalah mock lokal untuk demonstrasi alur UI.
- Data user disimpan di `SharedPreferences` dengan kunci `user_key` (`lib/service/shared_preferences.dart:3, 20–48`).
- Mengaktifkan tab Profile di bottom navigation (`lib/views/main_navigator_screen.dart:40–45, 110–119`).
- Untuk produksi, integrasikan Firebase Auth atau backend sendiri, dan ganti penyimpanan user ke database/cloud.

## Menjalankan Proyek

1. Install dependencies:
   ```bash
   flutter pub get
   ```
2. Generate file `*.g.dart` (model dan Retrofit):
   ```bash
   dart run build_runner build
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
- `lib/bloc/auth_bloc/…`: manajemen autentikasi lokal.
- `lib/views/profile_screen.dart`: layar login/profil.

## Troubleshooting

- Error otentikasi TMDB: periksa isi token dan interceptor Bearer aktif.
- Build runner konflik: gunakan `--delete-conflicting-outputs` saat generate.
