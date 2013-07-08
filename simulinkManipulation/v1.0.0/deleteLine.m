function deleteLine(srcBlock, srcPortNum, dstBlock, dstPortNum)
% Deletes a connection between a particular pair of blocks/ports if one exists
%
% deleteLine(srcBlock, srcPortNum, dstBlock, dstPortNum)
%
% Deletes the line connecting srcBlock/srcPortNum to dstBlock/dstPortNum
% if it exists
%

[srcPort, sysName] = makePortName(srcBlock, srcPortNum);
dstPort = makePortName(dstBlock, dstPortNum);

try
    delete_line(sysName, srcPort, dstPort);
catch exc
    % squash any errors
end

end

