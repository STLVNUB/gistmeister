<h1>GistMeister</h1>

**GistMeister is a simple Gist organizer** which allows for comment editing through the use of **QR Codes**. The project is written on **Xcode 10**, utilizes **Swift 3** and some parts of **Swift 4**. The package manager I have used is no other than **CocoaPods** in which a few base libraries exist in order to facilitate development, such as **Alamofire**, **SVProgressHUD**, and **Moa**.

<h2>Showcase</h2>

<img alt="Screenshot 1" src="https://raw.githubusercontent.com/dkoluris/gistmeister/master/Screenshots/1.png" width="24%"/><img alt="Screenshot 2" src="https://raw.githubusercontent.com/dkoluris/gistmeister/master/Screenshots/2.png" width="24%" align="right"/><img alt="Screenshot 3" src="https://raw.githubusercontent.com/dkoluris/gistmeister/master/Screenshots/3.png" width="24%" align="right"/><img alt="Screenshot 4" src="https://raw.githubusercontent.com/dkoluris/gistmeister/master/Screenshots/4.png" width="24%" align="right"/>

<h2>Source Code</h2>

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

<h2>Implementation</h2>

The preferred design pattern that is used throughout this project is **MVVM**. It's a big deal being able to decouple code that can be reused and tested independent of the UI view implementation. **Clean code == Better code**.

<h2>License</h2>

Open-source under [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0).
