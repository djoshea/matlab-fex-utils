function deleteBrokenOutgoingLines(blockName, portNum)
% deleteBrokenOutgoingLines(blockName, portNum)
%
% Deletes the lines emerging from blockName/portNum which have no destination block 

hLine = getOutgoingLine(blockName, portNum);
if isempty(hLine)
    return;
end

hBlocks = get(hLine, 'DstBlockHandle');
if hBlocks == -1
    delete(hLine);
end

end

