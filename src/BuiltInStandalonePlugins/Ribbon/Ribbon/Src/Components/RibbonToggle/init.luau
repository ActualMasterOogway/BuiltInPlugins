local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_joinTags_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.joinTags;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Components.Toggle);
return function(v5) --[[ Line: 23 ]] --[[ Name: RibbonToggle ]]
    -- upvalues: v1 (copy), l_joinTags_0 (copy), v4 (copy)
    return v1.createElement("Frame", {
        [v1.Tag] = l_joinTags_0("Component-RibbonToggle Role-Surface X-Fit", not v5.Enabled and "State-Disabled" or nil)
    }, {
        Label = v1.createElement("TextLabel", {
            Text = v5.Text, 
            [v1.Tag] = "X-Fit"
        }), 
        Toggle = v1.createElement(v4, {
            Uri = v5.Uri, 
            AnchorPoint = v5.AnchorPoint, 
            Enabled = v5.Enabled, 
            OnClick = v5.OnClick, 
            LayoutOrder = 1, 
            Position = v5.Position, 
            Selected = v5.Selected
        })
    });
end;