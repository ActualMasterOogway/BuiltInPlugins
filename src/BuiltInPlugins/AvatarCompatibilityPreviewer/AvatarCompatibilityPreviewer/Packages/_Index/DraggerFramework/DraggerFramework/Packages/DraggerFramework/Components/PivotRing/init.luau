local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local v3 = require(l_Parent_0.Utility.Colors);
local v4 = v2.Component:extend("PivotRing");
v4.HitTestRadius = 15;
v4.render = function(v5) --[[ Line: 26 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v2 (copy)
    local l_props_0 = v5.props;
    local l_DraggerContext_0 = l_props_0.DraggerContext;
    local v8 = nil;
    local v9 = nil;
    if l_props_0.Hovered then
        v8 = "rbxasset://Textures/PivotEditor/HoveredPivot.png";
        v9 = l_DraggerContext_0:getSelectionBoxColor(l_props_0.IsActive);
    else
        v8 = "rbxasset://Textures/PivotEditor/SelectedPivot.png";
        v9 = v3.WHITE;
    end;
    local v10, v11 = l_DraggerContext_0:worldToViewportPoint(l_props_0.Position);
    if v11 then
        return v2.createElement(v2.Portal, {
            target = l_DraggerContext_0:getGuiParent()
        }, {
            PivotHoverHighlight = v2.createElement("ScreenGui", {}, {
                PivotHoverImage = v2.createElement("ImageLabel", {
                    Image = v8, 
                    ImageColor3 = v9, 
                    Size = UDim2.new(0, 32, 0, 32), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0, v10.X + 0.5, 0, v10.Y + 0.5), 
                    BackgroundTransparency = 1
                })
            })
        });
    else
        return nil;
    end;
end;
return v4;