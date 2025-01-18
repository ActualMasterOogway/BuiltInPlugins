local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_joinTags_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.joinTags;
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v4) --[[ Line: 21 ]] --[[ Name: Toggle ]]
    -- upvalues: v1 (copy), l_joinTags_0 (copy)
    return v1.createElement("Frame", {
        Position = v4.Position, 
        AnchorPoint = v4.AnchorPoint, 
        LayoutOrder = v4.LayoutOrder, 
        [v1.Event.InputBegan] = function(_, v6) --[[ Line: 26 ]]
            -- upvalues: v4 (copy)
            if v4.Enabled and v6.UserInputType == Enum.UserInputType.MouseButton1 then
                v4.OnClick(not v4.Selected, v4.Uri);
            end;
        end, 
        [v1.Tag] = l_joinTags_0("Component-Toggle", v4.Selected and "State-Selected" or nil, not v4.Enabled and "State-Disabled" or nil)
    }, {
        Knob = v1.createElement("Frame")
    });
end;