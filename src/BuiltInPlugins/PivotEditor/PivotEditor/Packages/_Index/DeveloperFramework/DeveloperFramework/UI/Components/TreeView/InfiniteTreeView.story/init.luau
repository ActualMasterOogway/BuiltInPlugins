local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v3 = require(l_Parent_0.UI.Components.TreeView);
local v4 = v1.PureComponent:extend(script.Parent.Name .. "ExampleTreeView");
local function v8(v5) --[[ Line: 11 ]] --[[ Name: generateItems ]]
    local v6 = {};
    for v7 = 1, 100 do
        table.insert(v6, {
            text = ("%s.%d"):format(v5, v7), 
            icon = {
                Image = "rbxasset://textures/DeveloperFramework/Favorites/star_filled.png", 
                Size = UDim2.new(0, 14, 0, 14)
            }
        });
    end;
    return v6;
end;
v4.init = function(v9) --[[ Line: 25 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy)
    v9.cachedItems = {};
    v9.state = {
        Selection = {}, 
        Expansion = {}, 
        Items = v8("Root")
    };
end;
v4.render = function(v10) --[[ Line: 34 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy), v8 (copy), l_join_0 (copy)
    return v1.createElement(v3, {
        Size = UDim2.new(0, 300, 0, 600), 
        Expansion = v10.state.Expansion, 
        Selection = v10.state.Selection, 
        RootItems = v10.state.Items, 
        Style = "BorderBox", 
        GetChildren = function(v11) --[[ Line: 41 ]] --[[ Name: GetChildren ]]
            -- upvalues: v10 (copy), v8 (ref)
            v10.cachedItems[v11.text] = v10.cachedItems[v11.text] or v8(v11.text);
            return v10.cachedItems[v11.text];
        end, 
        OnExpansionChange = function(v12) --[[ Line: 45 ]] --[[ Name: OnExpansionChange ]]
            -- upvalues: v10 (copy), l_join_0 (ref)
            v10:setState({
                Expansion = l_join_0(v10.state.Expansion, v12)
            });
        end, 
        OnSelectionChange = function(v13) --[[ Line: 50 ]] --[[ Name: OnSelectionChange ]]
            -- upvalues: v10 (copy)
            v10:setState({
                Selection = v13
            });
        end
    });
end;
return {
    stories = {
        {
            name = "Standard", 
            story = v4
        }
    }
};