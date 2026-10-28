# 📝 CatatanKu — Desain UI Aplikasi Catatan Harian Sederhana

Aplikasi mobile antarmuka pengguna (UI) modern, elegan, dan interaktif yang dibangun menggunakan **Flutter (Dart)** untuk memenuhi **Tugas Individual 02: Uji Pemahaman Fase 2 - Perancangan (Design)**.

---

## 🎯 Spesifikasi & Fitur 5 Halaman

Sesuai dengan ketentuan tugas, aplikasi ini dirancang khusus dengan **5 halaman utama**:

### 1. 🚀 Splash Screen (`lib/screens/splash_screen.dart`)
- **Logo & Identitas Brand**: Ikon catatan dengan visual gradien modern dan bayangan halus berkelas.
- **Nama & Tagline**: *"CatatanKu — Simpan setiap ide, rencana, dan momen berharga dalam satu tempat."*
- **Transisi Dinamis**: Animasi fade-in dan scale-up halus, indikator loading melingkar, serta tombol aksi cepat *"Lanjutkan ke Masuk"* menuju Login Screen.

### 2. 🔐 Login Statis (`lib/screens/login_screen.dart`)
- **UI Form Bersih**: Input *Alamat Email* dan *Kata Sandi* lengkap dengan ikon dan tombol toggle visibilitas sandi (tampil/sembunyikan).
- **Fitur Pelengkap**: Checkbox *"Ingat saya"*, tombol *"Lupa kata sandi?"*, dan tombol utama *"Masuk Sekarang"*.
- **Opsi Masuk Sosial**: Tombol masuk cepat via *Google* (*Masuk dengan Google*).
- **Navigasi Mulus**: Masuk langsung menghubungkan pengguna ke Beranda tanpa kendala backend.

### 3. 🏠 Beranda / Daftar Catatan Harian (`lib/screens/home_screen.dart`)
- **Greeting Pengguna**: Sapaan ramah *"Halo, Shafwan 👋"*, avatar bergradasi, dan tanggal hari ini.
- **Ringkasan Aktivitas**: Banner informatif menampilkan total catatan dan jumlah catatan berbintang/favorit.
- **Pencarian Interaktif (Live Search)**: Filter pencarian langsung berdasarkan kata kunci pada judul maupun isi catatan.
- **Filter Kategori Cepat**: Pilihan chip kategori (*Semua, Ide, Pekerjaan, Kuliah, Pribadi, Jurnal, Keuangan*) dengan icon dan animasi seleksi halus.
- **Kartu Catatan (NoteCard)**: Kartu dengan nuansa warna pastel, label kategori, badge prioritas (*Tinggi, Sedang, Rendah*), ikon pin semat (bisa disematkan/lepas langsung dari kartu), status bintang favorit, dan tanggal pembaruan.
- **Floating Action Button (FAB)**: Tombol *"Catatan Baru"* dengan efek gradien dan bayangan dinamis.
- **Bottom Navigation Bar**: Navigasi 4 tab konsisten (*Beranda, Disematkan, Favorit, Profil*).

### 4. ✍️ Tambah Catatan (`lib/screens/add_note_screen.dart`)
- **Formulir Input Data**:
  - Kolom **Judul Catatan** (tipografi tebal dan responsif).
  - Kolom **Isi Catatan** (multiline textarea yang luas dan nyaman untuk mengetik).
- **Pemilih Kategori**: Pilihan kategori berbasis *ChoiceChips* interaktif.
- **Palet Warna Aksen**: 6 pilihan warna pastel (*Nila, Biru Langit, Mint Segar, Kuning Hangat, Merah Muda, Lavender*) dengan indikator seleksi aktif.
- **Tingkat Prioritas**: Pilihan tingkat urgensi (*Rendah, Sedang, Tinggi*) berbalut badge warna indikator.
- **Fitur Sematkan (Pin)**: Opsi sakelar (*Switch*) untuk menyematkan catatan penting ke daftar paling atas.
- **Validasi & Simpan**: Validasi kelengkapan form, notifikasi sukses (*SnackBar*), dan penambahan instan ke daftar catatan.

### 5. 📖 Detail Catatan (`lib/screens/note_detail_screen.dart`)
- **Header Informasi Catatan**: Kartu hero dengan warna aksen sesuai pilihan catatan, badge kategori, badge prioritas, dan tanggal lengkap.
- **Tipografi Nyaman**: Judul tajam dan isi catatan penuh dengan jarak baris (*line-height*) yang ramah di mata.
- **Statistik Bacaan**: Menghitung otomatis **Jumlah Kata** dan **Jumlah Karakter**.
- **Aksi Cepat Interaktif**:
  - ⭐ **Toggle Favorit**: Menandai bintang catatan.
  - 📋 **Salin / Bagikan**: Menyalin teks catatan ke clipboard perangkat.
  - ✏️ **Edit Catatan**: Mengubah judul, isi, dan kategori secara live melalui bottom sheet editor.
  - 🗑️ **Hapus Catatan**: Dilengkapi dialog konfirmasi modal sebelum catatan dihapus.

---

## 📁 Struktur Proyek (Clean Architecture)

```
lib/
├── main.dart                      # Entry point, locale init, responsive mobile wrapper
├── models/
│   └── note_model.dart            # Data model catatan & enum prioritas
├── data/
│   └── dummy_data.dart            # Sample dataset statis & state repository (ChangeNotifier)
├── theme/
│   ├── app_colors.dart            # Definisi token warna primer, netral, prioritas, & pastel
│   └── app_theme.dart             # ThemeData Material 3, tipografi, dan gaya tombol/kartu
├── screens/
│   ├── splash_screen.dart         # Halaman 1: Splash Screen
│   ├── login_screen.dart          # Halaman 2: Login Statis
│   ├── home_screen.dart           # Halaman 3: Beranda (Daftar Catatan)
│   ├── add_note_screen.dart       # Halaman 4: Tambah Catatan
│   ├── note_detail_screen.dart    # Halaman 5: Detail Catatan
│   └── profile_screen.dart        # Halaman 6: Profil Pengguna (Shafwan)
└── widgets/
    ├── custom_button.dart         # Reusable primary & outlined buttons
    ├── custom_text_field.dart     # Reusable text fields
    ├── category_chip.dart         # Filter chip kategori animasi
    ├── note_card.dart             # Kartu catatan pastel interaktif
    ├── priority_badge.dart        # Badge prioritas berwarna
    └── google_logo.dart           # Logo asli 4-warna Google (vektor presisi)
```

---

## 🚀 Cara Menjalankan Aplikasi

Pastikan Flutter SDK sudah terpasang di komputer Anda.

1. **Jalankan melalui Web (Google Chrome)**:
   ```bash
   flutter run -d chrome
   ```

2. **Jalankan melalui Desktop (Windows)**:
   ```bash
   flutter run -d windows
   ```

3. **Menjalankan Pengujian Otomatis (Unit & Widget Test)**:
   ```bash
   flutter test
   ```

4. **Memeriksa Kerapian Kode**:
   ```bash
   flutter analyze
   ```
   *(Hasil: No issues found!)*

---

## 🎨 Keunggulan Desain UI CatatanKu

1. **Aset Visual & Tata Letak Eksklusif**: Menggunakan hierarki visual modern dengan *soft shadows*, *curved corners (16-24px)*, dan *pastel backgrounds* yang lembut di mata.
2. **Mobile Frame Wrapper**: Ketika dibuka di layar desktop atau browser komputer, aplikasi secara otomatis dibungkus dengan bingkai mobile responsif berbayangan mewah, memberikan pengalaman preview yang menyerupai gawai sungguhan.
3. **Interaktivitas Penuh**: Meskipun berjalan secara statis (tanpa server backend), seluruh aksi (menambah, mencari kata kunci, memfilter kategori, menyematkan, memfavoritkan, mengedit, dan menghapus) berfungsi secara in-memory secara *real-time*.
