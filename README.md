
# react-native-ssh

## Getting started

`$ npm install react-native-ssh --save`

### Mostly automatic installation

`$ react-native link react-native-ssh`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-ssh` and add `RNSSH.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNSSH.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactnative.ssh.RNSSHPackage;` to the imports at the top of the file
  - Add `new RNSSHPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-ssh'
  	project(':react-native-ssh').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-ssh/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-ssh')
  	```


## Usage
```javascript
import SSH from 'react-native-ssh';

// TODO: What do with the module?
SSH;
```
  
