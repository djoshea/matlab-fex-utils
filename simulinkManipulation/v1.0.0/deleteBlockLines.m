function deleteBlockLines(blockName)
% deleteBlockLines(blockName)
%
% Delete incoming and outgoing lines from blockName

    if blockExists(blockName)
        % delete outgoing lines
        nPorts = getNumOutPorts(blockName);
        for iPort = 1:nPorts
            deleteOutgoingLine(blockName, iPort);
        end
        
        % delete incoming lines
        nPorts = getNumInPorts(blockName);
        for iPort = 1:nPorts
            deleteIncomingLine(blockName, iPort);
        end
    end
end
