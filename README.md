# ThreadsClone

A modern iOS application that clones the core functionality of Threads, built with SwiftUI and following Apple's latest design patterns. If you want to check the backend that powers this IOS app
please visit the following github link: https://github.com/shakirgamzaev/ThreadsBackend_SpringBoot.git

## Features

### Authentication
- **User Login & Sign Up**: Secure authentication system with JWT token management
- **Session Validation**: Automatic session validation on app launch
- **Keychain Integration**: Secure token storage using iOS Keychain
- **Smooth Transitions**: Animated transitions between authenticated and non-authenticated states

### Core Functionality
- **Thread Feed**: Browse and view threads from all users
- **User Search**: Search and discover other users
- **Create Threads**: Post new threads to share content
- **User Profiles**: View and manage user profiles
- **Activity Tab**: Track interactions and engagement (in development)

### Technical Highlights
- **SwiftUI**: Built entirely with SwiftUI for modern, declarative UI
- **Swift Concurrency**: Utilizes async/await for all network operations
- **@Observable Macro**: Leverages Swift's latest observation framework
- **MVVM Architecture**: Clean separation of concerns with View Models
- **Type-Safe Networking**: Strongly-typed API layer with custom error handling
- **Secure Storage**: Keychain-based secure storage for sensitive data

## Architecture

### View Models
- **MainAuthViewModel**: Manages app-wide authentication state and user session
- **LoginViewModel**: Handles user login flow and validation
- **SignUpViewModel**: Manages user registration
- **UploadThreadViewModel**: Controls thread creation and posting

### Networking
- **NetworkingManager**: Singleton service handling all API communications
  - JWT-based authentication
  - RESTful API integration
  - Custom error handling with `ApiError`
  - Endpoints for:
    - User authentication (login/signup)
    - Session validation
    - Thread management (fetch/post)
    - User search and discovery

### Security
- **SecureKeyChainStorage**: Secure token storage and retrieval
- **JWT Token Management**: Automatic token injection in authenticated requests
- **Session Persistence**: Seamless user experience across app launches

## Requirements

- **iOS 17.0+** (uses `@Observable` macro)
- **Xcode 15.0+**
- **Swift 5.9+**
