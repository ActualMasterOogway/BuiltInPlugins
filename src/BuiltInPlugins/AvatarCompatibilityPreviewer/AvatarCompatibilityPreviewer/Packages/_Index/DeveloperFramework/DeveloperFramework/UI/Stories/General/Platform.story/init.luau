local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.TextLabel);
return {
    story = function(v3) --[[ Line: 7 ]] --[[ Name: story ]]
        -- upvalues: v1 (copy), v2 (copy)
        return v1.createElement(v2, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Text = "Current platform: " .. v3.platform
        });
    end
};