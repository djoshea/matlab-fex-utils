function numPorts = getNumOutports(blockName)
% Determine the number of block outports
%
% numPorts = getNumOutports(blockName)
%
% Return the number of output ports that blockName has

ph = get_param(blockName, 'PortHandles');
numPorts = length(ph.Outport);

end

