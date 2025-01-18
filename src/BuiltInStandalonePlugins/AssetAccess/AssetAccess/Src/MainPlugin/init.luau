local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetAccess");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Design_0 = l_ContextServices_0.Design;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_StudioTheme_0 = v2.Style.Themes.StudioTheme;
local l_registerPluginStyles_0 = v2.Styling.registerPluginStyles;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local v13 = require(l_script_FirstAncestor_0.Src.Components.ShareDialogView);
local function _(v14) --[[ Line: 25 ]] --[[ Name: useDesign ]]
    -- upvalues: v1 (copy), l_registerPluginStyles_0 (copy)
    return v1.useMemo(function() --[[ Line: 26 ]]
        -- upvalues: l_registerPluginStyles_0 (ref), v14 (copy)
        return l_registerPluginStyles_0(v14);
    end, {
        v14
    });
end;
local function v25(v16, v17) --[[ Line: 31 ]] --[[ Name: useContexts ]]
    -- upvalues: v1 (copy), l_Analytics_0 (copy), l_Design_0 (copy), l_Localization_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), l_Mouse_0 (copy), l_Plugin_0 (copy), l_StudioTheme_0 (copy)
    local v18 = v1.useMemo(function() --[[ Line: 36 ]]
        -- upvalues: l_Analytics_0 (ref)
        return l_Analytics_0.new(function() --[[ Line: 37 ]]
            return {};
        end, {});
    end, {});
    local v19 = v1.useMemo(function() --[[ Line: 42 ]]
        -- upvalues: l_Design_0 (ref), v17 (copy)
        return l_Design_0.new(v17);
    end, {
        v17
    });
    local v20 = v1.useMemo(function() --[[ Line: 46 ]]
        -- upvalues: l_Localization_0 (ref), l_SourceStrings_0 (ref), l_LocalizedStrings_0 (ref)
        return l_Localization_0.new({
            stringResourceTable = l_SourceStrings_0, 
            translationResourceTable = l_LocalizedStrings_0, 
            pluginName = "AssetAccess"
        });
    end, {});
    local v22 = v1.useMemo(function() --[[ Line: 54 ]]
        -- upvalues: l_Mouse_0 (ref), v16 (copy)
        local v21 = l_Mouse_0.new(v16:GetMouse());
        v21:__pushCursor("Arrow", 0);
        return v21;
    end, {
        v16:GetMouse()
    });
    local v23 = v1.useMemo(function() --[[ Line: 60 ]]
        -- upvalues: l_Plugin_0 (ref), v16 (copy)
        return l_Plugin_0.new(v16);
    end, {
        v16
    });
    local v24 = v1.useMemo(function() --[[ Line: 64 ]]
        -- upvalues: l_StudioTheme_0 (ref)
        return l_StudioTheme_0.new();
    end, {});
    return {
        Analytics = v18, 
        Design = v19, 
        Localization = v20, 
        Mouse = v22, 
        Plugin = v23, 
        Stylizer = v24
    };
end;
return function(v26) --[[ Line: 78 ]] --[[ Name: MainPlugin ]]
    -- upvalues: v1 (copy), l_registerPluginStyles_0 (copy), v25 (copy), l_ContextServices_0 (copy), v13 (copy)
    local l_Plugin_1 = v26.Plugin;
    local v28 = v1.useMemo(function() --[[ Line: 26 ]]
        -- upvalues: l_registerPluginStyles_0 (ref), l_Plugin_1 (copy)
        return l_registerPluginStyles_0(l_Plugin_1);
    end, {
        l_Plugin_1
    });
    local v29 = v25(l_Plugin_1, v28);
    return l_ContextServices_0.provide(v29, {
        v1.createElement(v13)
    });
end;