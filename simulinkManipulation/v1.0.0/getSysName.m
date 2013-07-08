function sysName = getSysName(bName)
% Determines the name of the outermost Simulink system containing a block
%
% sysName = getSysName(bName)
%
% Return the name of the outermost Simulink system which contains block bName

    firstSlash = find(bName == '/', 1, 'first');
    if ~isempty(firstSlash)
        sysName = bName(1:firstSlash-1);
    else
        sysName = '';
    end
end
