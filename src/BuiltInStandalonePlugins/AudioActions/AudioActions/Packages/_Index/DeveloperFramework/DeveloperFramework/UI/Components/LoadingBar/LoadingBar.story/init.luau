local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.Pane);
local v3 = require(l_Parent_0.UI.Components.FakeLoadingBar);
local v4 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v5 = v1.PureComponent:extend("ExampleLoadingBar");
v5.init = function(v6) --[[ Line: 11 ]] --[[ Name: init ]]
    v6.state = {
        completed = false, 
        progress = 0
    };
    v6.finishLoading = function() --[[ Line: 16 ]]
        -- upvalues: v6 (copy)
        v6:setState({
            completed = true
        });
    end;
    v6.setProgress = function(v7) --[[ Line: 21 ]]
        -- upvalues: v6 (copy)
        v6:setState({
            progress = v7
        });
    end;
end;
v5.render = function(v8) --[[ Line: 28 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy), v4 (copy)
    local l_completed_0 = v8.state.completed;
    local v10 = ("%i%%"):format(v8.state.progress * 100);
    return v1.createElement(v2, {
        Layout = Enum.FillDirection.Vertical, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Padding = 10, 
        Spacing = 15
    }, {
        FakeLoadingBar = v1.createElement(v3, {
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(125, 8), 
            LoadingTime = 5, 
            OnProgressChanged = v8.setProgress
        }), 
        LoadingText = v1.createElement("TextLabel", {
            LayoutOrder = 2, 
            Size = UDim2.fromOffset(120, 16), 
            BackgroundTransparency = 1, 
            Text = v10, 
            Font = Enum.Font.SourceSans, 
            TextSize = 16
        }), 
        FakeLoadingBar2 = v1.createElement(v3, {
            LayoutOrder = 3, 
            Size = UDim2.fromOffset(125, 8), 
            LoadingTime = 2, 
            HoldValue = 0.75, 
            Completed = l_completed_0
        }), 
        Button = v1.createElement(v4, {
            LayoutOrder = 4, 
            Style = "Round", 
            Text = "Complete", 
            Size = UDim2.fromOffset(120, 32), 
            OnClick = v8.finishLoading
        })
    });
end;
return v5;