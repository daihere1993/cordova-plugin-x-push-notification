# cordova-plugin-x-push-notification

 📲 This is a push notification cordova-plugin for android and iOS.

# Feature

- Get iOS device token.
- Get iOS remote notification info.
- Push notification for android and iOS.

# Install

```bash
cordova plugin add cordova-plugin-x-push-notification
```

or

```bash
ionic plugin add cordova-plugin-x-push-notification
```

# Useage

```Javascript
var notification = new XPushNotification();

notification.on('regist', function (deviceID) {
    alert(deviceID);
});
/**
 * @reture {Object} value: message、title
 */
notification.on('push', function (result) {
    alert(result.message);
});
```

# LICENSE

[MIT LICENSE](http://opensource.org/licenses/MIT)
