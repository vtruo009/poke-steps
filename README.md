# 🏃‍♂️ Pokésteps

An iOS step counter application inspired by Ash Ketchum's Pokémon journey — emphasizing that **growth and continuous improvement** are as important as achieving the goal.

## 📝 Description

Pokésteps is a **gamified fitness app** designed to make routine activities like walking more enjoyable and engaging.  
By integrating elements of gaming, it motivates users to stay active while having fun.

Users can unlock and collect all **151 original Pokémon** by earning experience points through their daily step counts.  
The app leverages **HealthKit** to track steps and **PokéAPI** to deliver a Pokédex-inspired interface for tracking progress and achievements.

With features like **customizable step goals**, the app caters to both beginners looking to ease into a healthier lifestyle and advanced users pushing their limits.

<p align="center">
  <img src="./assets/images/screenshots/sign-up.png" alt="sign-up" width="200"/>
  <img src="./assets/images/screenshots/steps.png" alt="steps" width="200"/>
  <img src="./assets/images/screenshots/pokedex.png" alt="pokedex" width="200"/>
  <img src="./assets/images/screenshots/pokemon-details.png" alt="pokemon details" width="200"/>
</p>

## ⚡️ Get Started

1. Clone the project

    ```bash
    git clone https://github.com/vtruo009/poke-steps.git
    ```

2. Open the project. You can open it directly in Xcode or use the command line:
    ```bash
    cd poke-steps
    open Pokesteps.xcodeproj
    ```

    > 💡 If your project uses CocoaPods, open the `.xcworkspace` file instead.

    **🧪 Option A — Run on Simulator**

    1. Install an iOS 18.1 simulator

    2. Add steps data in Health app (simulator)

    3. Run the app by pressing **Cmd + R** or click ▶️ in Xcode

    4. Grant **HealthKit** permissions on first launch

    **📱 Option B — Run on a Physical Device**

    1. Connect your device (required if building on device for first time)

    2. Select your device as the run target

    3. Build & run by pressing `Cmd` + `R` or click ▶️ in Xcode

    4. Grant **HealthKit** permissions on first launch

    > 💡 After initial setup, you can build to your device wirelessly.

3. Set up Firebase

    This app uses **Firebase** for data storage. Follow the [official guide](https://firebase.google.com/docs/ios/setup) to get it set up.

## 🎨 Design

Figma Design → [Pokésteps Design File](https://www.figma.com/design/NF4VFbFFlSgF2lKkHmrnIH/Pokesteps?node-id=0-1&t=ju9Lg8FPPWWy6UVS-1)

## 🧰 Tools & Frameworks

- Xcode 16  
- Swift 5  
- SwiftUI  
- HealthKit  
- Firebase  
- PokéAPI  
