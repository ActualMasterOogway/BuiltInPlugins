local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.Pane);
local v3 = require(l_Parent_0.UI.Components.DropdownMenu);
local v4 = v1.PureComponent:extend(script.Parent.Name .. "Example");
v4.init = function(v5) --[[ Line: 8 ]] --[[ Name: init ]]
    v5.state = {
        Default = false, 
        DropFromSide = false
    };
    v5.selectItem = function(v6) --[[ Line: 13 ]]
        -- upvalues: v5 (copy)
        v5:setState({
            [v6] = false
        });
    end;
    v5.openMenu = function(v7) --[[ Line: 18 ]]
        -- upvalues: v5 (copy)
        v5:setState({
            [v7] = true
        });
    end;
    v5.closeMenu = function(v8) --[[ Line: 23 ]]
        -- upvalues: v5 (copy)
        v5:setState({
            [v8] = false
        });
    end;
end;
v4.render = function(v9) --[[ Line: 30 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    return v1.createElement(v2, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.fromScale(0, 0)
    }, {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 16)
        }), 
        Default = v1.createElement("Frame", {
            Size = UDim2.new(0, 240, 0, 32)
        }, {
            Menu = v1.createElement(v3, {
                Hide = not v9.state.Default, 
                Items = {
                    "The first element", 
                    "The second", 
                    "A really long element", 
                    "A tiny one", 
                    "The fifth one", 
                    "The last one"
                }, 
                OnItemActivated = function() --[[ Line: 53 ]] --[[ Name: OnItemActivated ]]
                    -- upvalues: v9 (copy)
                    v9.selectItem("Default");
                end, 
                OnFocusLost = function() --[[ Line: 56 ]] --[[ Name: OnFocusLost ]]
                    -- upvalues: v9 (copy)
                    v9.closeMenu("Default");
                end
            }), 
            Button = v1.createElement("TextButton", {
                Text = "Open", 
                Position = UDim2.new(0, 250, 0, 0), 
                Size = UDim2.new(0, 40, 1, 0), 
                [v1.Event.Activated] = function() --[[ Line: 64 ]]
                    -- upvalues: v9 (copy)
                    v9.openMenu("Default");
                end
            })
        }), 
        DropFromSide = v1.createElement("Frame", {
            Size = UDim2.new(0, 240, 0, 32)
        }, {
            Menu = v1.createElement(v3, {
                Hide = not v9.state.DropFromSide, 
                Items = {
                    "The first element", 
                    "The second", 
                    "A really long element", 
                    "A tiny one", 
                    "The fifth one", 
                    "The last one"
                }, 
                OnItemActivated = function() --[[ Line: 82 ]] --[[ Name: OnItemActivated ]]
                    -- upvalues: v9 (copy)
                    v9.selectItem("DropFromSide");
                end, 
                OnFocusLost = function() --[[ Line: 85 ]] --[[ Name: OnFocusLost ]]
                    -- upvalues: v9 (copy)
                    v9.closeMenu("DropFromSide");
                end, 
                DropFromSide = true
            }), 
            Button = v1.createElement("TextButton", {
                Text = "Open to the side", 
                Position = UDim2.new(0, 250, 0, 0), 
                Size = UDim2.new(0, 90, 1, 0), 
                [v1.Event.Activated] = function() --[[ Line: 94 ]]
                    -- upvalues: v9 (copy)
                    v9.openMenu("DropFromSide");
                end
            })
        })
    });
end;
return v4;