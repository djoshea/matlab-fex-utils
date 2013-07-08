function tf = lineExists(srcBlock, srcPortNum, dstBlock, dstPortNum)
% Determines whether a line connects a particular pair of block ports
%
% tf = lineExists(srcBlock, srcPortNum, dstBlock, dstPortNum)
% 
% Return true if a line directly connecting srcBlock/srcPortNum to dstBlock/dstPortNum exists

    [blockName portNum] = getIncomingLineSource(dstBlock, dstPortNum);
    tf = strcmp(blockName, srcBlock) && portNum == srcPortNum;
end
