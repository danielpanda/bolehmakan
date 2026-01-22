# 🍽️ BolehMakan - Health Food Checker

Aplikasi untuk mengecek keamanan makanan bagi penderita **Asam Urat**, **Diabetes**, dan **Kolesterol** dengan konsep **Lampu Lalu Lintas** 🚦

## ✨ Fitur

- 🔍 Pencarian makanan real-time
- 🚦 3 Indikator status kesehatan:
  - 🟢 **Aman (Safe)** - Boleh dikonsumsi
  - 🟡 **Hati-hati (Caution)** - Batasi konsumsi
  - 🔴 **Bahaya (Danger)** - Hindari
- 📱 Responsive Web Design
- 🌙 Dark Mode Premium Theme

## 🛠️ Tech Stack

- **Frontend:** Flutter Web
- **Language:** Dart
- **Backend/DB:** Supabase (PostgreSQL)
- **State Management:** Riverpod
- **Routing:** GoRouter
- **Hosting:** Vercel

## 📂 Struktur Folder (Clean Architecture)

```
lib/
 ├── main.dart
 ├── core/
 │    ├── constants/     # Warna, text, ukuran
 │    ├── router/        # GoRouter config
 │    └── utils/         # Extensions & helpers
 ├── data/
 │    ├── models/        # Data models (JSON)
 │    └── repositories/  # Supabase access
 ├── domain/
 │    ├── entities/      # Business entities
 │    └── usecases/      # Business logic
 └── presentation/
      ├── providers/     # Riverpod providers
      ├── pages/         # Screen pages
      │    ├── home/     # Search page
      │    └── detail/   # Food detail
      └── widgets/       # Reusable components
```

## 🚀 Setup

### 1. Setup Supabase

1. Buat project di [Supabase](https://supabase.com)
2. Jalankan SQL script di `supabase/schema.sql` via SQL Editor
3. Copy **Project URL** dan **anon public key** dari Settings > API

### 2. Konfigurasi App

Edit file `lib/main.dart`:

```dart
await Supabase.initialize(
  url: 'YOUR_SUPABASE_URL',      // Ganti dengan URL kamu
  anonKey: 'YOUR_SUPABASE_ANON_KEY',  // Ganti dengan anon key
);
```

### 3. Run Locally

```bash
# Install dependencies
flutter pub get

# Run di Chrome
flutter run -d chrome
```

### 4. Build untuk Production

```bash
flutter build web --release
```

### 5. Deploy ke Vercel

1. Push ke GitHub
2. Connect repo ke Vercel
3. Set build command: `flutter build web --release`
4. Set output directory: `build/web`
5. Deploy! 🎉

## 🗄️ Database Schema

| Column             | Type   | Description                             |
| ------------------ | ------ | --------------------------------------- |
| id                 | uuid   | Primary key                             |
| name               | text   | Nama makanan                            |
| image_url          | text   | URL gambar                              |
| gout_status        | text   | Status asam urat (safe/caution/danger)  |
| diabetes_status    | text   | Status diabetes (safe/caution/danger)   |
| cholesterol_status | text   | Status kolesterol (safe/caution/danger) |
| notes              | text   | Catatan/penjelasan                      |
| tags               | text[] | Keywords untuk search                   |

## 📝 Lisensi

MIT License - Bebas digunakan untuk belajar dan development.

---

Made with 💚 by BolehMakan Team
