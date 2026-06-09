#!/bin/bash

# Mini Katalog Uygulaması - Kurulum ve Çalıştırma Script'i

echo "════════════════════════════════════════════════════════════════"
echo "  Mini Katalog Uygulaması - Flutter Setup"
echo "════════════════════════════════════════════════════════════════"
echo ""

# Proje dizinine git
echo "📂 Proje dizinine gidiliyor..."
cd e:/GitHub/Flutter/catalog_app

# Flutter versiyonunu kontrol et
echo ""
echo "🔍 Flutter versiyonu kontrol ediliyor..."
flutter --version

# Bağımlılıkları yükle
echo ""
echo "📥 Bağımlılıklar yükleniyor..."
flutter pub get

# Çözümlenmemiş bağımlılıkları göster
echo ""
echo "🔧 Upgrade kontrol ediliyor..."
flutter pub upgrade --dry-run

# Uygulamayı çalıştır
echo ""
echo "════════════════════════════════════════════════════════════════"
echo "  ✅ Kurulum tamamlandı!"
echo "════════════════════════════════════════════════════════════════"
echo ""
echo "🚀 Uygulamayı çalıştırmak için:"
echo "   flutter run"
echo ""
echo "📱 Android emulator'a kurmak için:"
echo "   flutter run -d android"
echo ""
echo "📱 iOS simulator'a kurmak için:"
echo "   flutter run -d iphone"
echo ""
echo "🌐 Web'de çalıştırmak için:"
echo "   flutter run -d chrome"
echo ""
echo "════════════════════════════════════════════════════════════════"
