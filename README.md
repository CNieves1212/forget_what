# forget_what

A new Flutter project.

## Getting Started
How to install flutter onto your mac:
1.	Go to: https://flutter.dev/docs/get-started/install/macos
2.	Download the zip file and unzip it.
3.	Move the flutter folder to where you’d like it to be.
4.	Then, open up terminal where you should type:
        vim .bash_profile
5.	After pressing enter, type this into the text editor and replace ‘pwd’ with the flutter file path:
	    export PATH="$PATH:`pwd`/flutter/bin"
6.	Then, to save and quit the file type:
        :wq!
7.	Afterwards, it should give you the flutter version when you type:
        flutter –version
8.	To see what is setup for flutter, in terminal run:
        flutter doctor
9.	We recommend following some of the steps it gives such as installing Android Studio (which later on there are instructions for) and accepting the Android license with:
        flutter doctor –android-licenses
(A video to follow along with for more help: 
https://www.youtube.com/watch?v=hL7pkX1Pfko 1:49-9:15)


Install Android Studio:
https://flutter.dev/docs/get-started/install/macos#android-setup
10.	Go to: https://developer.android.com/studio 
11.	Download Android Studio and keep its default settings when setting it up.
12.	When Android Studio is open, go to preferences by either pressing Configure->Preferences on the welcome screen or by going to the menu bar Android Studio->Preferences
13.	Go to the plugins tab->browse repositories
14.	Search for flutter and download the plugin (say yes to both prompts given after you press install)
15.	Click on “Restart Android Studio” button
16.	Click “OK” to close the preferences page, and click on “Restart”
17.	Then to open our project, press “Open an existing Android Studio project” and navigate to our “forget_what” project folder on your mac.
(A video to follow along with for more help: 
https://www.youtube.com/watch?v=gv1LScpG0jM 0:00-2:22)

How to run the Android Virtual Device:
1.	Go to the android virtual device manager (you can find it under Tools->AVD Manager or 
    as a button that looks like a phone with the android logo on the project screen)
2.	Then, press “+ Create Virtual Device”
3.	Choose a device and select next. (The video we found suggests Nexus 6, but we don’t 
    think the device necessarily matters.)
4.	Download and select Pie as the operating system. Then, click next.
5.	Change the graphics to hardware and press finish.
6.	To launch the device, press the device’s play button.
7.	To run our code (you may need to complete the additional MacOS requirements below before this step)
    a.	Go the project
    b.	If it’s your first time running our project, either press “Pub get” at the top of the screen 
        or type within terminal:
            dart pub get
    i.	This should download all the packages needed for our project.
    c.	At the top switch your device to the one you just launched
    d.	Press the play button
(A video to follow along with for more help: https://www.youtube.com/watch?v=_p3VbxiVuRU)

Additional MacOS requirements:
https://flutter.dev/docs/get-started/install/macos#macos-setup
1.	Download Xcode from the App Store.
2.	Then, go to terminal and type:
        sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
        sudo xcodebuild -runFirstLaunch
3.	Accept the license agreement by also typing in:
        sudo xcodebuild -license
4.	Install and set up CocoaPods by typing in terminal:
        sudo gem install cocoapods
5.	Type this into terminal as well to enable desktop support:
        flutter config --enable-macos-desktop


This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
