local v0 = {};
local v1 = require(script.Parent.CoreGuiManager);
local v2 = require(script.Parent.Enum.Direction);
local v3 = require(script.Parent.MouseIconManager);
local v4 = require(script.Parent.SelectionManager);
local v5 = require(script.Parent.Utility);
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local v7 = nil;
local v8 = nil;
local _ = {};
local v10 = {};
local v11 = false;
local v12 = 0;
local v13 = 0;
local v14 = 0;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = {};
local function v19() --[[ Line: 51 ]] --[[ Name: createHandleParent ]]
    -- upvalues: v17 (ref), v1 (copy)
    v17 = Instance.new("Frame");
    v17.Name = "UIEditorRotationHandleParent";
    v17.BackgroundTransparency = 1;
    v17.BackgroundColor3 = Color3.new(0, 0, 255);
    v17.BorderSizePixel = 0;
    v17.Parent = v1:findOrCreateScreenGui("RotationHandles");
end;
local function _() --[[ Line: 69 ]] --[[ Name: destroyHandleParentAndRotationHandles ]]
    -- upvalues: v17 (ref)
    if v17 then
        v17:Destroy();
    end;
end;
local function _(v21) --[[ Line: 75 ]] --[[ Name: onHandleMouseEnter ]]
    -- upvalues: v10 (copy)
    v10[v21] = true;
end;
local function _(v23) --[[ Line: 79 ]] --[[ Name: onHandleMouseLeave ]]
    -- upvalues: v10 (copy)
    v10[v23] = false;
end;
local function _() --[[ Line: 89 ]] --[[ Name: getMouseOverHandleIndex ]]
    -- upvalues: v2 (copy), v10 (copy)
    local l_NOT_SET_0 = v2.NOT_SET;
    for v26 = v2.FIRST, v2.LAST do
        if v10[v26] then
            return v26;
        end;
    end;
    return l_NOT_SET_0;
end;
local function _() --[[ Line: 104 ]] --[[ Name: resetIsMouseOverHandle ]]
    -- upvalues: v2 (copy), v10 (copy)
    for v28 = v2.FIRST, v2.LAST do
        v10[v28] = false;
    end;
end;
local function v38() --[[ Line: 111 ]] --[[ Name: createRotationHandles ]]
    -- upvalues: v17 (ref), v2 (copy), v10 (copy), v18 (copy)
    if not v17 then
        error("Could not create the rotation handles because the parent was nil.");
    end;
    local v30 = {
        [v2.E] = Vector2.new(0, 0.5), 
        [v2.SE] = Vector2.new(0, 0), 
        [v2.S] = Vector2.new(0.5, 0), 
        [v2.SW] = Vector2.new(1, 0), 
        [v2.W] = Vector2.new(1, 0.5), 
        [v2.NW] = Vector2.new(1, 1), 
        [v2.N] = Vector2.new(0.5, 1), 
        [v2.NE] = Vector2.new(0, 1)
    };
    local v31 = {
        [v2.E] = UDim2.new(1, 0, 0.5, 0), 
        [v2.SE] = UDim2.new(1, 0, 1, 0), 
        [v2.S] = UDim2.new(0.5, 0, 1, 0), 
        [v2.SW] = UDim2.new(0, 0, 1, 0), 
        [v2.W] = UDim2.new(0, 0, 0.5, 0), 
        [v2.NW] = UDim2.new(0, 0, 0, 0), 
        [v2.N] = UDim2.new(0.5, 0, 0, 0), 
        [v2.NE] = UDim2.new(1, 0, 0, 0)
    };
    for v32 = v2.FIRST, v2.LAST do
        local l_Frame_0 = Instance.new("Frame");
        l_Frame_0.Name = "RotationHandle_" .. v2:toShortName(v32);
        l_Frame_0.AnchorPoint = v30[v32];
        l_Frame_0.Size = UDim2.new(0, 20, 0, 20);
        l_Frame_0.Position = v31[v32];
        l_Frame_0.BackgroundColor3 = Color3.new(0, 255, 0);
        l_Frame_0.BackgroundTransparency = 1;
        l_Frame_0.BorderSizePixel = 0;
        l_Frame_0.MouseEnter:connect(function(_, _) --[[ Line: 159 ]]
            -- upvalues: v32 (copy), v10 (ref)
            v10[v32] = true;
        end);
        l_Frame_0.MouseLeave:connect(function(_, _) --[[ Line: 162 ]]
            -- upvalues: v32 (copy), v10 (ref)
            v10[v32] = false;
        end);
        l_Frame_0.Parent = v17;
        v18[v32] = l_Frame_0;
    end;
end;
local function _() --[[ Line: 173 ]] --[[ Name: createHandles ]]
    -- upvalues: v19 (copy), v38 (copy)
    v19();
    v38();
end;
v0.getRotation = function(_) --[[ Line: 178 ]] --[[ Name: getRotation ]]
    -- upvalues: v8 (ref)
    if not v8 then
        return 0;
    else
        return v8.AbsoluteRotation;
    end;
end;
v0.updateMouseIcon = function(_) --[[ Line: 189 ]] --[[ Name: updateMouseIcon ]]
    -- upvalues: v11 (ref), v2 (copy), v10 (copy), v8 (ref), v3 (copy)
    if v11 then
        return;
    else
        local l_NOT_SET_1 = v2.NOT_SET;
        for v43 = v2.FIRST, v2.LAST do
            if v10[v43] then
                l_NOT_SET_1 = v43;
                break;
            end;
        end;
        local l_l_NOT_SET_1_0 = l_NOT_SET_1;
        if l_l_NOT_SET_1_0 ~= v2.NOT_SET then
            l_NOT_SET_1 = v8.AbsoluteRotation;
            local v45 = v3:calcMouseIconDirection(l_l_NOT_SET_1_0, l_NOT_SET_1);
            v3:setToRotateIcon(v45);
        end;
        return;
    end;
end;
v0.isOverAHandle = function(_) --[[ Line: 205 ]] --[[ Name: isOverAHandle ]]
    -- upvalues: v2 (copy), v10 (copy)
    local l_NOT_SET_2 = v2.NOT_SET;
    for v48 = v2.FIRST, v2.LAST do
        if v10[v48] then
            l_NOT_SET_2 = v48;
            break;
        end;
    end;
    return l_NOT_SET_2 ~= v2.NOT_SET;
end;
local function _(v49) --[[ Line: 212 ]] --[[ Name: calcCenter ]]
    local v50 = v49.AbsolutePosition.X + math.floor(v49.AbsoluteSize.X / 2);
    local v51 = v49.AbsolutePosition.Y + math.floor(v49.AbsoluteSize.Y / 2);
    return Vector2.new(v50, v51);
end;
v0.onMouseDown = function(_, v54) --[[ Line: 222 ]] --[[ Name: onMouseDown ]]
    -- upvalues: v8 (ref), v2 (copy), v10 (copy), v11 (ref), v12 (ref), v13 (ref), v15 (ref), v14 (ref), v16 (ref), v7 (ref)
    if not v8 then
        return;
    else
        local l_NOT_SET_3 = v2.NOT_SET;
        for v56 = v2.FIRST, v2.LAST do
            if v10[v56] then
                l_NOT_SET_3 = v56;
                break;
            end;
        end;
        if not v2:isValid(l_NOT_SET_3) then
            return;
        else
            v11 = true;
            v12 = v8.Rotation;
            v13 = v8.Rotation;
            local l_v8_0 = v8;
            local v58 = l_v8_0.AbsolutePosition.X + math.floor(l_v8_0.AbsoluteSize.X / 2);
            local v59 = l_v8_0.AbsolutePosition.Y + math.floor(l_v8_0.AbsoluteSize.Y / 2);
            v15 = Vector2.new(v58, v59);
            v14 = 0;
            v16 = v54 - v15;
            v7:onRotateBegan(v54);
            return;
        end;
    end;
end;
local function _(v60) --[[ Line: 247 ]] --[[ Name: roundRotationAngle ]]
    return (math.floor(v60 + 0.5));
end;
local function _(v62) --[[ Line: 254 ]] --[[ Name: constrainRotationAngle ]]
    if v62 >= 0 then
        return v62 % 360;
    else
        return -(-v62 % 360);
    end;
end;
v0.onMouseMove = function(_, v65) --[[ Line: 266 ]] --[[ Name: onMouseMove ]]
    -- upvalues: v11 (ref), v15 (ref), v5 (copy), v16 (ref), v14 (ref), v13 (ref), v8 (ref), v0 (copy), v7 (ref)
    if not v11 then
        return;
    else
        local v66 = v65 - v15;
        local v67 = math.deg((v5:angleVector2(v16, v66)));
        v14 = v14 + v67;
        local v68 = math.floor(v13 + v14 + 0.5);
        v8.Rotation = if v68 >= 0 then v68 % 360 else -(-v68 % 360);
        v16 = v66;
        if math.abs(v14) > 90 then
            v13 = v8.Rotation;
            v14 = 0;
        end;
        v0:update();
        v7:onRotateChanged(v65);
        return;
    end;
end;
v0.onMouseUp = function(_, v70) --[[ Line: 305 ]] --[[ Name: onMouseUp ]]
    -- upvalues: v11 (ref), v8 (ref), v12 (ref), l_ChangeHistoryService_0 (copy), v15 (ref), v16 (ref), v0 (copy), v7 (ref)
    if not v11 then
        return;
    else
        if v8.Rotation ~= v12 then
            l_ChangeHistoryService_0:SetWaypoint("Rotate object");
        end;
        v11 = false;
        v15 = nil;
        v16 = nil;
        v0:update();
        v7:onRotateEnded(v70);
        return;
    end;
end;
v0.isRotating = function(_) --[[ Line: 326 ]] --[[ Name: isRotating ]]
    -- upvalues: v11 (ref)
    return v11;
end;
v0.update = function(_) --[[ Line: 333 ]] --[[ Name: update ]]
    -- upvalues: v8 (ref), v17 (ref)
    if not v8 then
        return;
    else
        v17.AnchorPoint = v8.AnchorPoint;
        local l_AbsolutePosition_0 = v8.AbsolutePosition;
        v17.Position = UDim2.new(0, l_AbsolutePosition_0.X, 0, l_AbsolutePosition_0.Y);
        local l_AbsoluteSize_0 = v8.AbsoluteSize;
        v17.Size = UDim2.new(0, l_AbsoluteSize_0.X, 0, l_AbsoluteSize_0.Y);
        v17.Rotation = v8.AbsoluteRotation;
        return;
    end;
end;
v0.onSelectionChanged = function(_) --[[ Line: 346 ]] --[[ Name: onSelectionChanged ]]
    -- upvalues: v4 (copy), v8 (ref), v0 (copy), v17 (ref)
    local v76 = v4:getFilteredSelection();
    if #v76 == 1 then
        v8 = v76[1];
        v0:update();
        v17.Visible = true;
        return;
    else
        v8 = nil;
        v17.Visible = false;
        return;
    end;
end;
v0.On = function(_) --[[ Line: 362 ]] --[[ Name: On ]]
    -- upvalues: v19 (copy), v38 (copy), v2 (copy), v10 (copy), v11 (ref), v0 (copy)
    v19();
    v38();
    for v78 = v2.FIRST, v2.LAST do
        v10[v78] = false;
    end;
    v11 = false;
    v0:update();
end;
v0.Off = function(_) --[[ Line: 370 ]] --[[ Name: Off ]]
    -- upvalues: v17 (ref), v11 (ref)
    if v17 then
        v17:Destroy();
    end;
    v11 = false;
end;
v0.setActionMediator = function(_, v81) --[[ Line: 375 ]] --[[ Name: setActionMediator ]]
    -- upvalues: v7 (ref)
    v7 = v81;
end;
return v0;