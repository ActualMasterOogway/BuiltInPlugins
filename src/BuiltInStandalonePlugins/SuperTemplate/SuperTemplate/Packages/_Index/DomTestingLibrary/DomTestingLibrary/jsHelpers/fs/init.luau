local l_Parent_0 = script.Parent.Parent.Parent;
local l_Error_0 = require(l_Parent_0.LuauPolyfill).Error;
local v2 = nil;
local function _() --[[ Line: 10 ]] --[[ Name: getFileSystemService ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 11 ]]
        return game:GetService("FileSystemService");
    end);
    return l_status_0 and l_result_0 or nil;
end;
local function v11(v6) --[[ Line: 20 ]] --[[ Name: ensureDirectoryExists ]]
    -- upvalues: v2 (ref)
    local v7 = v6:split("/");
    v7 = table.pack(table.unpack(v7, 1, #v7 - 1));
    local v8 = table.concat(v7, "/");
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 24 ]]
        -- upvalues: v2 (ref), v8 (copy)
        if not v2:Exists(v8) then
            v2:CreateDirectories(v8);
        end;
    end);
    if not l_status_1 and l_result_1:find("Error%(13%): Access Denied%. Path is outside of sandbox%.") then
        error("Provided path is invalid: you likely need to provide a different argument to --fs.read.\n" .. "You may need to pass in `--fs.read=$PWD`");
    end;
end;
return {
    readFileSync = function(v12) --[[ Line: 39 ]] --[[ Name: readFileSync ]]
        -- upvalues: v2 (ref), l_Error_0 (copy), v11 (copy)
        if v2 == nil then
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 11 ]]
                return game:GetService("FileSystemService");
            end);
            v2 = l_status_2 and l_result_2 or nil;
        end;
        if not v2 then
            error(l_Error_0.new("Attempting to read file in an environment where FileSystemService is inaccessible."));
        end;
        v11(v12);
        return v2:ReadFile(v12);
    end
};