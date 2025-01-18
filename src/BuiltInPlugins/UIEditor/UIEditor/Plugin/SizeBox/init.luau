local v0 = {};
local v1 = require(script.Parent.SelectionManager);
local v2 = require(script.Parent.ValueBox);
local v3 = nil;
local v4 = nil;
local v5 = Vector2.new(2, 6);
local function v12(v6) --[[ Line: 29 ]] --[[ Name: calcSizeBoxPosition ]]
    -- upvalues: v4 (ref), v5 (copy)
    local l_AbsoluteSize_0 = v6.AbsoluteSize;
    local l_AbsolutePosition_0 = v6.AbsolutePosition;
    local v9 = v4:getSize();
    local v10 = math.max(l_AbsolutePosition_0.X + l_AbsoluteSize_0.X - v9.X.Offset - v5.X, l_AbsolutePosition_0.X + v5.X);
    local v11 = l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y + v5.Y;
    return UDim2.new(0, v10, 0, v11);
end;
v0.update = function(_) --[[ Line: 47 ]] --[[ Name: update ]]
    -- upvalues: v3 (ref), v4 (ref), v0 (copy)
    if not v3 then
        return;
    else
        local l_AbsoluteSize_1 = v3.AbsoluteSize;
        local v15 = ("%d x %d"):format(l_AbsoluteSize_1.X, l_AbsoluteSize_1.Y);
        v4:setText(v15);
        v0:updatePosition();
        return;
    end;
end;
v0.setVisible = function(_, v17) --[[ Line: 64 ]] --[[ Name: setVisible ]]
    -- upvalues: v3 (ref), v4 (ref)
    if not v3 then
        return;
    else
        v4:setVisible(v17);
        return;
    end;
end;
v0.onSelectionChanged = function(_) --[[ Line: 72 ]] --[[ Name: onSelectionChanged ]]
    -- upvalues: v1 (copy), v3 (ref), v0 (copy)
    local v19 = v1:getFilteredSelection();
    if #v19 == 1 then
        v3 = v19[1];
        v0:update();
        v0:setVisible(true);
        return;
    else
        v0:setVisible(false);
        v3 = nil;
        return;
    end;
end;
v0.updatePosition = function(_) --[[ Line: 87 ]] --[[ Name: updatePosition ]]
    -- upvalues: v3 (ref), v12 (copy), v4 (ref)
    if not v3 then
        return;
    else
        local v21 = v12(v3);
        v4:setPosition(v21);
        return;
    end;
end;
v0.On = function(_) --[[ Line: 97 ]] --[[ Name: On ]]
    -- upvalues: v4 (ref), v2 (copy)
    v4 = v2.new();
end;
v0.Off = function(_) --[[ Line: 102 ]] --[[ Name: Off ]]
    -- upvalues: v3 (ref), v4 (ref)
    v3 = nil;
    v4:Destroy();
    v4 = nil;
end;
return v0;