local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.DraggerFramework.Utility.Colors);
local v3 = v1.Component:extend("PivotRing");
v3.HitTestRadius = 15;
v3.render = function(v4) --[[ Line: 15 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v1 (copy)
    local l_props_0 = v4.props;
    local l_DraggerContext_0 = l_props_0.DraggerContext;
    local v7 = nil;
    local v8 = nil;
    if l_props_0.Hovered then
        v7 = "rbxasset://Textures/PivotEditor/HoveredPivot.png";
        v8 = l_DraggerContext_0:getSelectionBoxColor(l_props_0.IsActive);
    else
        v7 = "rbxasset://Textures/PivotEditor/SelectedPivot.png";
        v8 = v2.WHITE;
    end;
    local v9, v10 = l_DraggerContext_0:worldToViewportPoint(l_props_0.Pivot.Position);
    if v10 then
        return v1.createElement(v1.Portal, {
            target = l_DraggerContext_0:getGuiParent()
        }, {
            PivotHoverHighlight = v1.createElement("ScreenGui", {}, {
                PivotHoverImage = v1.createElement("ImageLabel", {
                    Image = v7, 
                    ImageColor3 = v8, 
                    Size = UDim2.new(0, 32, 0, 32), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0, v9.X + 0.5, 0, v9.Y + 0.5), 
                    BackgroundTransparency = 1
                })
            })
        });
    else
        return nil;
    end;
end;
return v3;