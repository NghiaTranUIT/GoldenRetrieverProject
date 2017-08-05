Explain what happens when the following code is executed (ARC being disabled in the compiler):

```
MyClass *myClass = [[[[MyClass alloc] init] autorelease] autorelease];
```

## TL;DR 
The behavior after this code is executed is unexpected. A majority of time lead to crashed application.

## Long Answer
Before addressing the problem. Please bear in mind we're talking about an ancient Objective-C world before ARC had been invested by Apple.

In order to explain this smell-code efficiently, I would like to revise few fundamental concepts of memory management.

##  What's Autorelease?
It's self-explanatory if we describe -autorelease concept as real-world conversation. We can say "Hey, I'm so exhausted to take care "Release" manually on time, I want this instance to be released sometime in the future.".

It's the main purpose of -autorelease. Every time -autorelease is sent to an object, it will be added to the inner-most autorelease pool. In addition, we've already had main autorelease pool in a main.m file. In certain situations, we probably have own autorelease pool as well.

Autorelease pool is a handy way to guarantee to defer sending -release method when a pool is drained.
An NSAutoreleasePool has created automatically at the start of each iteration and is drained at the end of the same iteration.

## So what happened if we call -autorelease twice?
By sending -autorelease twice to an object, it means when the current NSAutoreleasePool is drained, this object will be called -release twice.
It seems to be harmless, right?

Actually, it's serious problem.
Let break down the code into small pieces.
```
[[MyClass alloc] init]
```
When it's executed, MyClass's instance is created, we take an ownership ([First policy](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/MemoryMgmt/Articles/mmRules.html#//apple_ref/doc/uid/20000994-BAJHFBGH)). On this time, the retain count set by one.

```
[[[[MyClass alloc] init] autorelease] autorelease];
```
Then we call -autorelease twice, it will be added to current NSAutoreleasePool twice.

Finally, when NSAutoreleasePoll is getting released, the method -release will be called on this instance twice too.
When the first time -release is called, the object retains count drop to zero. According to the [-release](https://developer.apple.com/documentation/objectivec/1418956-nsobject/1571957-release), it will be destroyed itself.

Now when second -release is called, the method will send to destroyed object (dangling pointer). As a result, a whole application's crashed.

## How to prevent it happens in production.
I believe no one wants to do it. It probably occurs by someone's accident.
Or it has special meaning. Personally, even we have a special reason which we did that. It's still a smell-code and contains implicit serious problems in the future.
Not only a Pull-request reviewer pay huge attentions to discover it in thousand sand of code, every member should do too.

