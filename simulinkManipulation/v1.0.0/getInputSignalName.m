function name = getInputSignalName(blockName, portNum)
% name = getInputSignalName(blockName, portNum)
%
% Determine the name of the signal connected to blockName/portNum, or '?' if the 
% name cannot be determined. Automatically strips surrounding < > brackets which 
% appear when incoming signals arise from a bus selector.

    ph = get_param(blockName, 'PortHandles');
    in = ph.Inport;
    
    if portNum > length(in)
        error('Input port %d not found on block %s', portNum, blockName);
    end
    
    hPort = in(portNum);
    name = get_param(hPort, 'Name');
    
    if isempty(name)
        name = '?';
    end
    if name(1) == '<' && name(end) == '>'
        name = name(2:end-1);
    end
end
