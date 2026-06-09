# Proje Yapısı ve Klasörleme Standartları

## 📁 Katalog Uygulaması - Dosya Yapısı

```
catalog_app/
├── android/                          # Android platform ayarları
├── ios/                              # iOS platform ayarları
├── linux/                            # Linux platform ayarları
├── macos/                            # macOS platform ayarları
├── windows/                          # Windows platform ayarları
├── web/                              # Web platform ayarları
├── test/                             # Test dosyaları
├── lib/
│   ├── main.dart                     # Uygulama giriş noktası
│   │
│   ├── constants/                    # Sabit değerler
│   │   ├── colors.dart               # Renk paleti, tema oluşturma
│   │   ├── strings.dart              # Uygulama metinleri
│   │   └── assets.dart               # API endpoint ve sabitler
│   │
│   ├── models/                       # Veri modelleri
│   │   ├── product.dart              # Ürün modeli
│   │   └── cart_item.dart            # Sepet öğesi modeli
│   │
│   ├── state/                        # Uygulama durumu
│   │   └── app_state.dart            # Favori ve sepet yönetimi
│   │
│   ├── screens/                      # Sayfalar
│   │   ├── home_screen.dart          # Ana sayfa
│   │   ├── product_detail_screen.dart# Ürün detay sayfası
│   │   ├── favorites_screen.dart     # Favoriler
│   │   └── cart_screen.dart          # Sepet ekranı
│   │
│   ├── widgets/                      # Tekrar kullanılabilir bileşenler
│   │   ├── product_card.dart         # Ürün kartı
│   │   └── banner_widget.dart        # Banner alanı
│   │
│   └── services/                     # API ve iş mantığı
│       └── api_service.dart          # API çağrıları
│
├── pubspec.yaml                      # Flutter proje konfigürasyonu
├── analysis_options.yaml             # Dart analiz ayarları
├── PROJECT_GUIDE.md                  # Detaylı proje rehberi
├── QUICK_START.md                    # Hızlı başlangıç
├── DELIVERY_NOTES.md                 # Teslim notları
├── DELIVERY_SUMMARY.md               # Teslim özeti
└── README.md                         # Proje özeti
```

## 📂 Klasörlerin Amaçları

### 1. `lib/main.dart`

- Uygulamanın giriş noktası
- Routing ve tema ayarları
- `AppStateProvider` ile global durum yönetimini sağlar

### 2. `lib/constants/`

**Amaç**: Uygulamada tekrar kullanılan sabit değerleri merkezi şekilde yönetmek

- **colors.dart**: Renk paleti ve tema değerleri
- **strings.dart**: Uygulama metinleri
- **assets.dart**: API uç noktaları ve sabit kaynaklar

**Avantajları**:

- Merkezi konfigürasyon
- Kolay güncelleme
- Tekrar kullanılabilirlik

### 3. `lib/models/`

**Amaç**: Veri modellerini tanımlamak

- **product.dart**: Ürün veri modeli
- **cart_item.dart**: Sepet öğesi modeli

**Kullanım**:

```dart
Product product = Product.fromJson(jsonData);
CartItem item = CartItem(product: product, quantity: 1);
```

### 4. `lib/state/`

**Amaç**: Uygulama durumunu yönetmek

- **app_state.dart**: Favori ürünler ve sepet öğeleri
- `AppStateProvider` ile widget ağacına değişiklikleri iletir

### 5. `lib/screens/`

**Amaç**: Uygulama sayfalarını tanımlamak

- **home_screen.dart**: Ürün listesi, arama, sıralama, navigasyon
- **product_detail_screen.dart**: Ürün detayı, favori, sepete ekleme
- **favorites_screen.dart**: Favori ürünlerin listelenmesi
- **cart_screen.dart**: Sepet içeriğinin görüntülenmesi

### 6. `lib/widgets/`

**Amaç**: Tekrar kullanılabilir UI bileşenleri

- **product_card.dart**: Ürün kartı bileşeni
- **banner_widget.dart**: Banner alanı bileşeni

### 7. `lib/services/`

**Amaç**: Veri ve API işlemlerini soyutlamak

- **api_service.dart**: API çağrıları ve JSON verisini modellemeye dönüştürme

## 🏗️ Klasörleme Standartları

### Dosya Adlandırma

- **PascalCase**: Sınıf adları (`Product`, `HomeScreen`)
- **snake_case**: Dosya adları (`product.dart`, `home_screen.dart`)
- **camelCase**: Değişken ve yöntem adları

### İçerik Organizasyonu

```dart
1. importlar
2. sabitler/const değerler
3. sınıf tanımı
4. build metotları
5. yardımcı metotlar
```

### Folder Organization İlkeleri

1. **By Feature**: Ekrana/özelliğe göre ayırmak
2. **By Layer**: Model, servis, durum, UI katmanları
3. **By Type**: Yineleme azaltmak için türlere ayırmak

## 🔄 Veri Akışı

```
API Service
    ↓
Model (Product / CartItem)
    ↓
State (AppState)
    ↓
Screen (HomeScreen / Detail / Cart / Favorites)
    ↓
Widget (ProductCard / BannerWidget)
    ↓
UI Render
```
