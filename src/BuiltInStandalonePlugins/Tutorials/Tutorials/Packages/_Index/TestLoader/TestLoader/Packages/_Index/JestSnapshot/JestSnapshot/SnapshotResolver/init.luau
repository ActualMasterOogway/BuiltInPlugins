local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Error_0 = v1.Error;
local l_Map_0 = v1.Map;
local l_String_0 = v1.String;
local v5 = require(l_Parent_0.Promise);
local v6 = {};
local _ = require(l_Parent_0.JestTypes);
local v8 = require(l_Parent_0.RobloxShared);
local l_getParent_0 = v8.getParent;
local v10 = v8.getDataModelService("CoreScriptSyncService");
local v11 = nil;
local v12 = nil;
v6.EXTENSION = "snap";
local v13 = "." .. "snap";
v6.DOT_EXTENSION = v13;
v6.isSnapshotPath = function(v14) --[[ Line: 66 ]] --[[ Name: isSnapshotPath ]]
    -- upvalues: l_String_0 (copy), v13 (copy)
    return l_String_0.endsWith(v14, v13);
end;
local v15 = l_Map_0.new();
v6.buildSnapshotResolver = function(v16, _) --[[ Line: 74 ]] --[[ Name: buildSnapshotResolver ]]
    -- upvalues: v5 (copy), v15 (copy), v11 (ref)
    return v5.resolve():andThen(function() --[[ Line: 85 ]]
        -- upvalues: v16 (copy), v15 (ref), v11 (ref)
        local l_rootDir_0 = v16.rootDir;
        local v19 = v15:get(l_rootDir_0);
        local v20 = if v19 ~= nil then v19 else v11():expect();
        v15:set(l_rootDir_0, v20);
        return v20;
    end);
end;
v11 = function() --[[ Line: 101 ]] --[[ Name: createSnapshotResolver ]]
    -- upvalues: v5 (copy), v12 (ref)
    return v5.resolve():andThen(function() --[[ Line: 105 ]]
        -- upvalues: v12 (ref)
        return v12();
    end);
end;
v12 = function() --[[ Line: 115 ]] --[[ Name: createDefaultSnapshotResolver ]]
    -- upvalues: v13 (copy), v10 (copy), l_Error_0 (copy), l_getParent_0 (copy)
    return {
        resolveSnapshotPath = function(_, v22) --[[ Line: 117 ]] --[[ Name: resolveSnapshotPath ]]
            -- upvalues: v13 (ref), v10 (ref), l_Error_0 (ref), l_getParent_0 (ref)
            return {
                getInstance = function() --[[ Line: 125 ]] --[[ Name: getInstance ]]
                    -- upvalues: v22 (copy), v13 (ref)
                    local l_Name_0 = v22.Name;
                    local v24 = nil;
                    pcall(function() --[[ Line: 128 ]]
                        -- upvalues: v24 (ref), v22 (ref), l_Name_0 (copy), v13 (ref)
                        v24 = v22.Parent.__snapshots__[l_Name_0 .. v13];
                    end);
                    return v24;
                end, 
                getPath = function() --[[ Line: 133 ]] --[[ Name: getPath ]]
                    -- upvalues: v10 (ref), l_Error_0 (ref), v22 (copy), l_getParent_0 (ref), v13 (ref)
                    if not v10 then
                        error(l_Error_0("Attempting to save snapshots in an environment where CoreScriptSyncService is inaccessible.\n" .. "You may need to pass in --load.asRobloxScript."));
                    end;
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 143 ]]
                        -- upvalues: v10 (ref), v22 (ref)
                        return v10:GetScriptFilePath(v22);
                    end);
                    if not l_status_0 then
                        if string.find(l_result_0, "lacking permission 5") then
                            error(l_Error_0.new(string.format("Could not get a snapshot path for test file '%s'. You may need to pass in --load.asRobloxScript", v22.Name)));
                        else
                            error(l_Error_0.new(string.format("Could not get a snapshot path for test file '%s' because of the following error: %s", v22.Name, l_result_0)));
                        end;
                    end;
                    return ("%s/__snapshots__/%s"):format(l_getParent_0(l_result_0, 1), v22.Name .. v13 .. ".lua");
                end
            };
        end
    };
end;
return v6;