# AVFoundation

To present a video content the user should create an instance of `AVPlayer` and a child of `CALayer` - `AVPlayerLayer`.

The video will be shown on the layer. It is required to add layer to the `UIView` that will be displaying.

# VLC

VLC under the hood uses a little bit of `AVFoundation`. Mainly it uses `AVSampleBufferDisplayLayer` where with the help of OpenGL (I'm not really sure about OpenGL, this is my guess) the video is rendered.