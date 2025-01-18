local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_UI_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v6 = v1.PureComponent:extend("TimelineTick");
v6.render = function(v7) --[[ Line: 22 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy)
    local l_props_0 = v7.props;
    return v1.createElement(l_Pane_0, {
        ZIndex = l_props_0.ZIndex, 
        Size = UDim2.new(0, 1, 1, 0), 
        Position = l_props_0.Position, 
        [v1.Tag] = l_props_0[v1.Tag]
    }, {
        Tick = v1.createElement(l_Pane_0, {
            Position = UDim2.fromScale(0.5, 1), 
            AnchorPoint = Vector2.new(0.5, 1), 
            BorderSizePixel = 0, 
            [v1.Tag] = "Tick"
        }), 
        Label = v1.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Text = tostring(0 - l_props_0.Tick), 
            ZIndex = 2, 
            [v1.Tag] = "Label"
        })
    });
end;
return v6;