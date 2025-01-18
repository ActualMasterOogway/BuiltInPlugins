local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_ContextServices_0 = v2.ContextServices;
local v5 = require(l_script_FirstAncestor_0.Src.Util.PluginSettingsContext);
return function(v6) --[[ Line: 16 ]] --[[ Name: PluginSettingsProvider ]]
    -- upvalues: l_ContextServices_0 (copy), v3 (copy), v1 (copy), v5 (copy)
    local v7 = l_ContextServices_0.Plugin.use():get();
    local v8, v9 = v3.useState({});
    local function v11(v10) --[[ Line: 20 ]] --[[ Name: getSetting ]]
        -- upvalues: v7 (copy)
        return v7:GetSetting(v10);
    end;
    local function v14(v12, v13) --[[ Line: 24 ]] --[[ Name: setSetting ]]
        -- upvalues: v7 (copy), v9 (copy), v1 (ref), v8 (copy)
        if v13 ~= v7:GetSetting(v12) then
            v7:SetSetting(v12, v13);
            v9(v1.join(v8, {
                [v12] = v13
            }));
        end;
    end;
    local v15 = {
        getSetting = v11, 
        setSetting = v14, 
        pluginSettings = v8
    };
    return v3.createElement(v5.Provider, {
        value = v15
    }, v6.children);
end;