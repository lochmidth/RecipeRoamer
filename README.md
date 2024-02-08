<p align="center">
  <img src="RecipeRoamer/Recources/Assets.xcassets/AppIcon.appiconset/1024.png" alt="RecipeRoamer App Icon" width="150" height="150">
</p>

# Recipe Roamer

Welcome to Recipe Roamer! Discover a world of flavors with our iOS app. From comforting classics to exotic delights, find recipes from around the globe. 

## Table of Contents
  - [Tech Stack](#tech-stack)
  - [Architecture](#architecture)
  - [Unit Tests](#unit-tests)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Contributing](#contributing)
- [License](#license)

### Tech Stack

- **Xcode:** Version 15.2
- **Language:** Swift 5.9
- **Minimum iOS Version:** 17.2
- **Dependency Manager:** SPM

### Architecture

![Architecture](https://ckl-website-static.s3.amazonaws.com/wp-content/uploads/2016/04/Viper-Module.png.webp)

In developing Recipe Roamer, I used the VIPER (View-Interactor-Presenter-Entity-Router) architecture for these key reasons:

- I wanted to practice VIPER :)
- **Clear Separation:**  VIPER architecture separates UI, business logic, and navigation for cleaner, more maintainable code.
- **Test-Driven Development:** VIPER's modular structure enables comprehensive unit testing, ensuring app stability.
- **Scalability:** VIPER's modular design allows easy addition of features and modifications.

### Unit Tests

**85 % Unit test covarage**

- BreadList: View, Presenter, Interactor are tested.
- BreadRecipe: View, Presenter, Interactor are tested.
- API: MealService is tested.

## Getting Started

### Prerequisites

Before you begin, ensure you have the following:

- Xcode installed

Also, make sure that these dependencies are added in your project's target:

- [Moya](https://github.com/Moya/Moya): Network abstraction layer written in Swift.
- [Kingfisher](https://github.com/onevcat/Kingfisher): Powerful and pure Swift library for downloading and caching images.
- [JGProgressHUD](https://github.com/JonasGessner/JGProgressHUD): A versatile and customizable progress HUD to provide users with feedback during asynchronous tasks.

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/lochmidth/RecipeRoamer.git
    ```

2. Open the project in Xcode:

    ```bash
    cd RecipeRoamer
    open RecipeRoamer.xcodeproj
    ```
3. Add required dependencies using Swift Package Manager:

   ```bash
   - Moya
   - Kingfisher
   - JGProgressHUD
    ```

6. Build and run the project.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change. Please make sure to update tests as appropiate.

## License

This project is licensed under the [MIT License](LICENSE).
