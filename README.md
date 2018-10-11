# GistMeister

**GistMeister is a simple Gist organizer** which allows for comment editing through the use of **QR Codes**. The project is written on **Xcode 10**, utilizes **Swift 3** and some parts of **Swift 4**. The package manager I have used is no other than **CocoaPods** in which a few base libraries exist in order to facilitate development, such as **Alamofire**, **SVProgressHUD**, and **Moa**.

<img alt="1" src="https://raw.githubusercontent.com/dkoluris/gistmeister/master/Screenshots/1.png" width="25.0%"/><img alt="2" src="https://raw.githubusercontent.com/dkoluris/gistmeister/master/Screenshots/2.png" width="25.0%" align="right"/><img alt="3" src="https://raw.githubusercontent.com/dkoluris/gistmeister/master/Screenshots/3.png" width="25.0%" align="right"/><img alt="4" src="https://raw.githubusercontent.com/dkoluris/gistmeister/master/Screenshots/4.png" width="25.0%" align="right"/>

The source code is organized as follows:
```
+ Source
  + Models
    - GitHub User
    - GitHub Gist
    - GitHub Gist Comments
  + View Controllers
    - Authentication
    - Home
    - QR Scanner
    - Gist Details & Comments
  + Interface Builder
    - Launch screen
    - Main
```

The preferred design pattern that is used throughout this project is **MVVM**. It's a big deal being able to decouple code that can be reused and tested independent of the UI view implementation. **Clean code == Better code**.
