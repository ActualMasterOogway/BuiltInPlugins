local l_Parent_0 = script.Parent.Parent;
local l_Error_0 = require(l_Parent_0.LuauPolyfill).Error;
return function() --[[ Line: 8 ]] --[[ Name: getFileSystemService ]]
    -- upvalues: l_Error_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 9 ]]
        return _G.__MOCK_FILE_SYSTEM__ or game:GetService("FileSystemService");
    end);
    if not l_status_0 then
        error(l_Error_0.new("Attempting to save snapshots in an environment where FileSystemService is inaccessible."));
    end;
    return l_result_0;
end;