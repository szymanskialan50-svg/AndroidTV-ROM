# Android TV ROM - Custom Firmware

To jest struktura **custom ROM** dla Android TV (jak LineageOS, PixelExperience, czy inne custom ROM-y). Pozwala na zbudowanie pełnego systemu operacyjnego Android który można flashować na telewizor.

## ⚠️ WYMAGANIA

### Hardware:
- Komputer z Linux (Ubuntu 20.04 lub nowszy zalecany)
- Minimum 16GB RAM
- 100GB wolnego miejsca na dysku
- Procesor x86_64 z obsługą wirtualizacji

### Software:
- Repo tool od Google: https://source.android.com/setup/develop#installing-repo
- Git
- JDK 8
- Python 3
- Make
- CCache

## 📁 Struktura projektu

```
AndroidTV-ROM/
├── .repo/
│   └── manifests/
│       └── default.xml          # Manifest repozytorium AOSP
├── device/
│   └── amd/
│       └── box/                 # Device tree dla Android TV Box
│           ├── Android.mk        # Makefile dla urządzenia
│           ├── BoardConfig.mk    # Konfiguracja płyty
│           ├── device.mk         # Konfiguracja produktu
│           ├── recovery.fstab    # Fstab dla recovery
│           ├── system.prop       # Właściwości systemu
│           └── overlay/          # Overlays zasobów
├── vendor/
│   └── amd/                      # Vendor blobs (sterowniki)
├── bootloader/                  # Bootloader
├── kernel/                       # Kernel źródła
├── prebuilts/                    # Prebuilts (toolchain)
├── system/                       # System image
└── vendor/                       # Vendor image
```

## 🔨 Jak zbudować system

### 1. Zainstaluj repo tool

```bash
mkdir ~/bin
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
```

### 2. Zainicjuj repozytorium

```bash
mkdir android-tv-rom
cd android-tv-rom
repo init -u https://android.googlesource.com/platform/manifest -b main
```

### 3. Zastąp manifest

Skopiuj `.repo/manifests/default.xml` z tego projektu do zainicjowanego repozytorium.

### 4. Pobierz źródła (to zajmie kilka godzin!)

```bash
repo sync -c -j4
```

### 5. Ustaw środowisko

```bash
source build/envsetup.sh
lunch aosp_box-userdebug
```

### 6. Zbuduj system (to zajmie kilka godzin!)

```bash
make -j$(nproc)
```

### 7. Wygeneruj obrazy

```bash
make otapackage
```

## 📦 Wynik buildu

Po zakończeniu buildu znajdziesz:

- `out/target/product/box/system.img` - Obraz systemu
- `out/target/product/box/boot.img` - Obraz bootloadera
- `out/target/product/box/recovery.img` - Obraz recovery
- `out/target/product/box/vendor.img` - Obraz vendor
- `out/target/product/box/ota_package.zip` - OTA package do flashowania

## 📱 Jak flashować na telewizor

### Metoda 1: Fastboot (jeśli bootloader odblokowany)

```bash
fastboot flash boot out/target/product/box/boot.img
fastboot flash system out/target/product/box/system.img
fastboot flash vendor out/target/product/box/vendor.img
fastboot flash recovery out/target/product/box/recovery.img
fastboot reboot
```

### Metoda 2: ADB Sideload (jeśli supported)

```bash
adb reboot bootloader
fastboot boot out/target/product/box/boot.img
adb sideload out/target/product/box/ota_package.zip
```

### Metoda 3: SD Card (jeśli supported)

1. Skopiuj `ota_package.zip` na kartę SD
2. Włóż kartę do telewizora
3. Włącz w trybie recovery
4. Wybierz "Install from SD card"

## ⚙️ Konfiguracja urządzenia

### Device tree (`device/amd/box/`)

To gdzie definiujesz:
- Architekturę CPU (x86_64, ARM64)
- Konfigurację kernela
- Rozmiary partycji
- Właściwości ekranu
- Konfigurację WiFi/Bluetooth
- SELinux policies
- Audio, Graphics, Media codecs

### Vendor blobs (`vendor/amd/`)

To są binarne sterowniki od producenta:
- GPU drivers
- WiFi/Bluetooth firmware
- Audio HAL
- Camera HAL
- **BEZ TEGO NIE DZIAŁA!**

## 🚨 WAZNE UWAGI

1. **To NIE jest gotowy obraz do flashowania** - trzeba zbudować ze źródeł AOSP
2. **Wymaga Linux** - nie działa na Windows/Mac
3. **Wymaga dużo miejsca i czasu** - build AOSP to setki GB i kilka godzin
4. **Wymaga vendor blobs** - bez sterowników od producenta system nie zadziała
5. **Bootloader musi być odblokowany** - inaczej nie da się flashować
6. **Może brickować urządzenie** - na własne ryzyko!

## 📚 Dokumentacja

- AOSP Build Guide: https://source.android.com/setup/build
- Device Tree Guide: https://source.android.com/devices/architecture
- Porting Guide: https://source.android.com/devices/bring-up

## 🤝 Współpraca

To jest szablon. Aby stworzyć działający ROM dla konkretnego urządzenia:

1. Znajdź device tree dla podobnego urządzenia (XDA Developers)
2. Dostosuj BoardConfig.mk do swojego sprzętu
3. Zdobądź vendor blobs z stock ROM
4. Popraw kernel dla swojego CPU/GPU
5. Przetestuj z adb/fastboot

## 📄 Licencja

Apache 2.0 - taki jak AOSP

---

**UWAGA:** To jest zaawansowany projekt dla developerów. Nie dla zwykłych użytkowników!