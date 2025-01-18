local v0 = require(script.Parent.Internal.RequireRoact);
local v1 = require(script.Parent.Internal.ThemeChangeListener);
local v2 = require(script.Parent.Internal.Theme);
local v3 = require(script.Parent.Internal.Constants);
local v4 = nil;
local function v8(v5) --[[ Line: 23 ]] --[[ Name: Text ]]
    -- upvalues: v4 (ref), v0 (copy), v3 (copy), v1 (copy)
    local function v7() --[[ Line: 24 ]] --[[ Name: renderInternal ]]
        -- upvalues: v4 (ref), v5 (copy), v0 (ref), v3 (ref)
        local v6 = v4(v5);
        return v0.createElement("TextLabel", {
            LayoutOrder = v5.LayoutOrder, 
            BackgroundTransparency = 1, 
            Size = v5.Size, 
            Position = v5.Position, 
            AnchorPoint = v5.AnchorPoint, 
            Text = v5.Text or "", 
            Font = Enum.Font.SourceSans, 
            TextColor3 = v6.TextColor, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextSize = v3.TEXT_SIZE, 
            TextTransparency = v5.Enabled and 0 or 0.5
        });
    end;
    return v0.createElement(v1, {
        render = v7
    });
end;
v4 = function(v9) --[[ Line: 48 ]]
    -- upvalues: v2 (copy)
    return {
        TextColor = v9.Style and v9.Style.TextColor or v2.getMainTextColor()
    };
end;
return v8;