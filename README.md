# DebounceWrapper
Debounce a block of method call in Swift.

I couldn't find a properly applied Swift Debouncer on GitHub so I've created a new one in a few minutes.

Debouncing is NOT Throttling. You can Google to learn the difference.

What this Debounces class basically does is; it accepts a block of method call but it doesn't fire it up until it's sure that you're not going to make another call soon.

Example use case:
Send api request to search user input text in real time. You want to make sure the input has stopped before making an api call.

Sample usage:
```
let debouncerUpdate = Debouncer(timeIntervalDebounce: 0.5)

debouncerUpdate.bounceWithBlock { // Code to do latest updates such as making an API call }
```

Learn more about debounce - throttle difference in programming here:
http://demo.nimius.net/debounce_throttle/
