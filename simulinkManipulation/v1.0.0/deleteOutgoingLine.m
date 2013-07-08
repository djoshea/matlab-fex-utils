function deleteOutgoingLine(blockName, portNum)
% Deletes a line connected to a block's specific outport
%
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
