function names = getBusSignalNamesFromInport(bInport)
% Retrieve names of bus signals connected to inport
% 
% names = getBusSignalNamesFromInport(bInport)
%
% Retrieve the names of all signals found within a bus connected to the inport 
% block bInport.
%
% WARNING: This is occasionally unreliable, better to call 
% getIncomingBusSignalNames(block, inportNumber)
% on the block subsytem which contains that inport

nameList = get_param(bInport, 'OutputSignalNames');
if iscell(nameList)
    nameList = nameList{1};
end

if isempty(nameList) || strcmp(nameList, '?')
    names = {};
else
    names = textscan(nameList,'%s','delimiter',',');
    
    if isempty(names)
        names = {};
    else
        names = names{1}';
    end
    
    if nameList(1) == ','
        names = [{''} names];
    end
    
    for i = 1:length(names)
        if isempty(names{i})
            names{i} = sprintf('signal%d', i);
        end
    end
end

end

