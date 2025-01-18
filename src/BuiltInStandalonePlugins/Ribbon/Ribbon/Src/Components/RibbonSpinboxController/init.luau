local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_joinTags_0 = v2.Styling.joinTags;
local l_UI_0 = v2.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
return function(v7) --[[ Line: 23 ]] --[[ Name: RibbonSpinboxController ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_joinTags_0 (copy), l_IconButton_0 (copy)
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v7.LayoutOrder, 
        [v1.Tag] = l_joinTags_0("Component-RibbonSpinboxController X-Fit X-Column", v7.Disabled and "State-Disabled" or "State-Default")
    }, {
        ControlUp = v1.createElement(l_IconButton_0, {
            LeftIcon = {}, 
            OnClick = v7.OnClickUp, 
            PaneTags = "X-Fit", 
            [v1.Tag] = l_joinTags_0("Component-IconButton ControlUp", v7.DisabledUp and "State-Disabled" or "State-Default")
        }), 
        ControlDown = v1.createElement(l_IconButton_0, {
            LeftIcon = {}, 
            OnClick = v7.OnClickDown, 
            PaneTags = "X-Fit", 
            [v1.Tag] = l_joinTags_0("Component-IconButton ControlDown", v7.DisabledDown and "State-Disabled" or "State-Default")
        })
    });
end;