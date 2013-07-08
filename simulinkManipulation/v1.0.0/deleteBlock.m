function deleteBlock(blockName)
% Deletes a block if it exists
%
% deleteBlock(blockName)
%
% Deletes block blockName if it exists

    if blockExists(blockName)
        deleteBlockLines(blockName);
        delete_block(blockName);
    end
end
