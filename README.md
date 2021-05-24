# Easy SignIn Swift
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=SudoDevOSS_easy-signin-ios&metric=alert_status)](https://sonarcloud.io/dashboard?id=SudoDevOSS_easy-signin-ios) [![Maintainability Rating](https://sonarcloud.io/api/project_badges/measure?project=SudoDevOSS_easy-signin-ios&metric=sqale_rating)](https://sonarcloud.io/dashboard?id=SudoDevOSS_easy-signin-ios) [![Reliability Rating](https://sonarcloud.io/api/project_badges/measure?project=SudoDevOSS_easy-signin-ios&metric=reliability_rating)](https://sonarcloud.io/dashboard?id=SudoDevOSS_easy-signin-ios) [![Security Rating](https://sonarcloud.io/api/project_badges/measure?project=SudoDevOSS_easy-signin-ios&metric=security_rating)](https://sonarcloud.io/dashboard?id=SudoDevOSS_easy-signin-ios) [![Technical Debt](https://sonarcloud.io/api/project_badges/measure?project=SudoDevOSS_easy-signin-ios&metric=sqale_index)](https://sonarcloud.io/dashboard?id=SudoDevOSS_easy-signin-ios) [![Duplicated Lines (%)](https://sonarcloud.io/api/project_badges/measure?project=SudoDevOSS_easy-signin-ios&metric=duplicated_lines_density)](https://sonarcloud.io/dashboard?id=SudoDevOSS_easy-signin-ios) [![Lines of Code](https://sonarcloud.io/api/project_badges/measure?project=SudoDevOSS_easy-signin-ios&metric=ncloc)](https://sonarcloud.io/dashboard?id=SudoDevOSS_easy-signin-ios) [![Code Smells](https://sonarcloud.io/api/project_badges/measure?project=SudoDevOSS_easy-signin-ios&metric=code_smells)](https://sonarcloud.io/dashboard?id=SudoDevOSS_easy-signin-ios) [![Bugs](https://sonarcloud.io/api/project_badges/measure?project=SudoDevOSS_easy-signin-ios&metric=bugs)](https://sonarcloud.io/dashboard?id=SudoDevOSS_easy-signin-ios)
## Overview

This Project is an open-source project written in Swift

The goal of this project is apply the clean architecture on a module and include basic API operations such as

- Authentication
    - Login
    - Register
    - Reset Password
- Account
    - Fetch Account Info
    - Update Account Info

## Dependencies

- [Alamofire](https://github.com/Alamofire/Alamofire)
- [Swinject](https://github.com/Swinject/Swinject)

## Getting Started

### Requirements

- XCode 12+
- Swift 5+
- macOS 11+

### Documentation
Documentation is published on Github pages and can be found [here](https://sudodevoss.github.io/easy-signin-docs/#/)

### Usage
- Add source to your project
- Initialize the library in AppDelegate: 
```Swift
// Configure dependencies for Swinject
DependencyContainer.shared.configure()

// Configure network base url & authentication token
// This function needs to be called again when providing token
// at a later stage 
BaseNetworkConfigurator.shared.configure(url: "YOUR_URL", token: "OPTIONAL_AUTH_TOKEN")
```
---
## License
```
MIT License

Copyright (c) 2021 sudo-dev-oss

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```