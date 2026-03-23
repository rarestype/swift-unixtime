<div align="center">

🌚 &nbsp; **u** &nbsp; 🌝

a portable Foundation-free library for working with machine time and its human-readable representations

[documentation and api reference](https://swiftinit.org/docs/u/unixtime)

</div>

U is not a date computation library; use [davedelong.time](https://github.com/davedelong/time) for that. U is principally concerned with static typing, unit safety, and minimizing binary size. It represents temporal concepts in a persistence-friendly format, optimizing for use cases such as task scheduling in long-running server applications.

One of the paramount goals of this library is to allow other libraries to exchange strongly-typed values with zero overhead without falling back to raw integer representations or linking against large frameworks.

## Requirements

The U library requires Swift 6.2 or later.

<!-- DO NOT EDIT BELOW! AUTOSYNC CONTENT [STATUS TABLE] -->
| Platform | Build |
| -------- | ------|
| 💬 Documentation | [![Status](https://raw.githubusercontent.com/rarestype/u/refs/badges/ci/Documentation/_all/status.svg)](https://github.com/rarestype/u/actions/workflows/Documentation.yml) |
| 🐧 Linux | [![Status](https://raw.githubusercontent.com/rarestype/u/refs/badges/ci/Tests/Linux/status.svg)](https://github.com/rarestype/u/actions/workflows/Tests.yml) |
| 🍎 Darwin | [![Status](https://raw.githubusercontent.com/rarestype/u/refs/badges/ci/Tests/macOS/status.svg)](https://github.com/rarestype/u/actions/workflows/Tests.yml) |
| 🍎 Darwin (iOS) | [![Status](https://raw.githubusercontent.com/rarestype/u/refs/badges/ci/Tests/iOS/status.svg)](https://github.com/rarestype/u/actions/workflows/Tests.yml) |
| 🍎 Darwin (tvOS) | [![Status](https://raw.githubusercontent.com/rarestype/u/refs/badges/ci/Tests/tvOS/status.svg)](https://github.com/rarestype/u/actions/workflows/Tests.yml) |
| 🍎 Darwin (visionOS) | [![Status](https://raw.githubusercontent.com/rarestype/u/refs/badges/ci/Tests/visionOS/status.svg)](https://github.com/rarestype/u/actions/workflows/Tests.yml) |
| 🍎 Darwin (watchOS) | [![Status](https://raw.githubusercontent.com/rarestype/u/refs/badges/ci/Tests/watchOS/status.svg)](https://github.com/rarestype/u/actions/workflows/Tests.yml) |
<!-- DO NOT EDIT ABOVE! AUTOSYNC CONTENT [STATUS TABLE] -->