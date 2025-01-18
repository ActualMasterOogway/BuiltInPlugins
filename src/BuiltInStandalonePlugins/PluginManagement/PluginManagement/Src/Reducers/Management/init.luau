local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Packages.Rodux);
local function v9(v3, v4, v5) --[[ Line: 5 ]] --[[ Name: setPluginValues ]]
    -- upvalues: v1 (copy)
    local v6 = {};
    for v7, v8 in pairs(v3.plugins) do
        if v7 == v4 then
            v6[v7] = v1.Dictionary.join(v8, v5);
        end;
    end;
    return v1.Dictionary.join(v3, {
        plugins = v1.Dictionary.join(v3.plugins, v6)
    });
end;
return v2.createReducer({
    plugins = nil
}, {
    ClearAllPluginData = function(v10, _) --[[ Line: 21 ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v10, {
            plugins = v1.None
        });
    end or nil, 
    RemovePluginData = function(v12, v13) --[[ Line: 28 ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v12, {
            plugins = v1.Dictionary.join(v12.plugins or {}, {
                [v13.pluginId] = v1.None
            })
        });
    end or nil, 
    SetLoadedPluginData = function(v14, v15) --[[ Line: 37 ]] --[[ Name: SetLoadedPluginData ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v14, {
            plugins = v1.Dictionary.join(v14.plugins or {}, v15.pluginData)
        });
    end, 
    SetPluginEnabledState = function(v16, v17) --[[ Line: 44 ]] --[[ Name: SetPluginEnabledState ]]
        -- upvalues: v9 (copy)
        return v9(v16, v17.assetId, {
            enabled = v17.enabled
        });
    end, 
    SetPluginUpdateStatus = function(v18, v19) --[[ Line: 51 ]] --[[ Name: SetPluginUpdateStatus ]]
        -- upvalues: v9 (copy), v1 (copy)
        return v9(v18, v19.assetId, {
            status = v19.status or v1.None
        });
    end
});