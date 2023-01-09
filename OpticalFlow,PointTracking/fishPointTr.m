filename = 'halak1.mpg';
displacement = 40;

v = VideoReader(filename);
videoPlayer = vision.VideoPlayer();
objectFrame = readFrame(v);
points = detectMinEigenFeatures(im2gray(objectFrame));
pointImage = insertMarker(objectFrame,points.Location,'+','Color','white');
figure;
imshow(pointImage);
title('Detected interest points');
tracker = vision.PointTracker('MaxBidirectionalError',displacement);
initialize(tracker,points.Location,objectFrame);
while hasFrame(v)
      frame = readFrame(v);
      [points,validity] = tracker(frame);
      out = insertMarker(frame,points(validity, :),'+');
      videoPlayer(out);
end
release(videoPlayer);
