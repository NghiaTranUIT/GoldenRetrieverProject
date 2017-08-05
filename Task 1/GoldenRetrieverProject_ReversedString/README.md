
Write a function which takes a string as an argument and returns the string reversed. For example, "abcdef" becomes "fedcba". Do not use the reverse method. Does it work with emojis?

## Requirement
Because Xcode doesn't support Playground for Objective-C (actually it's https://github.com/krzysztofzablocki/Playgrounds)
So I created a self-explanatory iOS application for a demonstration.

## System
+ iOS >= 9.3
+ Xcode 9 beta 4

## What've I done?
+ Fundamental algorithm to reserve string
+ Work with emoji and special text
+ Defined Processor and Middleware protocols with common methods.
+ Unit Test with various cases.

## Achievement
+ Reverse String
+ Support Emoji and special characters
+ Follow SOLID principles.
+ Easily extend in future by creating new Middleware. For example: AddHashtagMiddleware, ConvertTextToEmojiMiddleware, etc.
+ Unit test.

## Algorithm
![alt text](https://github.com/NghiaTranUIT/GoldenRetrieverProject/blob/master/Task%201/Reversed_String_Diagram.jpg)

## Does it work with emojis?
Yes, it's worked as expected with Emoji.
The reason we should pay attention when working with emoji or special character because [string length] return the count of unichar not the visible length of the string.
In addition, Emoji will be represented by 2 unichar.

So,
```
    NSString *emoji = @"🔥";
    // Incorrect
    // emoji.length = 2
```
Another approach can be
```
    const char *cString = [myTextBox UTF8String];
    int textLength = (int)strlen(cString);
```

Personally, I don't want to mess with low-level code. I prefer high-level code in particular situation.

The best, elegant solution which provided from Apple is
```
    // Handle emoji and special characters
    [text enumerateSubstringsInRange: range
                                      options:NSStringEnumerationByComposedCharacterSequences
                                   usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                       [result addObject:substring];
                                   }];
 ```
