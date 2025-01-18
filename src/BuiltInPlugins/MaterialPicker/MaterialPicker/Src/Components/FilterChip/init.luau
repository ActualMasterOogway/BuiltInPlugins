local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialPicker");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_createElement_0 = v1.createElement;
local l_useState_0 = v1.useState;
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Pane_0 = v4.UI.Pane;
local l_TextLabel_0 = v4.UI.TextLabel;
local l_Stylizer_0 = v4.Style.Stylizer;
local function _(v8, v9) --[[ Line: 25 ]] --[[ Name: getBackgroundColor ]]
    -- upvalues: l_Stylizer_0 (copy)
    local v10 = l_Stylizer_0:use("Filters");
    local l_selected_0 = v8.selected;
    if v8.Disabled then
        return v10.Filters.InactiveBackgroundColor;
    elseif l_selected_0 and v9 then
        return v10.Filters.ActiveHoverBackgroundColor;
    elseif l_selected_0 then
        return v10.Filters.ActiveBackgroundColor;
    elseif v9 then
        return v10.Filters.InactiveHoverBackgroundColor;
    else
        return v10.Filters.InactiveBackgroundColor;
    end;
end;
FilterChip = function(v13) --[[ Line: 42 ]] --[[ Name: FilterChip ]]
    -- upvalues: l_Stylizer_0 (copy), l_useState_0 (copy), l_createElement_0 (copy), v1 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy)
    local v14 = l_Stylizer_0:use("Filters");
    local v15, v16 = l_useState_0(false);
    local v17 = l_Stylizer_0:use("Filters");
    local l_selected_1 = v13.selected;
    local v19 = if v13.Disabled then v17.Filters.InactiveBackgroundColor else if l_selected_1 and v15 then v17.Filters.ActiveHoverBackgroundColor else if l_selected_1 then v17.Filters.ActiveBackgroundColor else if v15 then v17.Filters.InactiveHoverBackgroundColor else v17.Filters.InactiveBackgroundColor;
    return l_createElement_0("TextButton", {
        BackgroundTransparency = 1, 
        AnchorPoint = v13.AnchorPoint, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        LayoutOrder = v13.LayoutOrder, 
        Position = v13.Position, 
        Rotation = v13.Rotation, 
        ZIndex = v13.ZIndex, 
        Text = "", 
        [v1.Event.Activated] = not v13.Disabled and v13.OnClick or nil, 
        [v1.Event.MouseEnter] = function() --[[ Line: 58 ]]
            -- upvalues: v16 (copy)
            v16(true);
        end, 
        [v1.Event.MouseLeave] = function() --[[ Line: 61 ]]
            -- upvalues: v16 (copy)
            v16(false);
        end
    }, {
        l_createElement_0(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundColor = v19, 
            Padding = {
                Left = 6, 
                Right = v13.PaddingRight or 6
            }
        }, {
            l_createElement_0("UICorner", {
                CornerRadius = UDim.new(0, 4)
            }), 
            l_createElement_0("UIStroke", {
                Thickness = 1, 
                Color = v14.Filters.BorderColor
            }), 
            l_createElement_0(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.X, 
                Size = v14.Filters.ChipSize, 
                Padding = {
                    Left = 4, 
                    Right = 4
                }, 
                Text = v13.Text, 
                TextColor = v14.Filters.TextColor, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextSize = v14.Filters.TextSize
            })
        })
    });
end;
return FilterChip;