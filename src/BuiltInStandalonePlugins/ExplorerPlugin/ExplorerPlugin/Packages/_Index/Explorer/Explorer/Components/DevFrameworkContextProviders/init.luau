local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v2 = require(l_script_FirstAncestor_0.Parent.Framework);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Parent.Signal);
local function v12() --[[ Line: 10 ]] --[[ Name: useLocale ]]
    -- upvalues: l_LocalizationService_0 (copy), v3 (copy), v4 (copy)
    local function v7() --[[ Line: 11 ]] --[[ Name: getLocale ]]
        -- upvalues: l_LocalizationService_0 (ref)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 14 ]]
            return game:GetService("StudioService").StudioLocaleId;
        end);
        if l_status_0 then
            return l_result_0;
        else
            return l_LocalizationService_0.SystemLocaleId;
        end;
    end;
    local v8 = v3.useState(v4.new);
    v3.useEffect(function() --[[ Line: 28 ]]
        -- upvalues: l_LocalizationService_0 (ref), v8 (copy)
        local l_game_Service_0 = game:FindService("StudioService");
        if l_game_Service_0 == nil then
            local v10 = l_LocalizationService_0:GetPropertyChangedSignal("StudioLocaleId"):Connect(function() --[[ Line: 33 ]]
                -- upvalues: v8 (ref)
                v8:Fire();
            end);
            return function() --[[ Line: 37 ]]
                -- upvalues: v10 (copy)
                v10:Disconnect();
            end;
        else
            local v11 = l_game_Service_0:GetPropertyChangedSignal("StudioLocaleId"):Connect(function() --[[ Line: 42 ]]
                -- upvalues: v8 (ref)
                v8:Fire();
            end);
            return function() --[[ Line: 46 ]]
                -- upvalues: v11 (copy)
                v11:Disconnect();
            end;
        end;
    end, {});
    return v7, v8;
end;
return function(v13) --[[ Line: 55 ]] --[[ Name: DevFrameworkContextProviders ]]
    -- upvalues: v12 (copy), v3 (copy), v2 (copy), l_script_FirstAncestor_0 (copy)
    local v14, v15 = v12();
    local v16 = v3.useState(function() --[[ Line: 60 ]]
        -- upvalues: v2 (ref), l_script_FirstAncestor_0 (ref), v14 (copy), v15 (copy)
        return v2.ContextServices.Localization.new({
            stringResourceTable = l_script_FirstAncestor_0.Resources.Localization.SourceStrings, 
            translationResourceTable = l_script_FirstAncestor_0.Resources.Localization.LocalizedStrings, 
            pluginName = "ExplorerLibrary", 
            getLocale = v14, 
            overrideLocaleChangedSignal = v15
        });
    end);
    return v2.ContextServices.provide({
        v16
    }, v13.children);
end;