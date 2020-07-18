function dilImg = getDilImg(dilImg, backGroundImg, dilTimes)

streElement = strel('square', 3);
for i = 1 :dilTimes
    dilImg = imdilate(dilImg, streElement);
    dilImg = dilImg & backgroundImg;
    figure, imshowpair(dilImg, backGroundImg, 'montage')
end

end