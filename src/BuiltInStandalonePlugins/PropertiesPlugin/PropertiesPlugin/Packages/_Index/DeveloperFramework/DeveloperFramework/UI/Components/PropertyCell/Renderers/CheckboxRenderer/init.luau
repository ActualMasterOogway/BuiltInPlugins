local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local l_Components_0 = l_Parent_0.UI.Components;
local v3 = require(l_Components_0.Checkbox);
local _ = require(script.Parent.Parent.Types);
return function(v5) --[[ Line: 10 ]] --[[ Name: CheckboxRenderer ]]
    -- upvalues: v1 (copy), v3 (copy)
    local l_Schema_0 = v5.Schema;
    return v1.createElement(v3, {
        Disabled = v5.Disabled, 
        Checked = v5.Value, 
        OnClick = function() --[[ Line: 15 ]] --[[ Name: OnClick ]]
            -- upvalues: v5 (copy)
            v5.OnChanged(not v5.Value);
        end, 
        Text = l_Schema_0.Label
    });
end;