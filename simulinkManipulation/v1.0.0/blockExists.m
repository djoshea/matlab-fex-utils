function tf = blockExists(bName)
% tf = blockExists(bName)
%
% Returns true if block bName exists

% Author: Dan O'Shea dan@djoshea.com
    try
        get_param(bName, 'Handle');
        tf = true;
    catch
        tf = false;
    end 
end
