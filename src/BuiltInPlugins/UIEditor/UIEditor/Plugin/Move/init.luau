local v0 = require(script.Parent.AdornmentModule);
local v1 = require(script.Parent.Analytics);
local _ = require(script.Parent.Convert);
local v3 = require(script.Parent.Extents2D);
local _ = require(script.Parent.FFlag);
local v5 = require(script.Parent.GlobalValues);
local v6 = require(script.Parent.MouseIconManager);
local _ = require(script.Parent.RotateUtility);
local _ = require(script.Parent.Select);
local v9 = require(script.Parent.SelectionManager);
local v10 = require(script.Parent.SnappingPointManager);
local v11 = require(script.Parent.Utility);
local v12 = require(script.Parent.Convert);
local v13 = require(script.Parent.Enum.SnappingType);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local v16 = nil;
local v17 = nil;
local v18 = false;
local v19 = false;
local v20 = {};
local v21 = nil;
local function _(v22, v23) --[[ Line: 56 ]] --[[ Name: findFirstAncestorNotOfType ]]
    local l_Parent_0 = v22.Parent;
    while true do
        if l_Parent_0 then
            if l_Parent_0:IsA(v23) then
                l_Parent_0 = l_Parent_0.Parent;
            else
                return l_Parent_0;
            end;
        else
            return nil;
        end;
    end;
end;
local function v32(v26) --[[ Line: 70 ]] --[[ Name: dragElementsBy ]]
    -- upvalues: v20 (ref), v11 (copy), v5 (copy), v12 (copy)
    for v27 = 1, #v20 do
        local v28 = v20[v27][1];
        local l_Parent_1 = v28.Parent;
        local v30;
        while true do
            if l_Parent_1 then
                if l_Parent_1:IsA("Folder") then
                    l_Parent_1 = l_Parent_1.Parent;
                else
                    v30 = l_Parent_1;
                    break;
                end;
            else
                v30 = nil;
                break;
            end;
        end;
        if v30 and v30:IsA("GuiBase2d") then
            l_Parent_1 = v11:isOnlyScaleUDim2(v20[v27][3]) or not v11:isOnlyOffsetUDim2(v20[v27][3]) and v5:isScale();
            local v31 = v20[v27][2] + v26;
            v28.Position = v12:convertAbsolutePositionToScaleOrOffset(l_Parent_1, v31, v28.AbsoluteSize, v28.Position, v30, v28.AnchorPoint);
        end;
    end;
end;
local function _(v33) --[[ Line: 91 ]] --[[ Name: dragElements ]]
    -- upvalues: v32 (copy), v17 (ref)
    v32(v33 - v17);
end;
local function v36(v35) --[[ Line: 95 ]] --[[ Name: directionToDirectionVector ]]
    if v35 == 1 then
        return Vector2.new(0, -1);
    elseif v35 == 2 then
        return Vector2.new(0, 1);
    elseif v35 == 3 then
        return Vector2.new(-1, 0);
    elseif v35 == 4 then
        return Vector2.new(1, 0);
    else
        return Vector2.new(0, -1);
    end;
end;
local function v37(v38, v39) --[[ Line: 110 ]] --[[ Name: getFirstAncestorOfType ]]
    -- upvalues: v37 (copy)
    if not v38 or not v38.Parent then
        return nil;
    elseif v38.Parent:IsA(v39) then
        return v38.Parent;
    else
        return v37(v38.Parent, v39);
    end;
end;
local function _(v40, v41) --[[ Line: 148 ]] --[[ Name: isDescendantOf ]]
    while true do
        if v40 and v40.Parent then
            if v40.Parent == v41 then
                return true;
            else
                v40 = v40.Parent;
            end;
        else
            return false;
        end;
    end;
end;
getHighestZIndexOfSelfAndDescendants = function(v43, v44) --[[ Line: 158 ]] --[[ Name: getHighestZIndexOfSelfAndDescendants ]]
    if v43 == v44 then
        return 0;
    else
        local v45 = 0;
        if v43:IsA("GuiObject") then
            v45 = v43.ZIndex;
        end;
        local l_v43_Children_0 = v43:GetChildren();
        for v47 = 1, #l_v43_Children_0 do
            v45 = math.max(v45, getHighestZIndexOfSelfAndDescendants(l_v43_Children_0[v47], v44));
        end;
        return v45;
    end;
end;
incrementZIndexOfSelfAndDescendantsBy = function(v48, v49) --[[ Line: 178 ]] --[[ Name: incrementZIndexOfSelfAndDescendantsBy ]]
    if v48:IsA("GuiObject") then
        v48.ZIndex = v48.zIndex + v49;
    end;
    local l_v48_Children_0 = v48:GetChildren();
    for v51 = 1, #l_v48_Children_0 do
        incrementZIndexOfSelfAndDescendantsBy(l_v48_Children_0[v51], v49);
    end;
end;
local v68 = {
    isDragInProgress = function(_) --[[ Line: 192 ]] --[[ Name: isDragInProgress ]]
        -- upvalues: v18 (ref)
        return v18;
    end, 
    startDrag = function(_, v54) --[[ Line: 197 ]] --[[ Name: startDrag ]]
        -- upvalues: v20 (ref), v9 (copy), v17 (ref), v18 (ref), v19 (ref), v21 (ref), v3 (copy), v6 (copy), v0 (copy), v16 (ref)
        v20 = {};
        local v55 = v9:getFilteredSelectionCommonAncestors();
        for v56 = 1, #v55 do
            table.insert(v20, {
                v55[v56], 
                v55[v56].AbsolutePosition, 
                v55[v56].Position
            });
        end;
        if #v20 == 0 then
            return;
        else
            v17 = v54;
            v18 = true;
            v19 = false;
            v21 = v3:getExtentsFromGuis(v55);
            v6:setToMoveIcon();
            v0:createSelectionAdorns();
            v16:onMoveBegan(v54);
            return;
        end;
    end, 
    finishDrag = function(_, v58) --[[ Line: 223 ]] --[[ Name: finishDrag ]]
        -- upvalues: v19 (ref), v1 (copy), l_ChangeHistoryService_0 (copy), v18 (ref), v17 (ref), v0 (copy), v6 (copy), v16 (ref)
        if v19 then
            v1:reportEvent("Move");
            l_ChangeHistoryService_0:SetWaypoint("Translate Objects (better tt needed)");
        end;
        v18 = false;
        v17 = nil;
        v0:hideSnappingLines();
        v19 = false;
        v6:setToDefaultIcon();
        v0:deleteSelectionAdorns();
        v16:onMoveEnded(v58);
    end, 
    updateDrag = function(_, v60) --[[ Line: 253 ]] --[[ Name: updateDrag ]]
        -- upvalues: v19 (ref), v11 (copy), v17 (ref), v0 (copy), v13 (copy), l_UserInputService_0 (copy), v3 (copy), v21 (ref), v10 (copy), v32 (copy), v16 (ref)
        if not v19 and v11:manhattanDistance(v60 - v17) <= 3 then
            return;
        else
            v19 = true;
            v0:hideSnappingLines();
            local _ = v13.MoveXY;
            if l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift) then
                v60 = if math.abs(v60.Y - v17.Y) < math.abs(v60.X - v17.X) then Vector2.new(v60.X, v17.Y) else Vector2.new(v17.X, v60.Y);
            end;
            local v62 = v3:translate(v21, v60 - v17);
            local v63 = nil;
            local v64, v65 = v10:snapExtents(v62, v13.MoveXY);
            v62 = v64;
            v63 = v65;
            for v66 = 1, #v63 do
                v0:showSnappingLine(v63[v66]);
            end;
            v64 = nil;
            v64 = v11:floorVector2(v62.TopLeft - v21.TopLeft);
            v65 = v17 + v64;
            v32(v65 - v17);
            v0:updateSelectionAdorns(v62);
            v16:onMoveChanged(v60);
            return;
        end;
    end, 
    onSelectionChanged = function(_) --[[ Line: 313 ]] --[[ Name: onSelectionChanged ]]
        -- upvalues: v9 (copy), v0 (copy), v6 (copy)
        if not v9:hasFilteredSelection() then
            v0:hideSelection();
            v6:setToDefaultIcon();
            return;
        else
            v0:updateSelectionPosition();
            v0:showSelection();
            v6:setToMoveIcon();
            return;
        end;
    end
};
v68.bump = function(_, v70) --[[ Line: 324 ]] --[[ Name: bump ]]
    -- upvalues: v68 (copy), v32 (copy), v36 (copy)
    v68:startDrag(Vector2.new(0, 0));
    v32(v36(v70));
    v68:finishDrag(v70);
end;
v68.setActionMediator = function(_, v72) --[[ Line: 330 ]] --[[ Name: setActionMediator ]]
    -- upvalues: v16 (ref)
    v16 = v72;
end;
v68.UP = 1;
v68.DOWN = 2;
v68.LEFT = 3;
v68.RIGHT = 4;
return v68;