# Perfect Image Library Demo

<p align="center">
    <a href="http://perfect.org/get-involved.html" target="_blank">
        <img src="http://perfect.org/assets/github/perfect_github_2_0_0.jpg" alt="Get Involed with Perfect!" width="854" />
    </a>
</p>

<p align="center">
    <a href="https://github.com/PerfectlySoft/Perfect" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_1_Star.jpg" alt="Star Perfect On Github" />
    </a>  
    <a href="http://stackoverflow.com/questions/tagged/perfect" target="_blank">
        <img src="http://www.perfect.org/github/perfect_gh_button_2_SO.jpg" alt="Stack Overflow" />
    </a>  
    <a href="https://twitter.com/perfectlysoft" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_3_twit.jpg" alt="Follow Perfect on Twitter" />
    </a>  
    <a href="http://perfect.ly" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_4_slack.jpg" alt="Join the Perfect Slack" />
    </a>
</p>

<p align="center">
    <a href="https://developer.apple.com/swift/" target="_blank">
        <img src="https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat" alt="Swift 3.0">
    </a>
    <a href="https://developer.apple.com/swift/" target="_blank">
        <img src="https://img.shields.io/badge/Platforms-OS%20X%20%7C%20Linux%20-lightgray.svg?style=flat" alt="Platforms OS X | Linux">
    </a>
    <a href="http://perfect.org/licensing.html" target="_blank">
        <img src="https://img.shields.io/badge/License-Apache-lightgrey.svg?style=flat" alt="License Apache">
    </a>
    <a href="http://twitter.com/PerfectlySoft" target="_blank">
        <img src="https://img.shields.io/badge/Twitter-@PerfectlySoft-blue.svg?style=flat" alt="PerfectlySoft Twitter">
    </a>
    <a href="http://perfect.ly" target="_blank">
        <img src="http://perfect.ly/badge.svg" alt="Slack Status">
    </a>
</p>

## Perfect Image Library Demo Project

This example demonsrates the use of a simple API backend to deliver an image gallery listing to a ReactJS web front end, as well as an iOS application.

The ReactJS application is served directly from the executable on port 8181, and the iOS application is meant to be running in the simulator as it is also set to use http://localhost:8181 as the host address for the API.

The iOS application uses [ImageSlideshow](https://github.com/zvonicek/ImageSlideshow) as it's slideshow mechanism, and the app itself is based on the dexample from that project.

The Web frontend in ReactJS is built using [https://www.npmjs.com/package/react-image-gallery](https://www.npmjs.com/package/react-image-gallery).

Both these applications are using the same API endpoint: [http://localhost:8181/api/v1/image](http://localhost:8181/api/v1/image)


## Compatibility with Swift

The master branch of this project currently compiles with **Xcode 8.3.2** or the **Swift 3.1** toolchain.

## Building & Running

The following will clone and build an empty starter project and launch the server on port 8181.

```
git clone https://github.com/PerfectExamples/ImageLibraryDemo.git
cd ImageLibraryDemo/ServerSide
swift build
.build/debug/ImageLibrary
```

You should see the following output:

```
[INFO] Running setup: imagefile
[INFO] Starting HTTP server localhost on 0.0.0.0:8181
```

This means the server is running and waiting for connections. Access [http://localhost:8181/](http://localhost:8181/) to see the greeting. Hit control-c to terminate the server.

## Running the Web App

With the server running as above, all that needs to happen to launch the web app is to visit [http://localhost:8181](http://localhost:8181) in a browser.

The source for this is in the /ReactClient directory of the project and is a relatively standard ReactJS project.

## Running the iOS App

The iOS app is located in the /iOSApp directory of the project. From the Terminal app, run `pod install` within that directory to install the required [CocoaPods](http://cocoapods.org/). Then you should be able to launch the `ImageSlideshow.xcworkspace` file, and build & run as normal in a simulator.  





## Issues

We use JIRA for all bugs and support related issues.

If you find a mistake, bug, or any other helpful suggestion you'd like to make on the docs please head over to [http://jira.perfect.org:8080/servicedesk/customer/portal/1](http://jira.perfect.org:8080/servicedesk/customer/portal/1) and raise it.

A comprehensive list of open issues can be found at [http://jira.perfect.org:8080/projects/ISS/issues](http://jira.perfect.org:8080/projects/ISS/issues)



## Further Information
For more information on the Perfect project, please visit [perfect.org](http://perfect.org).
