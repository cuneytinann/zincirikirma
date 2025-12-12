

# Zinciri Kırma (Alışkanlık Takip Aracı)

Bu proje, Jerry Seinfeld’in **“Don’t Break the Chain / Zinciri Kırma”** yaklaşımından ilham alan, tarayıcı üzerinde çalışan, çevrimdışı kullanılabilen bir alışkanlık takip aracıdır.

Kod tabanı, anlamlı değişken isimleri ve yerinde kullanılan yorum satırları sayesinde **okunabilirliği yüksek** olacak şekilde tasarlanmıştır; ayrıca parçalı ama aynı zamanda **minimal** mimarisi sayesinde yeni özellik eklemek veya mevcut davranışı değiştirmek oldukça kolaydır.

Uygulama iki temel zincir modunu destekler:

* **Tarihe bağlı zincirler**
* **Sayıya bağlı zincirler**

Yeni sürüm ayrıca yapılandırılmış sekmeler, iyileştirilmiş grid sistemi ve kapsamlı validasyon mekanizmaları içerir.

---

## Arayüz Görselleri

Aşağıdaki görüntüler uygulamanın farklı bölümlerine aittir:

![Arayüz 1](images/arayuz1-zincirikirma.png)

![Arayüz 2](images/arayuz2-zincirikirma.png)

![Arayüz 3](images/arayuz3-zincirikirma.png)

![Arayüz 4](images/arayuz4-zincirikirma.png)

![Arayüz 5](images/arayuz5-zincirikirma.png)


Mobile Cihazlarda: 

![Arayüz 6](images/arayuz6-zincirikirma.jpg)

---

## 1. Öne Çıkan Değişiklikler

* Sade grid tasarımı
* Tarihli / sayı bazlı iki mod
* Geliştirilmiş validasyon
* Akıllı grid hesaplama
* Mobil uyumlu panel
* Minimal UI

---

## 2. Özellikler

### 2.1. Çevrimdışı kullanım

Tüm veriler tarayıcı `localStorage` içinde saklanır. Yedekleme JSON formatında yapılabilir.

### 2.2. Zincir modları

#### Tarihli Zincir

* Tarih aralığı + seçili günlere göre otomatik hesaplama
* Ay/yıl geçişlerini belirten görsel ayrımlar

#### Sayı Bazlı Zincir

* Toplam halkaya göre kareye yakın grid üretir
* Manuel satır–sütun değişiklikleri en yakın geçerli düzene yuvarlanır

### 2.3. Akıllı Grid Hesaplamaları

* Tarihli modda sütunlar gün sayısına göre hesaplanır
* Sayı modunda en kareye yakın düzen bulunur

### 2.4. X İşaretleri

* Hücreye tıklama ile jitter efektli el yazısı X eklenir
* İkinci tıklamada silinir
* Yedeklerde saklanır

### 2.5. Sekmeli çoklu zincir yönetimi

* Üstte her zincir için sekme
* Zincir silme yalnızca aktif zinciri etkiler

### 2.6. JSON Yedekleme

* Tüm zincirleri JSON olarak indirin
* Yedekten yüklemede ID çakışmaları çözülür

---

## 3. Hata ve Validasyon Sistemi

### 3.1. Hata türleri:

* Eksik zincir adı
* Geçersiz tarih aralığı
* Tarihli modda gün seçilmemesi
* Sayı modunda geçersiz toplam değer
* Hatalı JSON dosyası

### 3.2. Otomatik temizleme

* Hata mesajları belirli süre sonra kaybolur
* Glow durumları düzeltildikçe otomatik temizlenir

---

## 4. Kullanım Akışı

1. Mod seçin
2. Zincir adını girin
3. Tarihli modda tarih + gün seçin
4. Sayı modunda toplam halkaları girin
5. Satır–sütun düzenini kontrol edin
6. Zinciri ekleyin
7. Hücreleri X ile işaretleyin
8. Yedek alın veya geri yükleyin

---

## 5. Teknik Mimarinin Özeti

* Tek sayfalık HTML–CSS–JS yapı
* JS tarafında dinamik grid üretimi
* SVG jitter path ile X çizimleri
* Global minimal durum yönetimi
* Modüler ve düzenlenmesi kolay kod yapısı

---

## 6. Number Input Kullanımı (Mobil + Masaüstü)

### Mobilde:

* `input[type="number"]` okları görünmeyebilir
* Kullanıcı numerik klavyeden değer girer
* Sistem girilen değeri **en yakın geçerli grid değerine** yuvarlar
* Büyük değerlerde grid bozulmaz

### Masaüstünde:

* Artı/eksi okları ile adımlı değişim mümkündür
* Manuel girişlerde otomatik doğrulama aktiftir

---

### 7. Tema ve Renk Özelleştirme

Uygulama içerisinde arayüzün neredeyse tüm görsel bileşenlerinin rengi kullanıcı tarafından değiştirilebilir.

* Arka plan, yazılar, hücreler, grid çizgileri ve X işaretleri için renk özelleştirme
* Yapılan renk değişiklikleri **localStorage** üzerinde otomatik olarak saklanır
* İstenildiği zaman **varsayılan (default) tema ayarlarına geri dönülebilir**
* Tema ayarları sayfa yenilense dahi korunur

> Notlar:
> * Bu özellik henüz **responsive değildir** ve **sadece masaüstü (desktop)** görünümünde kullanılabilir.


## 8. Roadmap / Yakında Gelecek Özellikler

### 8.1. Yazdırılabilir Tablo Üretimi (Dijital Olmayan Zincir Kullanımı)

Dijital takipten bağımsız olarak, zincir kırma metodolojisi için
yazdırılabilir, boş ve işaretlenmeye hazır tablolar üretimi.

* Word ve PDF gibi ortamlarda kullanılabilecek **yazıcı uyumlu tablolar**
* Önceden işaretlenmiş hücreler olmadan, **tamamen boş tablo üretimi**
* Zincir mantığına uygun:
  * Satır / sütun sayısı
  * Gün / blok / dönem bazlı yapı
* Tek sayfa veya çok sayfalı tablo düzenleri
* Çıktı öncesinde tüm yapısal ayarların belirlenebilmesi
* HTML üzerinde manuel düzenleme gerektirmeden,
  **doğrudan çıktı almaya odaklı üretim**

> Bu yapı, uygulamanın dijital modlarından bağımsızdır ve
> fiziksel (kağıt) zincir takibi için tasarlanmıştır.

### 8.2. Tema ve Tablo Ayarlarında Responsive Destek

* Tema, renk ve tablo ayar panellerinin mobil ve tablet uyumluluğu
* Farklı ekran boyutlarında tutarlı ayar deneyimi

### 8.3. Preset Ayar Yönetimi

Uygulama içerisindeki renk, tablo ve yapı ayarlarının preset’ler halinde yönetilmesi.

* Ayarların **preset olarak kaydedilebilmesi**
* Preset’lerin **aktarılabilir ve paylaşılabilir** hale getirilmesi
* Preset içe / dışa aktarma desteği
* Varsayılan ayarlara tek tıkla geri dönüş


### 8.4. Full English UI Support

* Tüm arayüzün İngilizce çalışmasını sağlayan tam çeviri modu
* Hata mesajları, butonlar, açıklamalar, grid metinleri dahil tüm metin seti
* Dil seçici veya otomatik tarayıcı dil algılama
* Yedekleme dosyalarına dil bilgisi eklenmesi (opsiyonel)

---

## 9. Kurulum ve Çalıştırma

1. Projeyi indirin veya klonlayın
2. `zincirikirma.html` dosyasını bir tarayıcıda açın
3. Tüm özellikler çevrimdışı çalışır
4. İsterseniz GitHub Pages, Netlify, Vercel vb. ile yayınlayabilirsiniz
