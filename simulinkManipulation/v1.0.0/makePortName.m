function [portName, sysName] = makePortName(bName, portNum)
% [portName, sysName] = makePortName(bName, portNum)
% Return the port name string and system name string to be used when describing
% block bName port number portNum

    % Find the leaf of the block path/name
    lastSlash = find(bName == '/', 1, 'last');
    if ~isempty(lastSlash)
        sysName = bName(1:lastSlash-1);
        bName = bName(lastSlash+1:end);
    else
        sysName = '';
    end
    
    portName = [bName '/' num2str(portNum)];
end
