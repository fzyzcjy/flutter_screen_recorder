## flutter_screen_recorder

Experimental Flutter screen recorder with (hopefully!) speed and small size.

### Demo

#### Video

Video 1: Record all frames into byte array.
Video 2: Replay from byte array.

Remarks:

* Replay is deliberately "janky" (slow) because I want to clearly show each frame.
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
