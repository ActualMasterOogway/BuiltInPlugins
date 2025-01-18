local v0 = require(script.Parent.Parent.Framework);
local v1 = Vector2.new(30, 40);
local v2 = Vector2.new(8, 0);
local v3 = require(script.Parent.Internal.RequireRoact);
local v4 = require(script.Parent.Internal.Constants);
local v5 = require(script.Parent.Internal.ThemeChangeListener);
local v6 = require(script.Parent.Internal.Theme);
local v7 = require(script.Parent.Internal.Text);
local l_Button_0 = v0.UI.Button;
local l_StyleModifier_0 = v0.Util.StyleModifier;
local v10 = nil;
local function v29(v11) --[[ Line: 44 ]] --[[ Name: ButtonBar ]]
    -- upvalues: v3 (copy), v10 (ref), l_Button_0 (copy), v4 (copy), l_StyleModifier_0 (copy), v1 (copy), v7 (copy), v2 (copy), v5 (copy)
    local function v28() --[[ Line: 45 ]] --[[ Name: renderInternal ]]
        -- upvalues: v11 (copy), v3 (ref), v10 (ref), l_Button_0 (ref), v4 (ref), l_StyleModifier_0 (ref), v1 (ref), v7 (ref), v2 (ref)
        local l_HorizontalAlignment_0 = v11.HorizontalAlignment;
        local l_Buttons_0 = v11.Buttons;
        local v14 = v11.ZIndex or 1;
        local v15 = v11.Title ~= nil and v14 + 1 or v14;
        local v16 = v11.FillDirection == nil and Enum.FillDirection.Horizontal or v11.FillDirection;
        local v17 = {
            Layout = v3.createElement("UIListLayout", {
                Padding = UDim.new(0, v11.Padding or 25), 
                HorizontalAlignment = l_HorizontalAlignment_0, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = v16
            })
        };
        if l_HorizontalAlignment_0 ~= Enum.HorizontalAlignment.Center then
            table.insert(v17, v3.createElement("UIPadding", {
                PaddingRight = UDim.new(0, 35)
            }));
        end;
        local v18 = v10(v11);
        for v19, v20 in ipairs(l_Buttons_0) do
            table.insert(v17, v3.createElement(l_Button_0, {
                LayoutOrder = v19, 
                OnClick = function() --[[ Line: 74 ]] --[[ Name: OnClick ]]
                    -- upvalues: v11 (ref), v20 (copy)
                    v11.ButtonClicked(v20.Value);
                end, 
                Size = if v11.Title ~= nil then UDim2.new(0, v4.BUTTON_WIDTH, 0, v4.BUTTON_HEIGHT) else UDim2.new(0, v4.BUTTON_WIDTH, 1, 0), 
                Style = v20.Default and "RoundPrimary" or "Round", 
                StyleModifier = if v20.Enabled == false then l_StyleModifier_0.Disabled else nil, 
                Text = v20.Name, 
                Tooltip = if typeof(v20.Value) == "table" then v20.Value.ToolTip else nil, 
                ZIndex = v15
            }));
        end;
        if v11.Title ~= nil then
            local v21 = nil;
            local v22 = nil;
            if Enum.FillDirection.Vertical == v16 then
                local v23 = #l_Buttons_0 * v4.BUTTON_HEIGHT;
                local v24 = math.max(#l_Buttons_0 - 1, 0) * (v11.Padding or 25);
                v21 = v4.BUTTON_WIDTH + v1.X;
                v22 = v1.Y + v23 + v24;
            else
                local v25 = #l_Buttons_0 * v4.BUTTON_WIDTH;
                local v26 = math.max(#l_Buttons_0 - 1, 0) * (v11.Padding or 25);
                v21 = v1.X + v25 + v26;
                v22 = v4.BUTTON_HEIGHT + v1.Y;
            end;
            local v27 = v7.calculateTextSize(v11.Title, 22, Enum.Font.SourceSans) + v2;
            return v3.createElement("Frame", {
                LayoutOrder = v11.LayoutOrder or 1, 
                Size = UDim2.new(1, 0, 0, v22), 
                BackgroundTransparency = 1
            }, {
                Border = v3.createElement("ImageLabel", {
                    Size = UDim2.new(0, v21, 1, 0), 
                    BackgroundTransparency = 1, 
                    Image = v4.ROUNDED_BORDER_IMAGE, 
                    ImageColor3 = v18.BorderDefaultColor, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = v4.ROUNDED_FRAME_SLICE, 
                    ZIndex = v14
                }, {
                    Title = v3.createElement("TextLabel", {
                        AnchorPoint = Vector2.new(0, 0.5), 
                        Position = UDim2.new(0, v1.X / 2, 0, 0), 
                        BackgroundTransparency = 0, 
                        BackgroundColor3 = v18.BackgroundColor, 
                        BorderSizePixel = 0, 
                        Size = UDim2.new(0, v27.X, 0, v27.Y), 
                        TextColor3 = v18.TextColor, 
                        Font = Enum.Font.SourceSans, 
                        TextSize = 22, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        Text = v11.Title, 
                        ZIndex = v15
                    }); 
                    v3.createElement("Frame", {
                        Position = UDim2.new(0, v1.X / 2, 0, v1.Y / 2), 
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1
                    }, v17)
                })
            });
        else
            return v3.createElement("Frame", {
                LayoutOrder = v11.LayoutOrder or 1, 
                Size = UDim2.new(1, 0, 0, v4.BUTTON_HEIGHT), 
                AnchorPoint = v11.AnchorPoint or Vector2.new(0, 0.5), 
                Position = v11.Position or UDim2.new(0, 0, 0.5, 0), 
                BackgroundTransparency = 1
            }, v17);
        end;
    end;
    return v3.createElement(v5, {
        render = v28
    });
end;
v10 = function(v30) --[[ Line: 158 ]]
    -- upvalues: v6 (copy)
    local v31 = {
        BorderDefaultColor = v6.getBorderDefaultColor(), 
        BackgroundColor = v6.getMainBackgroundColor(), 
        TextColor = v6.getTitleTextColor()
    };
    local v32 = {};
    for v33, v34 in pairs(v31) do
        v32[v33] = v30.Style and v30.Style[v33] or v34;
    end;
    return v32;
end;
return v29;