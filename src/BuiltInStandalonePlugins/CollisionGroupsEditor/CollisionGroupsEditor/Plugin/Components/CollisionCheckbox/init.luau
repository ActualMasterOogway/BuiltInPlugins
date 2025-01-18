local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(script.Parent.Parent.Constants);
CollisonCheckbox = function(v3) --[[ Line: 6 ]] --[[ Name: CollisonCheckbox ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_Style_0 = v3.Style;
    local l_CollisionCheckbox_0 = v3.Style.CollisionCheckbox;
    local l_Group_0 = v3.Group;
    local l_OtherGroup_0 = v3.OtherGroup;
    local v8 = l_Group_0.GetCollidesWith(l_OtherGroup_0);
    local v9 = if v3.RowIndex % 2 == 1 then l_CollisionCheckbox_0.BackgroundOdd else l_CollisionCheckbox_0.BackgroundEven;
    if l_Group_0.Selected then
        v9 = l_Style_0.TableEntrySelected;
    elseif v3.RowHovered == l_Group_0.Name then
        v9 = l_Style_0.TableEntryHover;
    end;
    local v10 = nil;
    v10 = if v3.ShouldShowCheckbox then {
        Padding = v1.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 8), 
            PaddingTop = UDim.new(0, 8), 
            PaddingLeft = UDim.new(0, 8), 
            PaddingRight = UDim.new(0, 8)
        }), 
        Button = v1.createElement("ImageButton", {
            Image = if v8 then l_CollisionCheckbox_0.CheckboxCheckedImage else l_CollisionCheckbox_0.CheckboxUncheckedImage, 
            Size = UDim2.new(1, 0, 1, 0), 
            SizeConstraint = Enum.SizeConstraint.RelativeYY, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BackgroundTransparency = 1, 
            [v1.Event.Activated] = function(_) --[[ Line: 40 ]]
                -- upvalues: l_Group_0 (copy), l_OtherGroup_0 (copy)
                l_Group_0.ToggleCollidesWith(l_OtherGroup_0);
            end
        })
    } else {
        Dash = v1.createElement("Frame", {
            Size = UDim2.new(0.25, 0, 0, 2), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_CollisionCheckbox_0.NoCheckboxPanelColor, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0)
        })
    };
    return v1.createElement("Frame", {
        LayoutOrder = v3.LayoutOrder, 
        Size = v2.GridCellSize, 
        BorderSizePixel = 1, 
        BorderColor3 = l_CollisionCheckbox_0.Border, 
        BackgroundColor3 = v9, 
        [v1.Event.MouseEnter] = function(v12, _) --[[ Line: 66 ]]
            -- upvalues: v3 (copy), l_OtherGroup_0 (copy), l_Group_0 (copy)
            v3.OnColHovered(v12, l_OtherGroup_0.Name, true);
            v3.OnRowHovered(v12, l_Group_0.Name, true);
        end, 
        [v1.Event.MouseLeave] = function(v14, _) --[[ Line: 71 ]]
            -- upvalues: v3 (copy), l_OtherGroup_0 (copy), l_Group_0 (copy)
            v3.OnColHovered(v14, l_OtherGroup_0.Name, false);
            v3.OnRowHovered(v14, l_Group_0.Name, false);
        end
    }, v10);
end;
return CollisonCheckbox;