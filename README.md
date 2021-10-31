![Bow Lite](assets/bow-lite-banner.png)

<p align="center">
<img src="https://github.com/bow-swift/bow-lite/workflows/Compile%20and%20test/badge.svg" alt="Compile and test" />
<img src="https://img.shields.io/badge/Swift-5.2-orange.svg" />
<img src="https://img.shields.io/badge/platforms-ipad%2Bios%2Bmac%2Blinux-brightgreen" alt="iPad + iOS + macOS + linux" />
<a href="https://badge.bow-swift.io/recipe?name=bow-lite&description=Bow%20Lite%20is%20a%20cross-platform%20library%20for%20Typed%20Functional%20Programming%20in%20Swift&url=https://github.com/bow-swift/bow-lite&owner=bow-swift&avatar=https://avatars3.githubusercontent.com/u/44965417?v=4&tag=0.1.0"><img src="https://raw.githubusercontent.com/bow-swift/bow-art/master/badges/nef-playgrounds-badge.svg" alt="bow-lite Playground" style="height:20px"></a>
</>

Bow Lite is a cross-platform library for Typed Functional Programming in Swift. It is a lightweight version of [Bow](https://github.com/bow-swift/bow) where some complexity, like Higher Kinded Type emulation, has been removed.

## Documentation

All documentation is available in [our website](https://bow-swift.io/). Notice that the documentation presents all examples using the full version of Bow. Although Bow Lite maintains compatibility with the API of Bow, there may be cases where there are some variations.

## Modules

Bow Lite offers an umbrella module `BowLite` that contains:

- **BowLiteCore**: a collection of the main data types typically used in FP projects, that you can find in the core module of Bow.
- **BowLiteEffects**: an implementation of the `IO` and `EnvIO` data types to deal with side effects, that you can find in the BowEffects module.
- **BowLiteOptics**: a monomorphic implementation of some optics, that you can find in the BowOptics module.

## How to get it

Bow Lite is available using Swift Package Manager. You can include it using the corresponding wizard in Xcode, or adding the following line to your `Package.swift` manifest:

```swift
.package(url: "https://github.com/bow-swift/bow-lite.git", from: "{version}")
```

```swift
import BowLite
```

# License

    Copyright (C) 2018-2021 The Bow Authors

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
