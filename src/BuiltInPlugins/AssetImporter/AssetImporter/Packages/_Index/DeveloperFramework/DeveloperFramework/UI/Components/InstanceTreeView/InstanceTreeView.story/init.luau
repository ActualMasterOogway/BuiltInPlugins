local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local l_Workspace_0 = game:GetService("Workspace");
local l_StarterPlayer_0 = game:GetService("StarterPlayer");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v5 = require(l_Parent_0.UI.Components.InstanceTreeView);
local v6 = require(l_Parent_0.Parent.Cryo);
local v7 = v1.PureComponent:extend(script.Parent.Name .. "Example");
v7.init = function(v8) --[[ Line: 13 ]] --[[ Name: init ]]
    -- upvalues: l_Workspace_0 (copy), l_ReplicatedStorage_0 (copy), l_StarterPlayer_0 (copy)
    v8.state = {
        Expansion = {}, 
        Selection = {}, 
        Instances = {
            l_Workspace_0, 
            l_ReplicatedStorage_0, 
            l_StarterPlayer_0
        }, 
        OnExpansionChange = function() --[[ Line: 18 ]] --[[ Name: OnExpansionChange ]]

        end
    };
end;
v7.render = function(v9) --[[ Line: 22 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v5 (copy), v6 (copy)
    return v1.createElement(v5, {
        Size = UDim2.new(0, 240, 0, 240), 
        Instances = v9.state.Instances, 
        Selection = v9.state.Selection, 
        Expansion = v9.state.Expansion, 
        OnSelectionChange = function(v10) --[[ Line: 28 ]] --[[ Name: OnSelectionChange ]]
            -- upvalues: v9 (copy)
            v9:setState({
                Selection = v10
            });
        end, 
        OnExpansionChange = function(v11) --[[ Line: 33 ]] --[[ Name: OnExpansionChange ]]
            -- upvalues: v9 (copy), v6 (ref)
            v9:setState({
                Expansion = v6.Dictionary.join(v9.state.Expansion, v11)
            });
        end, 
        Style = "Compact"
    });
end;
return v7;