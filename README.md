# react-native-ssh

A library that allows a React Native app to run commands over SSH.

## Usage

This library provides a single method: `SSH.execute`. Given SSH credentials
and a command, a promise is returned.

```javascript
import SSH from 'react-native-ssh';

config = {user: 'bob', host: 'example.com', password: 'p4$$w0rd'};
command = 'ls -l ~';

SSH.execute(config, command).then(
  result => console.log('Success:', result),
  error =>  console.log('Error:', error)
);
```

## Installation

### Android

- `npm install react-native-ssh --save`
- `react-native link react-native-ssh`

### iOS

- `npm install react-native-ssh --save`
- `react-native link react-native-ssh`
- Add `pod 'NMSSH', '~> 2.2.5'` to your Podfile and install. If you don't have a Podfile:
  - `cd ios`
  - `pod init`
  - Edit the newly created Podfile to look like [this example](Podfile.example)
  - `pod install`
- Make the Pod headers accessible to react-native-ssh (instructions based on XCode 8.1):
  - Open `ios/hooks.xcworkspace` in XCode
  - Click on `hooks > Libraries > RNSSH.xcodeproj` in the Project Navigator
  - Click on `RNSSH` under **Targets**
  - Go to **Build Settings**
  - Add `$(SRCROOT)/../../../ios/Pods/Headers/Public` to **Header Search Paths** and make it recursive
