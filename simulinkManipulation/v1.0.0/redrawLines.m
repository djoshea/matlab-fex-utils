function redrawLines(block)
% Reroute all lines connected to block
%
% redrawLines(block)
%
% Delete and redraw all lines connected to block to enable better autorouting
% based heavily on http://www.mathworks.com/matlabcentral/fileexchange/34237
%
% WARNING: Careful using this in callbacks, as it may make signal propagation never
% appear in the GUI. Generally this should be avoided in mask callbacks for this reason.

if ~blockExists(block)
    return;
end

nIn = getNumInPorts(block);
for i = 1:nIn
    [blockName portNum] = getIncomingLineSource(block, i);
    deleteIncomingLine(block, i);
    addLineSafe(blockName, portNum, block, i);
end

nOut = getNumOutPorts(block);
for i = 1:nOut
    [blockNames portNums] = getOutgoingLineDest(block, i);
    deleteOutgoingLine(block, i);
    addLineExclusive(block, i, blockNames, portNums);
end
