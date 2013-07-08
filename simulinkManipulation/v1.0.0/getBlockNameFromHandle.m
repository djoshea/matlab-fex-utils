function name = getBlockNameFromHandle(hBlock)
% Convert block handle to block name
%
% name = getBlockNameFromHandle(hBlock)
%
% Given a block handle (e.g. as returned by gcbh), determine the name of the block
% (e.g. as returned by gcb)

    name = getfullname(hBlock);
    % correct odd issue with newlines appearing instead of spaces
    name(name == char(10)) = char(32);
end
