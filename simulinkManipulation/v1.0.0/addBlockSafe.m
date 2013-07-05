function addBlockSafe(bSrc, bDest, varargin)
% addBlockSave(bSrc, bDest, varargin)
%
% Adds a block by copying bSrc to name bDest, specifying additional block parameters
% passed via named property value pairs. If bDest already exists, ensures that block
% parameters are set as specified in bDest.
%
% Author: Dan O'Shea dan@djoshea.com
%

if ~blockExists(bDest)
    add_block(bSrc, bDest, varargin{:});
else
    if length(varargin) > 1
        setBlockParam(bDest, varargin{:});
    end
end

end
