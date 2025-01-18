local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Style.Colors);
local v3 = require(l_Parent_0.UI.Components.DragSource);
local v4 = require(l_Parent_0.UI.Components.Pane);
local v5 = require(l_Parent_0.UI.Components.TextLabel);
local v6 = v1.PureComponent:extend("DragSourceStory");
v6.init = function(v7) --[[ Line: 12 ]] --[[ Name: init ]]
    v7:setState({
        dragging = false
    });
    v7.onClick = function() --[[ Line: 17 ]]
        print("DragSource clicked");
    end;
    v7.onDragBegan = function() --[[ Line: 20 ]]
        -- upvalues: v7 (copy)
        v7:setState({
            dragging = true
        });
    end;
    v7.onDragEnded = function() --[[ Line: 25 ]]
        -- upvalues: v7 (copy)
        v7:setState({
            dragging = false
        });
    end;
end;
v6.render = function(v8) --[[ Line: 32 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy), v4 (copy), v5 (copy)
    local v9 = nil;
    local v10 = nil;
    if v8.state.dragging then
        v9 = v2.Blue;
        v10 = "Dragging";
    else
        v9 = v2.Gray_Mid;
        v10 = "Drag Me";
    end;
    return v1.createElement(v3, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        OnDragBegan = v8.onDragBegan, 
        OnDragEnded = v8.onDragEnded
    }, {
        Pane = v1.createElement(v4, {
            BackgroundColor = v9, 
            Size = UDim2.fromOffset(100, 60), 
            Style = "Box"
        }, {
            Label = v1.createElement(v5, {
                Size = UDim2.new(1, 0, 1, 0), 
                Text = v10, 
                TextColor = v2.Black
            })
        })
    });
end;
return {
    stories = {
        {
            name = "Example", 
            summary = "Wrap a TextLabel and update color and text on drag", 
            story = v6
        }
    }
};