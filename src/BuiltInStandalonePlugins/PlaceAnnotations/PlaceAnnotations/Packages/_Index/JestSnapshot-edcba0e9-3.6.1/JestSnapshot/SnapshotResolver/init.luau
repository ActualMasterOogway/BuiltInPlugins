local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Error_0 = v1.Error;
local l_Map_0 = v1.Map;
local l_String_0 = v1.String;
local v5 = require(l_Parent_0.Promise);
local v6 = {};
local _ = require(l_Parent_0.JestTypes);
local l_robloxGetParent_0 = require(script.Parent.utils).robloxGetParent;
local function _() --[[ Line: 36 ]] --[[ Name: getCoreScriptSyncService ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 37 ]]
        return game:GetService("CoreScriptSyncService");
    end);
    return l_status_0 and l_result_0 or nil;
end;
local v12 = nil;
local v13 = nil;
local v14 = nil;
v6.EXTENSION = "snap";
local v15 = "." .. "snap";
v6.DOT_EXTENSION = v15;
v6.isSnapshotPath = function(v16) --[[ Line: 73 ]] --[[ Name: isSnapshotPath ]]
    -- upvalues: l_String_0 (copy), v15 (copy)
    return l_String_0.endsWith(v16, v15);
end;
local v17 = l_Map_0.new();
v6.buildSnapshotResolver = function(v18, _) --[[ Line: 81 ]] --[[ Name: buildSnapshotResolver ]]
    -- upvalues: v5 (copy), v17 (copy), v13 (ref)
    return v5.resolve():andThen(function() --[[ Line: 92 ]]
        -- upvalues: v18 (copy), v17 (ref), v13 (ref)
        local l_rootDir_0 = v18.rootDir;
        local v21 = v17:get(l_rootDir_0);
        local v22 = if v21 ~= nil then v21 else v13():expect();
        v17:set(l_rootDir_0, v22);
        return v22;
    end);
end;
v13 = function() --[[ Line: 108 ]] --[[ Name: createSnapshotResolver ]]
    -- upvalues: v5 (copy), v14 (ref)
    return v5.resolve():andThen(function() --[[ Line: 112 ]]
        -- upvalues: v14 (ref)
        return v14();
    end);
end;
v14 = function() --[[ Line: 122 ]] --[[ Name: createDefaultSnapshotResolver ]]
    -- upvalues: v15 (copy), v12 (ref), l_Error_0 (copy), l_robloxGetParent_0 (copy)
    return {
        resolveSnapshotPath = function(_, v24) --[[ Line: 124 ]] --[[ Name: resolveSnapshotPath ]]
            -- upvalues: v15 (ref), v12 (ref), l_Error_0 (ref), l_robloxGetParent_0 (ref)
            return {
                getInstance = function() --[[ Line: 132 ]] --[[ Name: getInstance ]]
                    -- upvalues: v24 (copy), v15 (ref)
                    local l_Name_0 = v24.Name;
                    local v26 = nil;
                    pcall(function() --[[ Line: 135 ]]
                        -- upvalues: v26 (ref), v24 (ref), l_Name_0 (copy), v15 (ref)
                        v26 = v24.Parent.__snapshots__[l_Name_0 .. v15];
                    end);
                    return v26;
                end, 
                getPath = function() --[[ Line: 140 ]] --[[ Name: getPath ]]
                    -- upvalues: v12 (ref), l_Error_0 (ref), v24 (copy), l_robloxGetParent_0 (ref), v15 (ref)
                    if v12 == nil then
                        local l_status_1, l_result_1 = pcall(function() --[[ Line: 37 ]]
                            return game:GetService("CoreScriptSyncService");
                        end);
                        v12 = l_status_1 and l_result_1 or nil or false;
                    end;
                    if not v12 then
                        error(l_Error_0("Attempting to save snapshots in an environment where CoreScriptSyncService is inaccessible.\n" .. "You may need to pass in --load.asRobloxScript."));
                    end;
                    local l_status_2, l_result_2 = pcall(function() --[[ Line: 153 ]]
                        -- upvalues: v12 (ref), v24 (ref)
                        return v12:GetScriptFilePath(v24);
                    end);
                    if not l_status_2 then
                        if string.find(l_result_2, "lacking permission 5") then
                            error(l_Error_0.new(string.format("Could not get a snapshot path for test file '%s'. You may need to pass in --load.asRobloxScript", v24.Name)));
                        else
                            error(l_Error_0.new(string.format("Could not get a snapshot path for test file '%s' because of the following error: %s", v24.Name, l_result_2)));
                        end;
                    end;
                    return ("%s/__snapshots__/%s"):format(l_robloxGetParent_0(l_result_2, 1), v24.Name .. v15 .. ".lua");
                end
            };
        end
    };
end;
return v6;