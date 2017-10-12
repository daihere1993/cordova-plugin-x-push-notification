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

notification.on('push', function (result) {
    // data.message,
	// data.title,
	// data.count,
	// data.sound,
	// data.image,
	// data.additionalData
    alert(result.message);
});
```

# Tip

> In the china, google notification service is not work, we need choose another notification service, 
> and [cordova-plugin-messager](https://github.com/daihere1993/cordova-plugin-messager) is my personal
> project that is a remote message plugin base on MQTT, maybe you can try it.

# LICENSE

[MIT LICENSE](http://opensource.org/licenses/MIT)
