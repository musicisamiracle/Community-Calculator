# Community Calculator

## Requirement

> Calculator Exercise details:
Create a mobile app (using React Native/Android/iOS) which logs calculations as they happen and shares those calculations with everyone connected to the app.
For example, user A and user B go to your app at the same time. User A calculates “5 + 5”, which equals “10". This is logged below the calculator as “5 + 5 = 10”. User B is updated about this calculation right after user A posts it. Now, user B calculates “3 x 4".This calculates to “12” and displays “3 x 4=12" right below the prior calculation. User A sees this update immediately after user B posts it.
Results should remain between sessions. Only show the last 10 calculations descending from most recent to oldest.
You can use Google firebase to write the backend.

## What I created
This is an iOS app called Community Calculator. It is written in Swift using SwiftUI and Firebase. The backend is a Firebase RealtimeDatabase.

I made use of an open source library (with modifications) for the calculator functionality which can be found [here](https://github.com/DeluxeAlonso/CalculatorReplicaSwiftUI)


## How to run the app
**Requirements:**
* MacOS with Xcode 11.0 or later

**Steps:**
* Clone this repo to your local machine
* Open the Community Calculator.xcworkspace file
* Select an iPhone simulator of your choice
* Click the Run button
