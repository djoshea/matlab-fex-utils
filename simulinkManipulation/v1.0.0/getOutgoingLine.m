function hLine = getOutgoingLine(blockName, portNum)
% Gets a handle to the line connected to a particular block outport
%
% hLine = getOutgoingLine(blockName, portNum)
% Returns a handle to the outgoing line connected to blockName/portNum

    ph = get_param(blockName, 'PortHandles');
    
    hOutports = ph.Outport;
    
    if portNum > numel(hOutports)
        error('Output port %d not found on block %s', portNum, blockName);
    end
    
    hOut = hOutports(portNum);
    hLine = get_param(hOut, 'Line');
    
    if hLine == -1
        % no incoming connections
        hLine = [];
        return;
    end

end
