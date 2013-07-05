function deleteOutgoingLine(blockName, portNum)
% deleteOutgoingLine(blockName, portNum)
%
% Delete outgoing line from blockName/portNum

    if blockExists(blockName)
        hLine = getOutgoingLine(blockName, portNum);
        if ~isempty(hLine)
            delete(hLine);
        end
    end
end
