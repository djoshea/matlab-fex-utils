function setBlockSize(block, width, height)
% Set block position
%
% setBlockSize(block, width, height)
%
% Sets a block's width and height. If either parameter is specified as NaN,
% keeps the existing value for that size dimension.

setBlockPosition(block, NaN, NaN, width, height);

end
