local l_script_FirstAncestor_0 = script:FindFirstAncestor("ViewportToolingFramework");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Components.Button);
local _ = require(l_script_FirstAncestor_0.Types);
return function(v4) --[[ Line: 14 ]] --[[ Name: Radio ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_Item_0 = v4.Item;
    local v6 = {};
    for _, v8 in l_Item_0.Items do
        local v9 = v4.NextOrder();
        v6[v8.Id] = v1.createElement(v2, {
            Item = {
                Type = "Button", 
                Tooltip = v8.Tooltip, 
                TooltipDescription = v8.TooltipDescription, 
                Icon = v8.Icon, 
                OnClick = function() --[[ Line: 30 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_Item_0 (copy), v8 (copy)
                    l_Item_0.OnChange(v8.Id);
                end, 
                Selected = l_Item_0.Value == v8.Id, 
                Enabled = v8.Enabled
            }, 
            NextOrder = function() --[[ Line: 37 ]] --[[ Name: NextOrder ]]
                -- upvalues: v9 (copy)
                return v9;
            end
        });
    end;
    return v1.createElement(v1.Fragment, {}, v6);
end;