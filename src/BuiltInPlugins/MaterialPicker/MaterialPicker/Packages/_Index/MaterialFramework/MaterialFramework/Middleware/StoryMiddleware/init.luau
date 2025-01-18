local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Framework);
local v3 = require(l_Parent_1.React);
local l_ContextServices_0 = v2.ContextServices;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Focus_0 = l_ContextServices_0.Focus;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local v10 = require(l_Parent_0.Resources);
local l_LOCALIZATION_PROJECT_NAME_0 = v10.LOCALIZATION_PROJECT_NAME;
local l_Theme_0 = v10.Theme;
local v13 = require(l_Parent_0.Context.StudioServices);
return function(v14) --[[ Line: 24 ]] --[[ Name: StoryMiddleware ]]
    -- upvalues: l_Localization_0 (copy), v10 (copy), l_LOCALIZATION_PROJECT_NAME_0 (copy), l_Analytics_0 (copy), l_Focus_0 (copy), l_Mouse_0 (copy), l_Plugin_0 (copy), v13 (copy), l_Theme_0 (copy), l_ContextServices_0 (copy), v3 (copy)
    local v15 = l_Localization_0.new({
        stringResourceTable = v10.SourceStrings, 
        translationResourceTable = v10.LocalizedStrings, 
        pluginName = "Storybook", 
        libraries = {
            [l_LOCALIZATION_PROJECT_NAME_0] = {
                stringResourceTable = v10.SourceStrings, 
                translationResourceTable = v10.LocalizedStrings
            }
        }
    });
    return function(v16) --[[ Line: 40 ]]
        -- upvalues: l_Analytics_0 (ref), v15 (copy), l_Focus_0 (ref), l_Mouse_0 (ref), l_Plugin_0 (ref), v13 (ref), l_Theme_0 (ref), l_ContextServices_0 (ref), v3 (ref), v14 (copy)
        local v17 = {
            l_Analytics_0.mock(), 
            v15, 
            l_Focus_0.new(v16.focus), 
            l_Mouse_0.new(v16.plugin:GetMouse()), 
            l_Plugin_0.new(v16.plugin), 
            v13.new(), 
            l_Theme_0.new()
        };
        return l_ContextServices_0.provide(v17, {
            Child = v3.createElement(v14, v16)
        });
    end;
end;