function [blockNames portNums] = getOutgoingLineDest(blockName, portNum)
% Determines all blocks/ports to which a particular outport is connected
%
% [blockNames portNums] = getOutgoingLineDest(blockName, portNum)
%
% Determine all of the block/inport numbers to which the outgoing line from blockName/portNum
% is connected to. blockNames is a cell array of names, and portNums are the corresponding 
% input port numbers

    hLine = getOutgoingLine(blockName, portNum);
    if isempty(hLine)
        blockNames = [];
        portNums = [];
        return;
    end
    
    hBlocks = get(hLine, 'DstBlockHandle');
    hBlocks = hBlocks(hBlocks ~= -1);
    if isempty(hBlocks)
        blockNames = [];
        portNums = [];
        
        return;
    end
    blockNames = arrayfun(@getBlockNameFromHandle, hBlocks, 'UniformOutput', false);
    
    hPorts = get(hLine, 'DstPortHandle');
    hPorts = hPorts(hPorts ~= -1);
    portNums = arrayfun(@(h) get_param(h, 'PortNumber'), hPorts);
end
