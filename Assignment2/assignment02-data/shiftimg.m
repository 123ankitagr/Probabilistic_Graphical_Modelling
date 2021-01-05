function simg = shiftimg(img, offset, fillValue)
% SHIFTIMG Translates img by offset shift, cropping the result to the original size. 
% The empty space will be filled with fillValue.
% You can use 0 for sum-product and some very small value (e.g. 1e-12) for
% min-sum if you shift before applying the logarithm (if you shift
% afterwards, use 1e12 and not Inf!)
    [kr,kc] = size(img);
    
    T = [1 0 0; 0 1 0; offset(1) offset(2) 1];
    tform = maketform('affine', T);        
    simg = imtransform(img,tform,'nearest','XData',[1 kc],'YData',[1 kr],'FillValues',fillValue);        
end

