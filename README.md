# 🐝 Hum

**Hum** is a lightweight **visual journal** app optimized for the fastest possible **open → record → exit** loop. Designed to help you capture fleeting thoughts and moments—without distraction.

Built with ❤️ using [Flutter](https://flutter.dev/).


## ✨ Features

* 📷 **Capture moments fast** – Take a photo or video instantly upon opening
* 🖊️ **Add context** – Attach short notes, feelings, or tags
* 📅 **Timeline view** – Scroll through your history visually
* ⚡ **Zero-friction UX** – Start, record, and close in seconds
* 🌙 **Minimal, dark-friendly UI** – Designed for quiet reflection


## 📸 Screenshots

**Home Screen**
A clean, minimal launch view optimized for quick interaction.
![Home Screen](screenshots/home.png)


**Capture Entry**
Easily snap a photo or video, and add a short note or tag.
![Capture Entry](screenshots/capture.png)


**Timeline View**
Scroll through your past entries in a visual timeline.
![Timeline View](screenshots/timeline.png)


## 📁 Project Structure

```
lib/
├── core/               # Reusable utilities (e.g., constants, extensions)
├── data/               # Storage, repositories, data sources
├── models/             # Data models
├── providers/          # State management (e.g., Riverpod, Provider)
├── views/              # UI screens and components
├── app.dart            # App-level config (routes, themes, etc.)
└── main.dart           # Entry point
```


## 🚀 Getting Started

### Prerequisites

* Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
* Visual Studio Code, Android Studio, or any IDE of your choice
* A device or emulator

### Installation

```bash
git clone https://github.com/kaamimi/hum.git
cd hum
flutter pub get
flutter run
```
