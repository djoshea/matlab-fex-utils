function numPorts = getNumInports(blockName)
% numPorts = getNumInports(blockName)
% Return the number of inputs that blockName has

ph = get_param(blockName, 'PortHandles');
numPorts = length(ph.Inport);

end

