local l_Parent_0 = script.Parent.Parent;
local l_Error_0 = require(l_Parent_0.LuauPolyfill).Error;
local v2 = require(script.Parent.getParent);
local v3 = require(script.Parent.getDataModelService)("FileSystemService");
return function(v4) --[[ Line: 12 ]] --[[ Name: ensureDirectoryExists ]]
    -- upvalues: v2 (copy), v3 (copy), l_Error_0 (copy)
    local v5 = v2(v4, 1);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 15 ]]
        -- upvalues: v3 (ref), v5 (copy)
        if v3 and not v3:Exists(v5) then
            v3:CreateDirectories(v5);
        end;
    end);
    if not l_status_0 and l_result_0:find("Error%(13%): Access Denied%. Path is outside of sandbox%.") then
        error(l_Error_0.new("Provided path is invalid: you likely need to provide a different argument to --fs.readwrite.\n" .. "You may need to pass in `--fs.readwrite=$PWD`"));
    end;
end;