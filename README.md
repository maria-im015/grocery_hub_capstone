# grocery_hub_capstone

This web-app will help people keep track of what is in stock in their pantries, fridges, and freezers. It will use the user's phone camera or a USB barcode scanner to scan a product's barcode, the barcode will help store the product in the database. The database will keep track of what is in stock and will also allow the user to keep a grocery store list for future use. 

# Using Grocy's API

https://github.com/grocy/grocy

# Install for MAC:

https://flutter.dev/docs/get-started/install/macos

download zip folder from flutter website
unzip folder and move to a permanent file location: 
$ unzip flutter_macos_2.2.3-stable.zip

find .zshrc file, hidden file: 
$ ls -a

open text editor in terminal and scroll to bottom:
$ nano ~/.zshrc 
or use vs code 
$ code ~/.zshrc

add "export PATH="$PATH:[PATH_OF_FLUTTER_GIT_DIRECTORY]/bin""  
"$PATH" can be added at the end or beginning: 
$ export PATH=$PATH:/Users/USER_NAME/flutter/bin
check to make sure path is correct
$ echo $PATH
check that flutter is available
$ which flutter 
close terminal and open new page
$ flutter doctor

install everything missing from flutter install page and docker:
https://flutter.dev/docs/get-started/install/macos

xcode:
$ sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
$ sudo xcodebuild -runFirstLaunch

add to zshrc file after installing java:
$ export PATH="$PATH:/usr/bin/java"
check which one of these two works 
$ export JAVA_HOME=$(/usr/libexec/java_home)
$ export JAVA_HOME=$PATH:/Users/USER_NAME/Library/Android/sdk

mac install: 
$ sudo gem install cocoapods
$ flutter doctor

command to use web app:
$ flutter config --enable-macos-desktop
$ flutter channel stable
$ flutter upgrade
$ flutter devices

install flutter in VS Code, command palette and search Flutter
also install material icon theme using command palette:
$ flutter create myapp
$ cd myapp
$ flutter run -d chrome # flutter run for vs code/xcode 

to open simulator on vs code: 
$ open -a Simulator.app 

Run the following command to generate a release build:
$ flutter build web