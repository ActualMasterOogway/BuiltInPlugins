local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Constants.PluginInstalledStatus);
return v1.createReducer({
    plugins = {}
}, {
    SetPluginId = function(v4, v5) --[[ Line: 22 ]] --[[ Name: SetPluginId ]]
        -- upvalues: v2 (copy), v3 (copy)
        return v2.Dictionary.join(v4, {
            plugins = v2.Dictionary.join(v4.plugins, {
                [v5.pluginId] = {
                    installStatus = v3.UNKNOWN, 
                    installationMsg = "", 
                    installProgress = 0, 
                    name = "", 
                    description = "", 
                    versionId = "", 
                    created = "", 
                    updated = ""
                }
            })
        });
    end, 
    ClearPluginData = function(v6, v7) --[[ Line: 40 ]] --[[ Name: ClearPluginData ]]
        -- upvalues: v2 (copy)
        if not v6.plugins[v7.pluginId] then
            return v6;
        else
            return v2.Dictionary.join(v6, {
                plugins = v2.Dictionary.join(v6.plugins, {
                    [v7.pluginId] = v2.None
                })
            });
        end;
    end, 
    SetPluginMetadata = function(v8, v9) --[[ Line: 54 ]] --[[ Name: SetPluginMetadata ]]
        -- upvalues: v2 (copy)
        assert(v8.plugins[v9.pluginId], string.format("No plugin entry found for %s", v9.pluginId));
        return v2.Dictionary.join(v8, {
            plugins = v2.Dictionary.join(v8.plugins, {
                [v9.pluginId] = v2.Dictionary.join(v8.plugins[v9.pluginId], {
                    name = v9.name, 
                    description = v9.description, 
                    versionId = v9.versionId, 
                    created = v9.created, 
                    updated = v9.updated
                })
            })
        });
    end, 
    SetPluginInstallStatus = function(v10, v11) --[[ Line: 71 ]] --[[ Name: SetPluginInstallStatus ]]
        -- upvalues: v2 (copy)
        assert(v10.plugins[v11.pluginId], string.format("No plugin entry found for %s", v11.pluginId));
        return v2.Dictionary.join(v10, {
            plugins = v2.Dictionary.join(v10.plugins, {
                [v11.pluginId] = v2.Dictionary.join(v10.plugins[v11.pluginId], {
                    installStatus = v11.statusCode, 
                    installationMsg = v11.message
                })
            })
        });
    end
});