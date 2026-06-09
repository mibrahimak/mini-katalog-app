# 📱 Mini Katalog Uygulaması - Flutter

> Flutter ile geliştirilmiş, favori ve sepet destekli bir e-ticaret katalog uygulaması.

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.12.1-blue?style=flat-square&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-SDK-blue?style=flat-square&logo=dart)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)
![Status](https://img.shields.io/badge/Status-Production%20Ready-brightgreen?style=flat-square)

**Eğitim odaklı, modüler ve genişletilebilir bir Flutter katalog uygulaması.**

</div>

---

## 📋 Proje Açıklaması

Mini Katalog Uygulaması, Flutter kullanarak geliştirilen **öğrenme amaçlı** bir mobil uygulamadır. Ürün listeleme, arama, sıralama, favorileme ve sepet yönetimi gibi temel e-ticaret işlevlerini içerir.

---

## ✨ Özellikler

### 🎯 Temel Özellikler

- **Ürün Listesi** - GridView formatında 2 sütunlu katalog
- **Arama & Sıralama** - Ürün adında ve kategoride arama, fiyat/puan sıralama
- **Favoriler** - Beğenilen ürünleri kaydetme
- **Sepet Yönetimi** - Ürünleri miktar bazlı sepete ekleme
- **Ürün Detayı** - Detaylı ürün sayfası ve stok bildirimi
- **Banner Alanı** - Promosyon görüntüsü

### 🎨 UI/UX Özellikleri

- **Dark/Light Tema desteği**
- **Responsive Tasarım**
- **Material Design 3**
- **Animasyonlu geçişler**
- **Loading / Error durum yönetimi**

---

## 🚀 Kurulum ve Çalıştırma Adımları

Projeyi yerel bilgisayarınızda çalıştırmak ve test etmek için aşağıdaki adımları sırasıyla takip edebilirsiniz:

### 1. Gereksinimler

Bilgisayarınızda aşağıdaki araçların kurulu olduğundan emin olun:

- **Flutter SDK** (Önerilen: En güncel kararlı sürüm)
- **Dart SDK**
- **Android Studio** (Android Emulator için) veya fiziksel bir Android cihaz
- **VS Code** (İsteğe bağlı, geliştirme editörü)

### 2. Projeyi Klonlayın veya İndirin

Projeyi bilgisayarınıza indirmek için terminale şu komutu yazın:

```bash
git clone https://github.com/mibrahimak/mini-katalog-app.git
```

(Eğer git kullanmıyorsanız, projeyi ZIP olarak indirip bir klasöre çıkartabilirsiniz.)

```bash
# 1. Proje dizinine geçiş yap
cd catalog_app

# 2. Bağımlılıkları yükle
flutter pub get

# 3. Geliştirme ortamını doğrula
flutter doctor

# 4. Uygulamayı çalıştır
flutter run
```

---

## 📁 Proje Yapısı

```
lib/
├── main.dart
├── constants/          # Renk, metin, API endpoint sabitleri
├── models/             # Veri modelleri
├── screens/            # Uygulama ekranları
├── widgets/            # Tekrar kullanılabilir bileşenler
├── services/           # API servisleri
└── state/              # Uygulama durumu (favori, sepet)
```

---

## 🔌 API Entegrasyonu

API uç noktası `lib/constants/assets.dart` içinde tanımlanır.

- Ürünler: `https://wantapi.com/products.php`
- Banner: `https://wantapi.com/assets/banner.png`

---

## 📚 Belgeler

- [QUICK_START.md](QUICK_START.md) - Hızlı kurulum ve test
- [PROJECT_GUIDE.md](PROJECT_GUIDE.md) - Detaylı proje rehberi
- [FOLDER_STRUCTURE.md](FOLDER_STRUCTURE.md) - Klasör ve mimari düzeni
- [DELIVERY_NOTES.md](DELIVERY_NOTES.md) - Teslim notları

---

## 💻 Çalıştırma Komutları

```bash
# Hot reload
r

# Hot restart
R

# Release build
flutter build apk --release
```

---

## 📊 Proje İstatistikleri

- Dart Dosyaları: 14
- Ekran Sayısı: 4
- Widget Sayısı: 25+
- Model Sayısı: 2
- Servis Sayısı: 1
- Durum Yönetimi: `AppStateProvider`

---

## 🐛 Sorun Giderme

| Sorun                | Çözüm                                   |
| -------------------- | --------------------------------------- |
| Bağımlılık hatası    | `flutter pub get`                       |
| API'den veri gelmedi | İnternet bağlantısını kontrol et        |
| Build hatası         | `flutter clean` sonra `flutter pub get` |

---

## 📞 Kaynaklar

- [Flutter Official](https://flutter.dev)
- [Dart Official](https://dart.dev)
- [Material Design](https://material.io)

---
