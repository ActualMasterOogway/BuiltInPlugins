local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
return function() --[[ Line: 7 ]]
    -- upvalues: l_ContextServices_0 (copy), v1 (copy)
    return l_ContextServices_0.Analytics.new(function(v3) --[[ Line: 8 ]]
        -- upvalues: v1 (ref)
        local function v7(v4, v5) --[[ Line: 11 ]] --[[ Name: sendEvent ]]
            -- upvalues: v1 (ref), v3 (copy)
            local v6 = v5 or {};
            v6 = v1.Dictionary.join({
                studioSid = v3:GetSessionId(), 
                clientId = v3:GetClientId()
            }, v6);
            v3:SendEventDeferred("studio", "PluginManagement", v4, v6);
        end;
        local function _(v8, v9) --[[ Line: 22 ]] --[[ Name: reportCounter ]]
            -- upvalues: v3 (copy)
            v3:ReportCounter(v8, v9 or 1);
        end;
        local function _(v11, v12) --[[ Line: 26 ]] --[[ Name: sendAndCount ]]
            -- upvalues: v7 (copy), v3 (copy)
            v7(v11, v12);
            local v13 = "PluginManagement" .. v11;
            v3:ReportCounter(v13, 1);
        end;
        return {
            TryInstallPluginFromWeb = function(v15, v16) --[[ Line: 32 ]] --[[ Name: TryInstallPluginFromWeb ]]
                -- upvalues: v7 (copy), v3 (copy)
                local v17 = {
                    pluginId = v16
                };
                v7(v15, v17);
                local v18 = "PluginManagement" .. v15;
                v3:ReportCounter(v18, 1);
            end, 
            InstallPluginFromWebSuccess = function(v19, v20) --[[ Line: 37 ]] --[[ Name: InstallPluginFromWebSuccess ]]
                -- upvalues: v7 (copy), v3 (copy)
                local v21 = {
                    pluginId = v20
                };
                v7(v19, v21);
                local v22 = "PluginManagement" .. v19;
                v3:ReportCounter(v22, 1);
            end, 
            InstallPluginFromWebFailure = function(v23, v24, v25) --[[ Line: 42 ]] --[[ Name: InstallPluginFromWebFailure ]]
                -- upvalues: v7 (copy), v3 (copy)
                local v26 = {
                    pluginId = v24, 
                    pluginInstallStatusCode = v25
                };
                v7(v23, v26);
                local v27 = "PluginManagement" .. v23;
                v3:ReportCounter(v27, 1);
            end, 
            TryUpdatePlugin = function(v28, v29) --[[ Line: 48 ]] --[[ Name: TryUpdatePlugin ]]
                -- upvalues: v7 (copy), v3 (copy)
                local v30 = {
                    pluginId = v29
                };
                v7(v28, v30);
                local v31 = "PluginManagement" .. v28;
                v3:ReportCounter(v31, 1);
            end, 
            TryUpdateAllPlugins = function(v32) --[[ Line: 53 ]] --[[ Name: TryUpdateAllPlugins ]]
                -- upvalues: v7 (copy), v3 (copy)
                v7(v32, nil);
                local v33 = "PluginManagement" .. v32;
                v3:ReportCounter(v33, 1);
            end, 
            UpdatePluginSuccess = function(v34, v35) --[[ Line: 56 ]] --[[ Name: UpdatePluginSuccess ]]
                -- upvalues: v7 (copy), v3 (copy)
                local v36 = {
                    pluginId = v35
                };
                v7(v34, v36);
                local v37 = "PluginManagement" .. v34;
                v3:ReportCounter(v37, 1);
            end, 
            UpdatePluginFailure = function(v38, v39) --[[ Line: 61 ]] --[[ Name: UpdatePluginFailure ]]
                -- upvalues: v7 (copy), v3 (copy)
                local v40 = {
                    pluginId = v39
                };
                v7(v38, v40);
                local v41 = "PluginManagement" .. v38;
                v3:ReportCounter(v41, 1);
            end
        };
    end);
end;