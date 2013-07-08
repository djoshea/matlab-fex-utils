function redrawLinesWithin(block)
% Reroute all lines connected within a block
%
% redrawLinesWithin(block)
%
% Delete and redraw all lines within block to enable better autorouting
% based heavily on http://www.mathworks.com/matlabcentral/fileexchange/34237
%
% Careful using this in callbacks, as it may make signal propagation never
% appear in the GUI.

if ~blockExists(block)
    return;
end

blks = find_system(block, 'FollowLinks', 'on', 'LookUnderMasks', 'all', ...
        'SearchDepth', 1);

for i = 1:length(blks)
    redrawLines(blks{i});
end
   
