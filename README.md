# Agora Dynamic Key Library (Swift)

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FGiacomoLeopizzi%2Fagora-dynamic-key-swift%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/GiacomoLeopizzi/agora-dynamic-key-swift)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FGiacomoLeopizzi%2Fagora-dynamic-key-swift%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/GiacomoLeopizzi/agora-dynamic-key-swift)

This library provides tools for generating dynamic keys (tokens) for Agora services, including Real-Time Communication (RTC), Real-Time Messaging (RTM), and Chat. The library is designed for Swift developers and ensures seamless integration with Agora services.

## Features
- **Chat Token Generation:** Create tokens for chat applications to authenticate user and app access.
- **RTC Token Generation:** Generate tokens for RTC sessions with detailed privilege configurations.
- **RTM Token Generation:** Build tokens for messaging services.


## Installation

To add this package as a dependency, include it in your `Package.swift` file:

```swift
.package(url: "https://github.com/GiacomoLeopizzi/agora-dynamic-key-swift", from: "1.0.0"),
```

Add AgoraDynamicKey to your application's target dependencies:

```swift
.product(name: "AgoraDynamicKey", package: "agora-dynamic-key-swift")
```

## Swift C++ Interoperability

This library uses Swift's C++ interop feature to wrap the Agora server-side C++ SDK. The SDK is included as a submodule within the project. Because of this, you must enable it also in the target using the library. For example:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "AgoraDynamicKey", package: "agora-dynamic-key-swift")
    ],
    swiftSettings: [
        .interoperabilityMode(.Cxx)
    ]
),
```

## Usage

### ChatTokenBuilder

**Initialization:**
```swift
let chatTokenBuilder = ChatTokenBuilder(appID: "your_app_id", appCertificate: "your_app_certificate")
```

**Methods:**
- `buildAppToken(expire: TimeAmount = .zero) -> String`  
  Generate a chat app token.
  - **Parameters:**
    - `expire`: The duration in seconds before the token expires.
  - **Returns:** A `String` representing the app token.

- `buildUserToken(userID: String, expire: TimeAmount = .zero) -> String`  
  Generate a chat user token.
  - **Parameters:**
    - `userID`: Unique identifier for the user.
    - `expire`: The duration in seconds before the token expires.
  - **Returns:** A `String` representing the user token.

### RtcTokenBuilder

**Initialization:**
```swift
let rtcTokenBuilder = RtcTokenBuilder(appID: "your_app_id", appCertificate: "your_app_certificate")
```

**Methods:**
- `buildTokenWithUid(channelName: String, uid: UInt32, role: UserRole, tokenExpire: TimeAmount, privilegeExpire: TimeAmount = .zero) -> String`  
  Generate an RTC token for a user identified by UID.
  - **Parameters:**
    - `channelName`: Unique name for the RTC session.
    - `uid`: 32-bit unsigned integer representing the user ID.
    - `role`: Role of the user (Publisher or Subscriber).
    - `tokenExpire`: Token expiration time in seconds.
    - `privilegeExpire`: Privilege expiration time in seconds (default: `.zero`).
  - **Returns:** A `String` representing the token.

- `buildTokenWithUserAccount(channelName: String, userAccount: String, role: UserRole, tokenExpire: TimeAmount, privilegeExpire: TimeAmount = .zero) -> String`  
  Generate an RTC token for a user identified by a user account.
  - **Parameters:** Same as `buildTokenWithUid`, except `userAccount` replaces `uid`.

### RtmTokenBuilder

**Initialization:**
```swift
let rtmTokenBuilder = RtmTokenBuilder(appID: "your_app_id", appCertificate: "your_app_certificate")
```

**Methods:**
- `buildToken(userID: String, expire: TimeAmount = .zero) -> String`  
  Generate an RTM token for a user.
  - **Parameters:**
    - `userID`: User's account ID (maximum 64 bytes).
    - `expire`: Token expiration time in seconds.
  - **Returns:** A `String` representing the token.

## Contributing

Contributions are welcome! Submit a pull request or open an issue on the repository to suggest changes or report bugs.
