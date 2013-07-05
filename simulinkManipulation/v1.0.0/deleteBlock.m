function deleteBlock(blockName)
% deleteBlock(blockName)
% Deletes block blockName if it exists

    if blockExists(blockName)
        deleteBlockLines(blockName);
        delete_block(blockName);
    end
end
