local v0 = require(script.Parent.Internal.RequireRoact);
local v1 = require(script.Parent.Internal.ThemeChangeListener);
local v2 = require(script.Parent.Internal.Theme);
local v3 = nil;
local function v7(v4) --[[ Line: 23 ]] --[[ Name: TitledFrame ]]
    -- upvalues: v3 (ref), v0 (copy), v1 (copy)
    local function v6() --[[ Line: 24 ]] --[[ Name: renderInternal ]]
        -- upvalues: v3 (ref), v4 (copy), v0 (ref)
        local v5 = v3(v4);
        return v0.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, v4.MaxHeight or 100), 
            LayoutOrder = v4.LayoutOrder or 1
        }, {
            Title = v0.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(0, 180, 1, 0), 
                TextColor3 = v5.TextColor, 
                Font = v4.Font ~= nil and v4.Font or Enum.Font.SourceSans, 
                TextSize = 22, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = v4.TitleTextYAlignment == nil and Enum.TextYAlignment.Top or v4.TitleTextYAlignment, 
                Text = v4.Title
            }), 
            Content = v0.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, -180, 1, 0), 
                AnchorPoint = Vector2.new(1, 0), 
                Position = UDim2.new(1, 0, 0, 0)
            }, v4[v0.Children])
        });
    end;
    return v0.createElement(v1, {
        render = v6
    });
end;
v3 = function(v8) --[[ Line: 62 ]]
    -- upvalues: v2 (copy)
    return {
        TextColor = v8.Style and v8.Style.TextColor and v8.Style.TextColor or v2.getTitleTextColor()
    };
end;
return v7;