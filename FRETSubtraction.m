function FRETSubtraction(filepath,nCh)
% Set the path to your image file below
fileinfo=imfinfo(filepath);
% Set the number of frames in your image below
numChannels=nCh;
numFrames=length(fileinfo)/nCh;

% This part sets up the memory to import the image, then loops through each 
% frame in the image and imports it. The warning thing below is to stop you
% from getting spammed by MATLAB since the microscope doesn't contain a header
% on the image that MATLAB is expecting.
warning('off','MATLAB:imagesci:tiffmexutils:libtiffErrorAsWarning')
imageMatrix=zeros(512,512,numChannels,numFrames);
for i=1:3:(numChannels*numFrames)
    currentFrame=int8(i-((2*i)/3)+(2/3));
	imageMatrix(:,:,1,currentFrame)=imread(filepath,'Index',i);
    imageMatrix(:,:,2,currentFrame)=imread(filepath,'Index',i+1);
    imageMatrix(:,:,3,currentFrame)=imread(filepath,'Index',i+2);
end
warning('on','all')

for i=1:numFrames
    imageMatrix(:,:,1,i)= imageMatrix(:,:,1,i)-(196.83*exp(0.0001*imageMatrix(:,:,2,i)));
end

imageMatrix = uint16(imageMatrix);

imwrite(imageMatrix(:,:,1,1),[filepath(1:end-4) '_new.tif'],'tif')
imwrite(imageMatrix(:,:,2,1),[filepath(1:end-4) '_new.tif'],'tif','WriteMode','append')
imwrite(imageMatrix(:,:,3,1),[filepath(1:end-4) '_new.tif'],'tif','WriteMode','append')
for k=2:numFrames
    for j=1:3
        imwrite(imageMatrix(:,:,j,k),[filepath(1:end-4) '_new.tif'],'tif','WriteMode','append')
    end
end

end