C=imread("o.jpg");

C1=rgb2gray(im2double(C));

K = fspecial('sobel'); % Sobel kernel
GY = imfilter(C1, K); % vertical gradients
GX = imfilter(C1, K'); % horizontal gradients
GM = sqrt(GX.^2 + GY.^2); % gradient magnitude

t = graythresh(GM);
C2 = GM > t;

C3=bwmorph(C2,'skel', Inf);

C4=bwmorph(C3,'bridge');
figure,imshow(C4);
figure,imshow(edge(C1));

