## flutter_screen_recorder

Flutter screen recorder and session replay

Flutter issue: https://github.com/flutter/flutter/issues/129098

### Quick benchmark

| method | resolution | FPS | frame quality | experiment 0 | experiment 1 | experiment 2 | experiment 3 |
|---|---|---|---|---|---|---|---|
| (which is better) | (bigger) | (bigger) | (bigger) | (smaller) | (smaller) | (smaller) | (smaller) |
| vector based | +∞ | 60 | +∞ clear | 0.05MB | 0.12MB | 0.17MB | 0.16MB |
| bitmap based | 720x360 | 2 (not a typo) | blur when moving | 0.46MB | 0.59MB | 1.01MB | 0.81MB |
| android built-in | 1280x720 | 30 | clear | 15MB | 31MB | 43MB | 56MB |

Disclaimer:
(1) The code is highly experimental and has bugs, so the size may not be accurate or even incorrect.
(2) The size strongly depends on how users use the app, so I made several experiments, but it may still not reflect your own app.
(3) For "vector based", I have not written any fancy compression algorithm, e.g. not even write a diff, let alone columnar storage, etc. Only used 7z + naive encoding.

### Vector-based implementation

Please see https://github.com/fzyzcjy/flutter_screen_recorder/tree/master/vector_impl for more details. Quote from there:

Video 1: Record all frames into byte array.
Video 2: Replay from byte array.

Remarks:

* Replay is deliberately "janky" (slow), and does not follow real timing (but instead each frame takes 0.2s), because I want to clearly show each frame.
* It captures every frame in full resolution and full details, e.g. the ripple animation.
* This is just super early demo and there are (many) rough edges, but the main idea is there.
* ui.Image are not captured yet, but it seems not hard to do so (there is already API)

https://github.com/fzyzcjy/flutter_screen_recorder/assets/5236035/3a2a9298-659c-455f-b89a-9299a2168ed9

https://github.com/fzyzcjy/flutter_screen_recorder/assets/5236035/69a76027-797a-493f-88cc-56814e6aa1f5

### Bitmap-based implementation

Video 1: Record all frames into MP4 video.
Video 2: The MP4 video.

It is 2 FPS and 360x720 resolution, because a larger FPS or resolution will make the encoded video larger. However, it can surely be customized.

Again it has many rough edges (e.g. aspect ratio is wrong), just a quick demo.

https://github.com/fzyzcjy/flutter_screen_recorder/assets/5236035/479798f7-d0bf-43e2-a90c-e0793d65786c

https://github.com/fzyzcjy/flutter_screen_recorder/assets/5236035/293379b5-ad52-4c8e-b807-3e8563d6adfe

