ModalSplitViewController
============

For several reasons, it seems quite a few people (like me), whishes to use a UISplitViewController in a "modal" fashion. I still don't know why Apple didn't provide this out-of-the-box for us, as from a usability perspective, the UISplitViewController is almost like a UITabViewController. I found much confusion on StackOverflow of people doing 'hacks' to get this functionality.

To make things simpler and save time, one may use this class, tweak it, or simply to learn from it.

--EXAMPLE ON HOW TO USE --

mySplitViewController = [[ModalSplitViewController alloc] init];
mySplitViewController.delegate = self;

[parameterSplitViewController presentWithMasterViewController:masterViewController andDetailViewController:detailViewController completion:nil];

// when done:

[mySplitViewController dismissViewControllerWithCompletion:nil];
mySplitViewController = nil;

--EXPLANATION--

Basically, Apple documentation states that a UISplitViewController must be the "rootViewController" of your window (you must always install the view from a UISplitViewController object as the root view of your application’s window). If you attempt any "hack" that does not follow this (like using addSubview), you'll probably end up having an issue here or there (like missing orientation events etc). However, nowhere is stated that your application can't have more than *one* window instance, and that's exactly how I went about it: This way, you can easily achieve a "modal like" behaviour without going against the system guidelines.

ModalSplitViewController is just a subclass of UISplitViewController, so you know what to expect from it, except that I added those handy methods to present/dismiss.
