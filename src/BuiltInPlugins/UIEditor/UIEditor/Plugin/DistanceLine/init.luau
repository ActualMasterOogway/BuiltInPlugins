local v0 = {};
local v1 = require(script.Parent.Enum.Axis);
local v2 = require(script.Parent.CoreGuiManager);
local _ = require(script.Parent.Log);
local v4 = require(script.Parent.RectUtility);
local v5 = require(script.Parent.ValueBox);
local v6 = Color3.fromRGB(255, 205, 0);
local function v10(v7) --[[ Line: 50 ]] --[[ Name: createDistanceFrame ]]
    -- upvalues: v6 (copy), v2 (copy), v1 (copy)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "DistanceLine";
    l_Frame_0.BorderSizePixel = 0;
    l_Frame_0.BackgroundColor3 = v6;
    l_Frame_0.Visible = false;
    l_Frame_0.Parent = v2:findOrCreateScreenGui("DistanceLines");
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Name = "DistanceEnd";
    l_Frame_1.BorderSizePixel = 0;
    l_Frame_1.BackgroundColor3 = v6;
    l_Frame_1.Visible = true;
    l_Frame_1.Parent = l_Frame_0;
    l_Frame_1.Size = ({
        UDim2.new(0, 2, 0, 10), 
        UDim2.new(0, 10, 0, 2)
    })[v7];
    l_Frame_0:GetPropertyChangedSignal("AnchorPoint"):Connect(function() --[[ Line: 78 ]]
        -- upvalues: v7 (copy), v1 (ref), l_Frame_0 (copy), l_Frame_1 (copy)
        if v7 == v1.X then
            if l_Frame_0.AnchorPoint.X == 0 then
                l_Frame_1.AnchorPoint = Vector2.new(1, 0.5);
                l_Frame_1.Position = UDim2.new(1, 0, 0.5, 0);
                return;
            else
                l_Frame_1.AnchorPoint = Vector2.new(0, 0.5);
                l_Frame_1.Position = UDim2.new(0, 0, 0.5, 0);
                return;
            end;
        else
            if v7 == v1.Y then
                if l_Frame_0.AnchorPoint.Y == 0 then
                    l_Frame_1.AnchorPoint = Vector2.new(0.5, 1);
                    l_Frame_1.Position = UDim2.new(0.5, 0, 1, 0);
                    return;
                else
                    l_Frame_1.AnchorPoint = Vector2.new(0.5, 0);
                    l_Frame_1.Position = UDim2.new(0.5, 0, 0, 0);
                end;
            end;
            return;
        end;
    end);
    return l_Frame_0;
end;
local function v15(v11, v12) --[[ Line: 104 ]] --[[ Name: createDistanceBox ]]
    -- upvalues: v5 (copy)
    local v13 = {
        UDim2.new(0.5, 0, 0, 0), 
        UDim2.new(0, 0, 0.5, 0)
    };
    local v14 = v5.new(v12);
    v14.Name = "DistanceBox";
    v14:setAnchorPoint(Vector2.new(0.5, 0.5));
    v14:setPosition(v13[v11]);
    if v12 ~= nil then
        v14.Parent = v12;
    end;
    return v14;
end;
v0.new = function(v16) --[[ Line: 126 ]] --[[ Name: new ]]
    -- upvalues: v10 (copy), v15 (copy), v0 (copy)
    local v17 = {
        m_axis = v16, 
        m_distanceFrame = v10(v16)
    };
    v17.m_distanceBox = v15(v16, v17.m_distanceFrame);
    v17.m_canShow = false;
    return (setmetatable(v17, v0));
end;
v0.__index = v0;
v0.destroy = function(v18) --[[ Line: 146 ]] --[[ Name: destroy ]]
    v18.m_distanceBox:Destroy();
    v18.m_distanceFrame:Destroy();
    v18.m_distanceBox = nil;
    v18.m_distanceFrame = nil;
end;
local function _(v19, v20) --[[ Line: 158 ]] --[[ Name: calcLeftDistance ]]
    return v19.AbsolutePosition.X - v20.AbsolutePosition.X;
end;
local function _(v22, v23) --[[ Line: 166 ]] --[[ Name: calcRightDistance ]]
    local v24 = v22.AbsolutePosition.X + v22.AbsoluteSize.X;
    return v23.AbsolutePosition.X + v23.AbsoluteSize.X - v24;
end;
local function _(v26, v27) --[[ Line: 176 ]] --[[ Name: calcTopDistance ]]
    return v26.AbsolutePosition.Y - v27.AbsolutePosition.Y;
end;
local function _(v29, v30) --[[ Line: 184 ]] --[[ Name: calcBottomDistance ]]
    local v31 = v29.AbsolutePosition.Y + v29.AbsoluteSize.Y;
    return v30.AbsolutePosition.Y + v30.AbsoluteSize.Y - v31;
end;
local function _(v33, v34) --[[ Line: 190 ]] --[[ Name: updateDistanceBoxText ]]
    v33.m_distanceBox:setText(("%d"):format(v34));
end;
local function v52(v36, v37, v38) --[[ Line: 200 ]] --[[ Name: updateX ]]
    -- upvalues: v4 (copy)
    local l_m_distanceFrame_0 = v36.m_distanceFrame;
    local v40 = Rect.new(v38.AbsolutePosition, v38.AbsolutePosition + v38.AbsoluteSize);
    local v41 = Vector2.new(v37.AbsolutePosition.X, (math.floor(v37.AbsolutePosition.Y + v37.AbsoluteSize.Y / 2)));
    local v42 = Vector2.new(v37.AbsolutePosition.X + v37.AbsoluteSize.X, (math.floor(v37.AbsolutePosition.Y + v37.AbsoluteSize.Y / 2)));
    local v43 = v4:containsPoint(v40, v41);
    local v44 = v4:containsPoint(v40, v42);
    local v45 = Vector2.new(1, 0.5);
    local v46 = Vector2.new(0, 0.5);
    local v47 = nil;
    if v43 and v44 then
        local v48 = v37.AbsolutePosition.X - v38.AbsolutePosition.X;
        local v49 = v37.AbsolutePosition.X + v37.AbsoluteSize.X;
        local v50 = v38.AbsolutePosition.X + v38.AbsoluteSize.X - v49;
        v47 = math.min(v48, v50);
        l_m_distanceFrame_0.Size = UDim2.new(0, v47, 0, 2);
        if v48 <= v50 then
            l_m_distanceFrame_0.AnchorPoint = v45;
            l_m_distanceFrame_0.Position = UDim2.new(0, v41.X, 0, v41.Y);
        else
            l_m_distanceFrame_0.AnchorPoint = v46;
            l_m_distanceFrame_0.Position = UDim2.new(0, v42.X, 0, v42.Y);
        end;
    elseif v43 then
        l_m_distanceFrame_0.AnchorPoint = v45;
        l_m_distanceFrame_0.Position = UDim2.new(0, v41.X, 0, v41.Y);
        v47 = v37.AbsolutePosition.X - v38.AbsolutePosition.X;
        l_m_distanceFrame_0.Size = UDim2.new(0, v47, 0, 2);
    elseif v44 then
        l_m_distanceFrame_0.AnchorPoint = v46;
        l_m_distanceFrame_0.Position = UDim2.new(0, v42.X, 0, v42.Y);
        local v51 = v37.AbsolutePosition.X + v37.AbsoluteSize.X;
        v47 = v38.AbsolutePosition.X + v38.AbsoluteSize.X - v51;
        l_m_distanceFrame_0.Size = UDim2.new(0, v47, 0, 2);
    else
        v36.m_canShow = false;
        return;
    end;
    v36.m_canShow = true;
    v36.m_distanceBox:setText(("%d"):format(v47));
end;
local function v69(v53, v54, v55) --[[ Line: 265 ]] --[[ Name: updateY ]]
    -- upvalues: v4 (copy)
    local l_m_distanceFrame_1 = v53.m_distanceFrame;
    local v57 = Rect.new(v55.AbsolutePosition, v55.AbsolutePosition + v55.AbsoluteSize);
    local v58 = Vector2.new(math.floor(v54.AbsolutePosition.X + v54.AbsoluteSize.X / 2), v54.AbsolutePosition.Y);
    local v59 = Vector2.new(math.floor(v54.AbsolutePosition.X + v54.AbsoluteSize.X / 2), v54.AbsolutePosition.Y + v54.AbsoluteSize.Y);
    local v60 = v4:containsPoint(v57, v58);
    local v61 = v4:containsPoint(v57, v59);
    local v62 = Vector2.new(0.5, 1);
    local v63 = Vector2.new(0.5, 0);
    local v64 = nil;
    if v60 and v61 then
        local v65 = v54.AbsolutePosition.Y - v55.AbsolutePosition.Y;
        local v66 = v54.AbsolutePosition.Y + v54.AbsoluteSize.Y;
        local v67 = v55.AbsolutePosition.Y + v55.AbsoluteSize.Y - v66;
        v64 = math.min(v65, v67);
        l_m_distanceFrame_1.Size = UDim2.new(0, 2, 0, v64);
        if v65 <= v67 then
            l_m_distanceFrame_1.AnchorPoint = v62;
            l_m_distanceFrame_1.Position = UDim2.new(0, v58.X, 0, v58.Y);
        else
            l_m_distanceFrame_1.AnchorPoint = v63;
            l_m_distanceFrame_1.Position = UDim2.new(0, v59.X, 0, v59.Y);
        end;
    elseif v60 then
        l_m_distanceFrame_1.Visible = true;
        l_m_distanceFrame_1.AnchorPoint = v62;
        l_m_distanceFrame_1.Position = UDim2.new(0, v58.X, 0, v58.Y);
        v64 = v54.AbsolutePosition.Y - v55.AbsolutePosition.Y;
        l_m_distanceFrame_1.Size = UDim2.new(0, 2, 0, v64);
    elseif v61 then
        l_m_distanceFrame_1.Visible = true;
        l_m_distanceFrame_1.AnchorPoint = v63;
        l_m_distanceFrame_1.Position = UDim2.new(0, v59.X, 0, v59.Y);
        local v68 = v54.AbsolutePosition.Y + v54.AbsoluteSize.Y;
        v64 = v55.AbsolutePosition.Y + v55.AbsoluteSize.Y - v68;
        l_m_distanceFrame_1.Size = UDim2.new(0, 2, 0, v64);
    else
        v53.m_canShow = false;
        return;
    end;
    v53.m_canShow = true;
    v53.m_distanceBox:setText(("%d"):format(v64));
end;
v0.update = function(v70, v71) --[[ Line: 332 ]] --[[ Name: update ]]
    -- upvalues: v1 (copy), v52 (copy), v69 (copy)
    local l_v71_FirstAncestorWhichIsA_0 = v71:FindFirstAncestorWhichIsA("GuiBase2d");
    if v70.m_axis == v1.X then
        v52(v70, v71, l_v71_FirstAncestorWhichIsA_0);
        return;
    elseif v70.m_axis == v1.Y then
        v69(v70, v71, l_v71_FirstAncestorWhichIsA_0);
        return;
    else
        error("Could not update the DistanceLine. The axis must be either X or Y");
        return;
    end;
end;
v0.setVisible = function(v73, v74) --[[ Line: 350 ]] --[[ Name: setVisible ]]
    if v74 then
        v73.m_distanceFrame.Visible = v73.m_canShow;
        return;
    else
        v73.m_distanceFrame.Visible = false;
        return;
    end;
end;
return v0;