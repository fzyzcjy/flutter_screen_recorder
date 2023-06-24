## flutter_screen_recorder

Experimental Flutter screen recorder with (hopefully!) speed and small size.

### Demo

#### Video

Video 1: Record all frames into byte array.
Video 2: Replay from byte array.

Remarks:

* Replay is deliberately "janky" (slow), and does not follow real timing (but instead each frame takes 0.2s), because I want to clearly show each frame.
* It captures every frame in full resolution and full details, e.g. the ripple animation.
* This is just super early demo and there are (many) rough edges, but the main idea is there.
* ui.Image are not captured yet, but it seems not hard to do so (there is already API)

https://github.com/fzyzcjy/flutter_screen_recorder/assets/5236035/3a2a9298-659c-455f-b89a-9299a2168ed9

https://github.com/fzyzcjy/flutter_screen_recorder/assets/5236035/69a76027-797a-493f-88cc-56814e6aa1f5

#### Reproduction

As usual, need to compile with custom engine before the code changes are merged into Flutter.

* Gallery (or whatever app you want to try) https://github.com/fzyzcjy/gallery (e.g. commit 417a31b)
* Flutter framework https://github.com/fzyzcjy/flutter/tree/screen-recorder (e.g. commit 09957de)
* Flutter engine https://github.com/fzyzcjy/engine/tree/screen-recorder (e.g. commit 9a3c1c4)

Steps:

1. Play with the app
2. Tap "stop" floating action button
3. Tap "replay" (the monitor icon) floating action button, and see the replay

### Expected features in v1.0

The demo above only demonstrates the core functionality works. In order to make it a full screen recorder and session replayer (debugger), there are more work (though not hard) to be done. More specifically, I expect to have such API:

Layer 1: Record & replay

* To record, simply wrap with `ScreenRecorderWidget(child: ...)`, and call `ScreenRecorder.start()` / `.pause()`.
* To replay, simply use `ScreenPlayerWidget`, with features like a normal video player.

Layer 2: "Session replay" for debugging

* Automatically record and save to local disk.
* When the user detects a bug and you want to know what happens before that bug, call something like `ScreenRecorder.getRecorded(startTime, endTime)` and send to you / upload to your server.

Misc

* Be clear about privacy implications so that developers who use the package can communicate that to their users. Also probably add a mode to remove all text (but only remain their layout).
