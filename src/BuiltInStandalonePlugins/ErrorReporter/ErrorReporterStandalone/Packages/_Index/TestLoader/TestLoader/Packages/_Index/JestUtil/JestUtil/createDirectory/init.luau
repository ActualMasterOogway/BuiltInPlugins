local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = {};
local l_Error_0 = require(l_Parent_1.LuauPolyfill).Error;
local v4 = require(l_Parent_0.getFileSystemService);
local _ = require(l_Parent_1.JestTypes);
v2.default = function(v6) --[[ Line: 22 ]] --[[ Name: createDirectory ]]
    -- upvalues: v4 (copy), l_Error_0 (copy)
    local v7 = v4();
    local v8, v9, v10 = pcall(function() --[[ Line: 25 ]]
        -- upvalues: v7 (copy), v6 (copy)
        v7:CreateDirectories(v6);
    end);
    if not v8 then
        if v9:find("Error%(13%): Access Denied%. Path is outside of sandbox%.") then
            error(l_Error_0.new("Provided path is invalid: you likely need to provide a different argument to --fs.readwrite.\n" .. "You may need to pass in `--fs.readwrite=$PWD`"));
        end;
        if v9.code ~= "EEXIST" then
            error(v9);
        end;
    end;
    if v10 then
        return v9;
    else
        return;
    end;
end;
return v2;