# DebounceWrapper
Debounce a block of method call in Swift.

I couldn't find a properly applied Swift Debouncer on GitHub so I've created a new one in a few minutes.

Debouncing is NOT Throttling. You can Google to learn the difference.

What this Debounces class basically does is; it accepts a block of call but it doesn't fire it up until it's sure that you're not going to make another request anytime soon.

Example use case:
You have an object to be sent to an API according to user choices in the app. However, user can change their choice anytime soon. Maybe user makes many many choices in short time differences. So; rather than calling your update API again and again on every single millisecond; you make sure that user's done via Debounce.

Why not use Throttling?:
Throttling would accept 1 call within a given time period but that wouldn't have to necessarily be the last call. By doing an update; we want our chosen call to be the last call. Debouncing sends the last call when it's sure no other calls are going to be made anytime soon.

Sample usage:
```
var debouncerUpdate = Debouncer(timeIntervalDebounce: 0.5)

debouncerUpdate.bounceWithBlock { // Code to do latest updates such as making an API call }
```
