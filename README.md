<div align="center">

🌚 &nbsp; **swift-unixtime** &nbsp; 🌝

a portable Foundation-free library for working with machine time and its human-readable representations

[documentation and api reference](https://swiftinit.org/docs/swift-unixtime/unixtime)

</div>

Swift UnixTime is not a date computation library; use [davedelong.time](https://github.com/davedelong/time) for that. Swift UnixTime is principally concerned with static typing, unit safety, and minimizing binary size. It represents temporal concepts in a persistence-friendly format, optimizing for use cases such as task scheduling in long-running server applications.

One of the paramount goals of this library is to allow other libraries to exchange strongly-typed values with zero overhead without falling back to raw integer representations or linking against large frameworks.

## Requirements

The swift-unixtime library requires Swift 6.2 or later.

| Platform | Status |
| -------- | ------ |
| 💬 Documentation | [![Documentation](https://github.com/rarestype/swift-unixtime/actions/workflows/Documentation.yml/badge.svg)](https://github.com/rarestype/swift-unixtime/actions/workflows/Documentation.yml) |
| 🐧 Linux | [![Tests](https://github.com/rarestype/swift-unixtime/actions/workflows/Tests.yml/badge.svg)](https://github.com/rarestype/swift-unixtime/actions/workflows/Tests.yml) |
| 🍏 Darwin | [![Tests](https://github.com/rarestype/swift-unixtime/actions/workflows/Tests.yml/badge.svg)](https://github.com/rarestype/swift-unixtime/actions/workflows/Tests.yml) |
| 🍏 Darwin (iOS) | [![iOS](https://github.com/rarestype/swift-unixtime/actions/workflows/iOS.yml/badge.svg)](https://github.com/rarestype/swift-unixtime/actions/workflows/iOS.yml) |
| 🍏 Darwin (tvOS) | [![tvOS](https://github.com/rarestype/swift-unixtime/actions/workflows/tvOS.yml/badge.svg)](https://github.com/rarestype/swift-unixtime/actions/workflows/tvOS.yml) |
| 🍏 Darwin (visionOS) | [![visionOS](https://github.com/rarestype/swift-unixtime/actions/workflows/visionOS.yml/badge.svg)](https://github.com/rarestype/swift-unixtime/actions/workflows/visionOS.yml) |
| 🍏 Darwin (watchOS) | [![watchOS](https://github.com/rarestype/swift-unixtime/actions/workflows/watchOS.yml/badge.svg)](https://github.com/rarestype/swift-unixtime/actions/workflows/watchOS.yml) |
