# MetovaBase

[![Build Status](https://travis-ci.org/metova/MetovaBase.svg?branch=master)](https://travis-ci.org/metova/MetovaBase)
[![CocoaPods Compatible](http://cocoapod-badges.herokuapp.com/v/MetovaBase/badge.png)](http://cocoadocs.org/docsets/MetovaBase)
[![Documentation](https://img.shields.io/cocoapods/metrics/doc-percent/MetovaBase.svg)](http://cocoadocs.org/docsets/MetovaBase/)
[![Coverage Status](https://coveralls.io/repos/github/metova/MetovaBase/badge.svg?branch=master)](https://coveralls.io/github/metova/MetovaBase?branch=master)
[![Platform](http://cocoapod-badges.herokuapp.com/p/MetovaBase/badge.png)](http://cocoadocs.org/docsets/MetovaBase)
[![Twitter](https://img.shields.io/badge/twitter-@Metova-3CAC84.svg)](http://twitter.com/metova)

## Requirements

 - iOS 8.0
 - Swift 3.0

## Installation

MetovaBase is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod 'MetovaBase'

## Overview

MetovaBase offers useful UIKit subclasses that implement commonly used utilities.

## BaseViewController

The `BaseViewController` class extends from `UIViewController` and adds a common utility that we have found ourselves adding in most, if not all, of our view controller classes.
It does some additional setup in `viewDidLoad` to provide your view controller with keyboard notifications.  If overriding, be sure to call `super.viewDidLoad` in your subclass.

### Example usage:

```swift
import MetovaBase

class MyViewController: BaseViewController {

    override func viewDidLoad() {
    
    	// this call registers your VC for keyboard notifications
    	super.viewDidLoad() 
    	
    	// my custom setup here
    }
}
```

Additionally, `BaseViewController` unregisters your view controller from receiving keyboard notifications in its `deinit()` method.

## KeyboardNotificationDelegate

This protocol contains a collection of methods which `BaseViewController` subclasses (or extensions) can implement in order to hear about keyboard notifications. As already stated, you do not need to register or unregister for these notifications in your subclass or extension--you simply need to implement these methods.
 
### Methods
 
 These methods are called when the appropriate keyboard notification is fired.
 
 ```swift
optional func keyboardWillShow(notification: Notification)

optional func keyboardDidShow(notification: Notification)

optional func keyboardWillChangeFrame(notification: Notification)

optional func keyboardDidChangeFrame(notification: Notification)

optional func keyboardWillHide(notification: Notification)

optional func keyboardDidHide(notification: Notification)
 ```
 

## BaseViewControllerConvenience

`BaseViewControllerConvenience` provides a convenience method to dismiss the keyboard. It assumes the first responder is a descendant of your view controller's view.
Since it is an extension of `BaseViewController`, you can call the method anywhere in your `BaseViewController` subclass like so:

```swift
dismissKeyboard()
```

## BaseViewControllerFrames

`BaseViewControllerFrames` provides some additional helper methods for handling the keyboard in your view controller. Again, this extends `BaseViewController`, so these methods are 
available anywhere in your `BaseViewController` subclass.

### Methods

```swift
public func framesForKeyboard(notification: Notification) -> (fromFrame: CGRect, toFrame: CGRect) 
```

This method returns the starting and ending frames of the keyboard. It parses the frame information out of the notification that is passed in.
If there is no frame information in the notification object, `CGRect.zero` is returned.

```swift
public func adjustContentInset(scrollview scrollView: UIScrollView, forKeyboardWillChangeFrameNotification notification: Notification)
```

As can be surmised by the name, this method adjusts the scrollview's inset based on the keyboard frame. This is helpful for views where they keyboard may cover up
the first responder.

#### Example Usage

```swift
import MetovaBase

class MyViewController: BaseViewController, KeyboardNotificationDelegate {

	@IBOutlet myScrollView: UIScrollView!


	func keyboardDidChangeFrame(notification: Notification) {
	
		let frames = framesForKeyboard(notification: notification)
		let fromFrame = frames.fromFrame
		let toFrame = frames.toFrame
		
		// do whatever you need to with the 'fromFrame' and 'toFrame'
	}

	func keyboardWillChangeFrame(notification: Notification) {

		adjustContentInset(scrollView: myScrollView, forKeyboardWillChangeNotification: notification)
	}
}
```


## Credits

MetovaBase is owned and maintained by [Metova Inc.](https://metova.com)

[Contributors](https://github.com/Metova/MetovaBase/graphs/contributors)

## License

MetovaBase is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
