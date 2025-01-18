local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.React);
local v2 = require(l_Parent_0.UI.Components.Checkbox);
local v3 = require(l_Parent_0.UI.Components.Image);
local v4 = require(l_Parent_0.UI.Components.Pane);
local v5 = require(l_Parent_0.UI.Components.Tooltip);
local v6 = v1.PureComponent:extend("Checkboxes");
v6.init = function(v7) --[[ Line: 11 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v7.state = {
        KEY1 = false, 
        KEY2 = false, 
        KEY3 = v2.Indeterminate, 
        KEY4 = true
    };
    v7.onClick = function(v8) --[[ Line: 19 ]]
        -- upvalues: v7 (copy)
        v7:setState({
            [v8] = not v7.state[v8]
        });
    end;
end;
v6.render = function(v9) --[[ Line: 26 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v4 (copy), v2 (copy), v5 (copy), v3 (copy)
    return v1.createElement(v4, {
        [v1.Tag] = "X-Column X-FitY X-Pad"
    }, {
        Disabled = v1.createElement(v2, {
            Checked = v9.state.KEY1, 
            Disabled = true, 
            Key = "KEY1", 
            LayoutOrder = 1, 
            OnClick = v9.onClick, 
            Text = "Disabled"
        }), 
        Default = v1.createElement(v2, {
            Checked = v9.state.KEY2, 
            Key = "KEY2", 
            LayoutOrder = 2, 
            OnClick = v9.onClick, 
            Text = "Clickable"
        }), 
        Indeterminate = v1.createElement(v2, {
            Checked = v9.state.KEY3, 
            Key = "KEY3", 
            LayoutOrder = 3, 
            OnClick = v9.onClick, 
            Text = "Mixed"
        }), 
        NoLabel = v1.createElement(v2, {
            Checked = v9.state.KEY4, 
            Key = "KEY4", 
            LayoutOrder = 4, 
            OnClick = v9.onClick
        }), 
        WithTooltip = v1.createElement(v2, {
            Checked = v9.state.KEY5, 
            Key = "KEY5", 
            LayoutOrder = 5, 
            OnClick = v9.onClick, 
            Text = "Tooltip"
        }, {
            Tooltip = v1.createElement(v5, {
                Text = "This checkbox has a tooltip"
            })
        }), 
        WithHelpIcon = v1.createElement(v2, {
            Checked = v9.state.KEY6, 
            Key = "KEY6", 
            LayoutOrder = 6, 
            OnClick = v9.onClick, 
            Text = "Help Icon"
        }, {
            Image = v1.createElement(v3, {
                AnchorPoint = Vector2.new(0, 0.5), 
                ImageColor3 = Color3.new(1, 1, 1), 
                Image = "rbxasset://textures/AlignTool/Help.png", 
                Position = UDim2.new(1, 4, 0.5, 0), 
                Size = UDim2.fromOffset(14, 14)
            })
        }), 
        Wrapped = v1.createElement(v2, {
            Checked = v9.state.KEY7, 
            Key = "KEY7", 
            LayoutOrder = 7, 
            OnClick = v9.onClick, 
            Text = "Call me Ishmael. Some years ago\226\128\148never mind how long precisely\226\128\148having little or no money in my purse, and nothing particular to interest me on shore, I thought I would sail about a little and see the watery part of the world. It is a way I have of driving off the spleen and regulating the circulation.", 
            TextWrapped = true
        })
    });
end;
return v6;