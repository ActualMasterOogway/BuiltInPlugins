local v0 = require(script.Parent.Internal.RequireRoact);
local v1 = require(script.Parent.Internal.ThemeChangeListener);
local v2 = require(script.Parent.Internal.Theme);
local v3 = nil;
local function v7(v4) --[[ Line: 20 ]] --[[ Name: Separator ]]
    -- upvalues: v3 (ref), v0 (copy), v1 (copy)
    local function v6() --[[ Line: 21 ]] --[[ Name: renderInternal ]]
        -- upvalues: v3 (ref), v4 (copy), v0 (ref)
        local v5 = v3(v4);
        return v0.createElement("Frame", {
            Size = v4.Size or UDim2.new(1, 0, 0, 2), 
            Position = v4.Position, 
            BackgroundColor3 = v5.SeparatorColor, 
            BorderSizePixel = 0, 
            LayoutOrder = v4.LayoutOrder or 1
        });
    end;
    return v0.createElement(v1, {
        render = v6
    });
end;
v3 = function(v8) --[[ Line: 38 ]]
    -- upvalues: v2 (copy)
    local v9 = {
        SeparatorColor = v2.getSeparatorColor()
    };
    local v10 = {};
    for v11, v12 in pairs(v9) do
        v10[v11] = v8.Style and v8.Style[v11] or v12;
    end;
    return v10;
end;
return v7;