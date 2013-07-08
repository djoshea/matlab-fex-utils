function setOutputSignalName(blockName, portNum, name)
% Sets the name of a block's output signal
%
% setOutputSignalName(blockName, portNum, name)
%
% Sets the name of the outgoing signal from blockName/portNum 

    ph = get_param(blockName, 'PortHandles');
    out = ph.Outport;
    
    if portNum > length(out)
        error('Output port %d not found on block %s', portNum, blockName);
    end
    
    hPort = out(portNum);
    oldName = get_param(hPort, 'Name');
    if ~strcmp(oldName, name)
        set_param(hPort, 'Name', name);
    end

end
