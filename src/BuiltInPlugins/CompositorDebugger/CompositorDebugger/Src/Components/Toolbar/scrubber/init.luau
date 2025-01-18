local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_Pane_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI.Pane;
local v3 = require(script.Parent.styles);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = v1.PureComponent:extend("Scrubber");
v5.init = function(_) --[[ Line: 26 ]] --[[ Name: init ]]

end;
v5.render = function(v7) --[[ Line: 28 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v1 (copy), l_Pane_0 (copy)
    local l_props_0 = v7.props;
    local l_v3_Attribute_0 = v3:GetAttribute("ScrubberLineSize");
    local l_v3_Attribute_1 = v3:GetAttribute("ScrubberHeadSize");
    return v1.createElement(l_Pane_0, {
        Size = UDim2.new(0, 1, 1, 0), 
        AnchorPoint = Vector2.new(0.5, 0), 
        Position = l_props_0.Position, 
        ZIndex = l_props_0.ZIndex
    }, {
        Line = v1.createElement(l_Pane_0, {
            Size = l_v3_Attribute_0, 
            Position = UDim2.fromScale(0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            [v1.Tag] = "Scrubber"
        }), 
        Head = v1.createElement(l_Pane_0, {
            Size = l_v3_Attribute_1, 
            Position = UDim2.fromScale(0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            [v1.Tag] = "Scrubber"
        })
    });
end;
return v5;