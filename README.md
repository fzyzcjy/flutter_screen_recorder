## flutter_screen_recorder

Flutter screen recorder and session replay

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

https://github.com/fzyzcjy/flutter_screen_recorder/assets/5236035/479798f7-d0bf-43e2-a90c-e0793d65786c

https://github.com/fzyzcjy/flutter_screen_recorder/assets/5236035/293379b5-ad52-4c8e-b807-3e8563d6adfe

