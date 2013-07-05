function addLineExclusive(srcBlock, srcPortNum, dstBlocks, dstPortNums)
% addLineExclusive(srcBlock, srcPortNum, dstBlocks, dstPortNums)
%
% Adds a line from srcBlock/srcPortNum -> dstBlock/dstPortNum if it doesn't
% already exist. Makes sure that existing connections to dstBlock/dstPortNum
% are deleted if necessary, and ensures that the only outgoing connection
% from srcBlock/srcPortNum is going to each dstBlock/dstPortNum
%
% Author: Dan O'Shea dan@djoshea.com
%

    if ~blockExists(srcBlock);
        return;
    end
    if getNumOutPorts(srcBlock) < srcPortNum
        return;
    end
    if isempty(dstBlocks) || isempty(dstPortNums)
        return;
    end

    if ~iscell(dstBlocks)
        dstBlocks = {dstBlocks};
    end

    create = false(length(dstBlocks),1);
    for iDst = 1:length(dstBlocks)
        dstBlock = dstBlocks{iDst};
        dstPortNum = dstPortNums(iDst);
        
        % check incoming connections to dstBlock
        [blockName portNum] = getIncomingLineSource(dstBlock, dstPortNum);

        if isempty(blockName)
            % no connection to this dst
            create(iDst) = true;
        elseif ~strcmp(blockName, srcBlock) || portNum ~= srcPortNum
            % wrong connection to this dst
            deleteIncomingLine(dstBlock, dstPortNum);
            create(iDst) = true;
        else
            % connection okay!
            create(iDst) = false;
        end
    end
    
    % check outgoing connections from srcBlock
    [blockNames portNums] = getOutgoingLineDest(srcBlock, srcPortNum);

    if ~isempty(blockNames) && (length(blockNames) ~= length(dstBlocks) ...
            || any(~ismember(blockNames, dstBlocks)))
        % outgoing connections exists but they don't match exactly
        % delete all and start over
        deleteOutgoingLine(srcBlock, srcPortNum);
        create(:) = true;
    end

    for iDst = 1:length(dstBlocks)
        if ~create(iDst)
            continue;
        end
        dstBlock = dstBlocks{iDst};
        dstPortNum = dstPortNums(iDst);
        
        % make the line
        addLineSafe(srcBlock, srcPortNum, dstBlock, dstPortNum);
    end
    
end
