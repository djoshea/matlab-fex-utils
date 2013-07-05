function deleteBrokenIncomingLines(blockName, portNum)
% deleteBrokenIncomingLines(blockName, portNum)
%
% Deletes the line coming into blockName/portNum if it has no source
% on the other end

hLine = getIncomingLine(blockName, portNum);
if isempty(hLine)
    return;
end

hBlock = get_param(hLine, 'SrcBlockHandle');
if(hBlock == -1)
    delete(hLine);
end

end

