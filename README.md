# 🖼 Image Gallery App (UIKit)

A simple iOS image gallery app built with UIKit that fetches and displays images from the Unsplash API. Users can scroll through a grid of photos and tap any image to view it in full-screen.

---

## 🚀 Features

- 📡 Fetches 10 images using Unsplash API
- 🖼 Displays photos in a `UICollectionView` grid
- 👆 Tap any photo to view it in full screen
- ⚡️ Image caching using `NSCache`
- 💎 Clean MVVM structure

---

## 📷 API Used

- **Unsplash API**  
  Endpoint used:
https://api.unsplash.com/search/photos?query=flowers&per_page=10&client_id=YOUR_API_KEY

> Replace `YOUR_API_KEY` with your own from [https://unsplash.com/developers](https://unsplash.com/developers)


## 🧱 Technologies

- UIKit
- MVVM
- URLSession
- NSCache
- XIB-based UI

---

## 🛠 How to Run

1. Clone the repo:
   ```bash
	git clone https://github.com/Mahmoud810/Image-Gallery.git
