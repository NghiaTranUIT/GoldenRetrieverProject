
Make an app that pulls weather forecast data for the user's current location, from http://openweathermap.org/ , and displays it nicely. The app doesn't need to look very fancy. You also need to sign up for a free licence key. (You don't need to submit the key, we have our own.)

## Requirement
Navigate to workspace directory.
```
$ > pod install
```
Replace your own key at *OpenWeatherAppID* in WeatherCore/Constants.h

```
// API
static NSString * _Nonnull const OpenWeatherAppID = @"xxx";
```

## System
+ iOS >= 9.3
+ Xcode 9 beta 4

## What've I done?
+ Weather Core and Weather App.
+ Following SOLID pricinple.
+ Weather Core and Weather app are heavily dependencied on various Abtracts classes instead of concrete classes.
+ Easily extend new Weather Service For example, YahooWeatherService, GoogleWeatherService.
+ MVVM (but no binding isn't supported).
+ Simple Internet reachability.
+ Ability to re-check Location permission when app enters to foreground state.

## Achievements
+ Weather Core framework takes 100% responsibility for Data logic.
+ Weather App only is responsible for Business logic.
+ Weather Core dones't care about UI. It works flawlessly with macOS or tvOS.
+ Flexible to ship Weather Core to community instead of encapsulating all-in-one in single project.
+ Weather Core proved various essential protocols such as WeatherServiceProtocol, Decodable, Requestable, Parammeter ... in common tasks. It's crucial decision to ship our SDK to Swift developers who prefer Struct than classes.
+ Weather Core has a capability to extend to any kind of Weather Services easaily.
+ Weather App only has acknowledgments about ViewModel and Model object classes in WeatherCore. It doesn't need to take care about what kind of weather services or networks in a deep level.
+ Weather App also provide many useful data source protocols. For example, WeatherAttributeDataSource or WeatherViewDataSource.
+ Get rid of JSONMapper (3rd party). I implemented it by myself with straighforward features.
+ and minor hidden features ... ; ]

## What haven't I done (yet)?
As I only have 24 hours for 3 tasks. There are few minor things which I haven't satisfied yet.
+ Still dependency on AFNetworking. The reason I've struggled with URLEncoding and it makes me a little bit stress. So I made a decision to reuse AFNetworking to workaround firstly. => In future, I will implement Network class, no dependency on any 3rd parties. Convenience to ship our SDK to the world.
+ Few classes are still depended on certain classes. As SOLID principle, it's not good. We should get rid of those by creating some abstract protocols.
+ Missing unit-tests 😅. I admit it's really easy to test WeatherCore. I will do it after a submission.

## Diagrams

### Infrastructure
![alt text](https://github.com/NghiaTranUIT/GoldenRetrieverProject/blob/master/Task%203/Diagram/Weather_diagram_1.jpg)

### Weather iOS app
![alt text](https://github.com/NghiaTranUIT/GoldenRetrieverProject/blob/master/Task%203/Diagram/Weather_diagram_2.jpg)

### Weather Core
![alt text](https://github.com/NghiaTranUIT/GoldenRetrieverProject/blob/master/Task%203/Diagram/Weather_diagram_3.jpg)

