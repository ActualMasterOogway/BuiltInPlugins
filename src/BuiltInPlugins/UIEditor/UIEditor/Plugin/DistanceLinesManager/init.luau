local v0 = {};
local v1 = require(script.Parent.Enum.Axis);
local v2 = require(script.Parent.DistanceLine);
local _ = require(script.Parent.Log);
local v4 = require(script.Parent.SelectionManager);
local v5 = nil;
local v6 = nil;
local v7 = nil;
local function _() --[[ Line: 25 ]] --[[ Name: doDeselect ]]
    -- upvalues: v0 (copy), v5 (ref)
    v0:setVisible(false);
    v5 = nil;
end;
v0.onSelectionChanged = function(_) --[[ Line: 32 ]] --[[ Name: onSelectionChanged ]]
    -- upvalues: v4 (copy), v0 (copy), v5 (ref)
    local v10 = v4:getFilteredSelection();
    if #v10 ~= 1 then
        v0:setVisible(false);
        v5 = nil;
        return;
    else
        local v11 = v10[1];
        if not v11.Parent:IsA("GuiBase2d") then
            v0:setVisible(false);
            v5 = nil;
            return;
        else
            v5 = v11;
            v0:update();
            v0:setVisible(true);
            return;
        end;
    end;
end;
v0.On = function(_) --[[ Line: 58 ]] --[[ Name: On ]]
    -- upvalues: v6 (ref), v2 (copy), v1 (copy), v7 (ref)
    v6 = v2.new(v1.X);
    v7 = v2.new(v1.Y);
end;
v0.Off = function(_) --[[ Line: 66 ]] --[[ Name: Off ]]
    -- upvalues: v6 (ref), v7 (ref)
    v6:destroy();
    v7:destroy();
    v6 = nil;
    v7 = nil;
end;
v0.update = function(_) --[[ Line: 77 ]] --[[ Name: update ]]
    -- upvalues: v5 (ref), v6 (ref), v7 (ref)
    if v5 == nil then
        return;
    else
        v6:update(v5);
        v7:update(v5);
        return;
    end;
end;
v0.setVisible = function(_, v16) --[[ Line: 86 ]] --[[ Name: setVisible ]]
    -- upvalues: v5 (ref), v6 (ref), v7 (ref)
    if not v5 then
        return;
    elseif not v5.Parent then
        return;
    else
        local v17 = math.abs(v5.AbsoluteRotation) >= 0.001;
        if v16 and v17 then
            v6:setVisible(false);
            v7:setVisible(false);
            return;
        else
            v6:setVisible(v16);
            v7:setVisible(v16);
            return;
        end;
    end;
end;
return v0;