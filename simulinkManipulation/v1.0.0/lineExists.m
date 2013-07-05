function tf = lineExists(srcBlock, srcPortNum, dstBlock, dstPortNum)
% tf = lineExists(srcBlock, srcPortNum, dstBlock, dstPortNum)
% Return true if a line directly connecting srcBlock/srcPortNum to dstBlock/dstPortNum exists

    [blockName portNum] = getIncomingLineSource(dstBlock, dstPortNum);
    tf = strcmp(blockName, srcBlock) && portNum == srcPortNum;
end
