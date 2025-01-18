local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_Pane_0 = require(l_Parent_0.Packages.Framework).UI.Pane;
local v3 = require(script.Parent.TagSettingsListView);
local v4 = require(script.Parent.TagSettingsToggleButton);
local v5 = v1.PureComponent:extend("TagSettingsPane");
v5.render = function(_) --[[ Line: 17 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), v4 (copy), v3 (copy)
    return v1.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        TagSettingsToggleButton = v1.createElement(v4, {
            LayoutOrder = 1
        }), 
        TagSettingsList = v1.createElement(v3, {
            LayoutOrder = 2
        })
    });
end;
return v5;