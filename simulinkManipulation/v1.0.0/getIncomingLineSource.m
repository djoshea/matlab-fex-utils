function [blockName portNum] = getIncomingLineSource(blockName, portNum)
% Determines which block is connected to this block at a particular inport
%
% [blockNameSource portNumSource] = getIncomingLineSource(blockName, portNum)
%
% Return the blockNameSource and outport number portNumSource which is connected
% to blockName/portNum. If no line is connected, both outputs will be [].

    hLine = getIncomingLine(blockName, portNum);
    if isempty(hLine)
        blockName = [];
        portNum = [];
    else
        hBlock = get_param(hLine, 'SrcBlockHandle');
        if(hBlock == -1)
            blockName = [];
            portNum = [];
            return;
        end
        blockName = getfullname(hBlock);
        hPort = get_param(hLine, 'SrcPortHandle');
        portNum = get_param(hPort, 'PortNumber');
    end
end
