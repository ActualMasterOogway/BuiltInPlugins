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
local v10 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkStorybookEmbedStyles);
local v11 = require(l_Parent_0.Style.ThemeSwitcher);
local v12 = require(l_Parent_0.Resources);
return function(v13) --[[ Line: 24 ]] --[[ Name: StoryMiddleware ]]
    -- upvalues: l_Localization_0 (copy), v12 (copy), v11 (copy), v10 (copy), l_Focus_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), l_Analytics_0 (copy), l_Design_0 (copy), v3 (copy), v2 (copy)
    local v14 = l_Localization_0.new({
        stringResourceTable = v12.SourceStrings, 
        translationResourceTable = v12.LocalizedStrings, 
        pluginName = "Storybook", 
        libraries = {
            [v12.LOCALIZATION_PROJECT_NAME] = {
                stringResourceTable = v12.SourceStrings, 
                translationResourceTable = v12.LocalizedStrings
            }
        }
    });
    local v15 = v11.new();
    return function(v16) --[[ Line: 39 ]]
        -- upvalues: v10 (ref), v11 (ref), v15 (copy), v14 (copy), l_Focus_0 (ref), l_Plugin_0 (ref), l_Mouse_0 (ref), l_Analytics_0 (ref), l_Design_0 (ref), v3 (ref), v2 (ref), v13 (copy)
        if not v10 then
            v11.setTheme(v16.theme);
        end;
        local v17 = {
            v15, 
            v14, 
            l_Focus_0.new(v16.focus), 
            l_Plugin_0.new(v16.plugin), 
            l_Mouse_0.new(v16.plugin:GetMouse()), 
            l_Analytics_0.mock(), 
            l_Design_0.new(v16.design)
        };
        return v3.provide(v17, {
            Child = v2.createElement(v13, v16)
        });
    end;
end;