local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_0.UI.ContextServices);
local l_Analytics_0 = v3.Analytics;
local l_Design_0 = v3.Design;
local l_Localization_0 = v3.Localization;
local l_Focus_0 = v3.Focus;
local l_Mouse_0 = v3.Mouse;
local l_Plugin_0 = v3.Plugin;
local v10 = require(l_Parent_0.Style.ThemeSwitcher);
local v11 = require(l_Parent_0.Resources);
return function(v12) --[[ Line: 22 ]] --[[ Name: StoryMiddleware ]]
    -- upvalues: l_Localization_0 (copy), v11 (copy), v10 (copy), l_Focus_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), l_Analytics_0 (copy), l_Design_0 (copy), v3 (copy), v2 (copy)
    local v13 = l_Localization_0.new({
        stringResourceTable = v11.SourceStrings, 
        translationResourceTable = v11.LocalizedStrings, 
        pluginName = "Storybook", 
        libraries = {
            [v11.LOCALIZATION_PROJECT_NAME] = {
                stringResourceTable = v11.SourceStrings, 
                translationResourceTable = v11.LocalizedStrings
            }
        }
    });
    local v14 = v10.new();
    return function(v15) --[[ Line: 38 ]]
        -- upvalues: v10 (ref), v14 (copy), v13 (copy), l_Focus_0 (ref), l_Plugin_0 (ref), l_Mouse_0 (ref), l_Analytics_0 (ref), l_Design_0 (ref), v3 (ref), v2 (ref), v12 (copy)
        v10.setTheme(v15.theme);
        local v16 = {
            v14, 
            v13, 
            l_Focus_0.new(v15.focus), 
            l_Plugin_0.new(v15.plugin), 
            l_Mouse_0.new(v15.plugin:GetMouse()), 
            l_Analytics_0.mock(), 
            l_Design_0.new(v15.design)
        };
        return v3.provide(v16, {
            Child = v2.createElement(v12, v15)
        });
    end;
end;