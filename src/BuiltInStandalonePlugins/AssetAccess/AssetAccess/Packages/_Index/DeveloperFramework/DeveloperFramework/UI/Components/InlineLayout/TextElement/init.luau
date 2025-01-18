local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.UI.Components.InlineLayout.BaseTextElement);
local v2 = require(l_Parent_0.UI.Components.TextLabel);
return {
    new = function(v3) --[[ Line: 10 ]] --[[ Name: new ]]
        -- upvalues: v1 (copy), v2 (copy)
        return v1.new(v2, v3);
    end
};