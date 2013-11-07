kvo_management
==============

A NSObject category to improve KVO utilisation on iPhone.

Setup
=====

- Add the "KVOManagement" folder in your porject.
- Add this line in your project's Prefix.pch : ```#import "NSObject+KVOManagement.h"```

Utilisation
===========

You can add an observation with the new NSObject method : 
```
- (void)observeObject:(id)object atKeypath:(NSString*)keypath andBlock:(KVOManagementBlockCallback)callback
```

- object is the object you want to observe.
- keypath is like the keypath in the original KVO method, usually a string that name the property to observe.
- callback is a block that will be called on notification.

You call this method on the observer object. It's used for memory management.

The observation will stop automaticaly when observer or observee are dealloc. You don't have to manage it.

TODO
====

- ~~Block~~
- ~~Memory management~~
- Customisation
- Binding
- Predicate
