# TUSafariActivity

`TUSafariActivity` is a `UIActivity` subclass that provides an "Open In Safari" action to a `UIActivityViewController`.

## Installation
TUSafariActivity is available through [Swift Package Manager](https://www.swift.org/package-manager/). To install
it, simply add the following line to your `Package.swift`:

```swift
dependencies: [.package(url: "https://github.com/fel1x-developer/TUSafariActivity.git", from: "1.0.0")]
```

## Usage

```swift
let url = URL(string: "http://google.com")!
let activity = TUSafariActivity()
let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: [activity])
```

And set `CFBundleAllowMixedLocalizations` to `YES` in `Info.plist`.

Note that you can include the activity in any `UIActivityViewController` and it will only be shown to the user if there is a URL in the activity items.
