local l_Parent_0 = script.Parent.Parent;
local l_Error_0 = require(l_Parent_0.LuauPolyfill).Error;
local l_getDataModelService_0 = require(l_Parent_0.RobloxShared).getDataModelService;
return function() --[[ Line: 25 ]] --[[ Name: getFileSystemService ]]
    -- upvalues: l_getDataModelService_0 (copy), l_Error_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 26 ]]
        -- upvalues: l_getDataModelService_0 (ref)
        return _G.__MOCK_FILE_SYSTEM__ or l_getDataModelService_0("FileSystemService");
    end);
    if not l_status_0 then
        error(l_Error_0.new("Attempting to save snapshots in an environment where FileSystemService is inaccessible."));
    end;
    return l_result_0;
end;