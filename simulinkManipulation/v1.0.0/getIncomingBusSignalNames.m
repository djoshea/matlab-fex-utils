function names = getIncomingBusSignalNames(block, inportNumber)
% Retrieves names of bus signals connected to block at specific inport 
%
% names = getIncomingBusSignalNames(block, inportNumber)
%
% Retrieve the names of all signals found within the bus connected to 
% block/inportNumber 

names = {};
ph = get_param(block, 'PortHandles');
in = ph.Inport;
if inportNumber > length(in)
    error('Block does not have enough inports');
end

% get the line connected to this inport
line = get(ph.Inport(inportNumber), 'Line');
if ~ishandle(line)    
    return;
end

% get the block outport connected via this line
sourcePort = get(line, 'SrcPortHandle');
if ~ishandle(sourcePort)
    return;
end

% get names propagaged by this port
nameList = get(sourcePort, 'PropagatedSignals');

if iscell(nameList)
    nameList = nameList{1};
end

if isempty(nameList) || strcmp(nameList, '?')
    names = {};
else
    nameList = strtrim(nameList);
    names = textscan(nameList,'%s','delimiter',',');
    
    if isempty(names)
        names = {};
    else
        names = names{1}';
    end
    
    % handle missed ends of string
    if nameList(end) == ','
        names = [names {''}];
    end
    
    for i = 1:length(names)
        if isempty(names{i})
            names{i} = sprintf('signal%d', i);
        end
    end
end

end

