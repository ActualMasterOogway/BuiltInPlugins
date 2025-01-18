local _ = require(script.Parent.FFlag);
local v1 = require(script.Parent.InstanceInfo);
local v2 = require(script.Parent.Utility);
local v3 = require(script.Parent.Select);
local function v5(v4) --[[ Line: 15 ]] --[[ Name: refreshData ]]
    v4.Center = (v4.hidden.TopLeft + v4.hidden.BottomRight) * 0.5;
    v4.hidden.Left = v4.hidden.TopLeft.X;
    v4.hidden.Right = v4.hidden.BottomRight.X;
    v4.hidden.Top = v4.hidden.TopLeft.Y;
    v4.hidden.Bottom = v4.hidden.BottomRight.Y;
    v4.hidden.TopRight = Vector2.new(v4.Right, v4.Top);
    v4.hidden.BottomLeft = Vector2.new(v4.Left, v4.Bottom);
    v4.Width = v4.hidden.Right - v4.hidden.Left;
    v4.Height = v4.hidden.Bottom - v4.hidden.Top;
    v4.Size = Vector2.new(v4.Width, v4.Height);
end;
local function v11(v6, v7, v8) --[[ Line: 35 ]] --[[ Name: isPointVisible ]]
    -- upvalues: v3 (copy)
    if not v6 then
        return true;
    else
        local v9 = v3:getGuiObjectsAtPoint(v7);
        for v10 = 1, #v9 do
            if v9[v10] == v6 then
                return true;
            elseif not v8(v9[v10]) then
                return false;
            end;
        end;
        return false;
    end;
end;
local function v16(v12, v13) --[[ Line: 54 ]] --[[ Name: DEPRECATED_isPointVisible ]]
    -- upvalues: v3 (copy), v1 (copy)
    if not v12 then
        return true;
    else
        local v14 = v3:getGuiObjectsAtPoint(v13);
        for v15 = 1, #v14 do
            if v14[v15] == v12 then
                return true;
            elseif not v1:canSeeThrough(v14[v15]) then
                return false;
            end;
        end;
        return false;
    end;
end;
local function v20(v17, v18, v19) --[[ Line: 73 ]] --[[ Name: refreshVisibility ]]
    -- upvalues: v11 (copy)
    v17.hidden.TopLeftVisible = v11(v18, v17.hidden.TopLeft, v19);
    v17.hidden.TopRightVisible = v11(v18, v17.hidden.TopRight, v19);
    v17.hidden.BottomLeftVisible = v11(v18, v17.hidden.BottomLeft, v19);
    v17.hidden.BottomRightVisible = v11(v18, v17.hidden.BottomRight, v19);
    v17.hidden.CenterVisible = v11(v18, v17.Center, v19);
end;
local function _(v21, v22) --[[ Line: 82 ]] --[[ Name: DEPRECATED_refreshVisibility ]]
    -- upvalues: v16 (copy)
    v21.hidden.TopLeftVisible = v16(v22, v21.hidden.TopLeft);
    v21.hidden.TopRightVisible = v16(v22, v21.hidden.TopRight);
    v21.hidden.BottomLeftVisible = v16(v22, v21.hidden.BottomLeft);
    v21.hidden.BottomRightVisible = v16(v22, v21.hidden.BottomRight);
    v21.hidden.CenterVisible = v16(v22, v21.Center);
end;
local function v27(v24, ...) --[[ Line: 91 ]] --[[ Name: extend ]]
    -- upvalues: v2 (copy), v5 (copy)
    local v25 = {
        ...
    };
    for v26 = 1, #v25 do
        v24.hidden.TopLeft = v2:minVector2(v24.hidden.TopLeft, v25[v26]);
        v24.hidden.BottomRight = v2:maxVector2(v24.hidden.BottomRight, v25[v26]);
    end;
    v5(v24);
end;
local function v30(v28, ...) --[[ Line: 103 ]] --[[ Name: set ]]
    -- upvalues: v27 (copy), v5 (copy)
    local v29 = {
        ...
    };
    if #v29 > 0 then
        v28.hidden.TopLeft = v29[1];
        v28.hidden.BottomRight = v29[1];
        table.remove(v29, 1);
        v27(v28, unpack(v29));
        return;
    else
        v5(v28);
        return;
    end;
end;
translate = function(v31, v32) --[[ Line: 118 ]] --[[ Name: translate ]]
    -- upvalues: v5 (copy)
    v31.hidden.TopLeft = v31.hidden.TopLeft + v32;
    v31.hidden.BottomRight = v31.hidden.BottomRight + v32;
    v5(v31);
end;
resize = function(v33, v34) --[[ Line: 125 ]] --[[ Name: resize ]]
    -- upvalues: v5 (copy)
    v33.hidden.BottomRight = v33.hidden.TopLeft + v34;
    v5(v33);
end;
expandFromCenter = function(v35, v36) --[[ Line: 131 ]] --[[ Name: expandFromCenter ]]
    -- upvalues: v5 (copy)
    local v37 = v36 * 0.5;
    v35.TopLeft = v35.TopLeft - v37;
    v35.BottomRight = v35.BottomRight + v37;
    v5(v35);
end;
local v58 = {
    new = function(...) --[[ Line: 143 ]] --[[ Name: new ]]
        -- upvalues: v30 (copy), v1 (copy), v20 (copy), v27 (copy), v5 (copy)
        local v38 = {
            map = {}, 
            mt = {}, 
            hidden = {}
        };
        v38.hidden.TopLeft = Vector2.new(0, 0);
        v38.hidden.BottomRight = Vector2.new(0, 0);
        v30(v38, ...);
        v20(v38, nil, function(v39) --[[ Line: 152 ]] --[[ Name: canSeeThrough ]]
            -- upvalues: v1 (ref)
            return v1:canSeeThrough(v39);
        end);
        local function v42(v40, v41) --[[ Line: 157 ]] --[[ Name: __index ]]
            -- upvalues: v27 (ref), v30 (ref), v38 (copy), v20 (ref)
            if v41 == "extend" then
                return v27;
            elseif v41 == "set" then
                return v30;
            elseif v41 == "TopLeft" then
                return v40.hidden.TopLeft;
            elseif v41 == "BottomRight" then
                return v40.hidden.BottomRight;
            elseif v41 == "TopRight" then
                return v40.hidden.TopRight;
            elseif v41 == "BottomLeft" then
                return v40.hidden.BottomLeft;
            elseif v41 == "Top" then
                return v40.hidden.Top;
            elseif v41 == "Bottom" then
                return v40.hidden.Bottom;
            elseif v41 == "Left" then
                return v40.hidden.Left;
            elseif v41 == "Right" then
                return v40.hidden.Right;
            elseif v41 == "TopLeftVisible" then
                return v38.hidden.TopLeftVisible;
            elseif v41 == "TopRightVisible" then
                return v38.hidden.TopRightVisible;
            elseif v41 == "BottomLeftVisible" then
                return v38.hidden.BottomLeftVisible;
            elseif v41 == "BottomRightVisible" then
                return v38.hidden.BottomRightVisible;
            elseif v41 == "TopVisible" then
                return v38.hidden.TopLeftVisible or v38.hidden.TopRightVisible;
            elseif v41 == "BottomVisible" then
                return v38.hidden.BottomLeftVisible or v38.hidden.BottomRightVisible;
            elseif v41 == "LeftVisible" then
                return v38.hidden.TopLeftVisible or v38.hidden.BottomLeftVisible;
            elseif v41 == "RightVisible" then
                return v38.hidden.TopRightVisible or v38.hidden.BottomRightVisible;
            elseif v41 == "CenterVisible" then
                return v38.hidden.CenterVisible;
            elseif v41 == "translate" then
                return translate;
            elseif v41 == "resize" then
                return resize;
            elseif v41 == "expandFromCenter" then
                return expandFromCenter;
            elseif v41 == "refreshVisibility" then
                return v20;
            else
                return;
            end;
        end;
        v38.mt.__index = v42;
        v42 = function(v43, v44, v45) --[[ Line: 207 ]] --[[ Name: __newindex ]]
            -- upvalues: v5 (ref)
            if v44 == "TopLeft" then
                v43.hidden.TopLeft = v45;
            elseif v44 == "BottomRight" then
                v43.hidden.BottomRight = v45;
            elseif v44 == "TopRight" then
                v43.hidden.TopLeft = Vector2.new(v43.hidden.Left, v45.Y);
                v43.hidden.BottomRight = Vector2.new(v45.X, v43.hidden.Bottom);
            elseif v44 == "BottomLeft" then
                v43.hidden.TopLeft = Vector2.new(v45.X, v43.hidden.Top);
                v43.hidden.BottomRight = Vector2.new(v43.hidden.Right, v45.Y);
            elseif v44 == "Top" then
                v43.hidden.TopLeft = Vector2.new(v43.hidden.Left, v45);
            elseif v44 == "Bottom" then
                v43.hidden.BottomRight = Vector2.new(v43.hidden.Right, v45);
            elseif v44 == "Left" then
                v43.hidden.TopLeft = Vector2.new(v45, v43.hidden.Top);
            elseif v44 == "Right" then
                v43.hidden.BottomRight = Vector2.new(v45, v43.hidden.Bottom);
            end;
            v5(v43);
        end;
        v38.mt.__newindex = v42;
        setmetatable(v38, v38.mt);
        return v38;
    end, 
    translate = function(_, v47, v48) --[[ Line: 235 ]] --[[ Name: translate ]]
        -- upvalues: v2 (copy)
        local v49 = v2:cloneTable(v47);
        translate(v49, v48);
        return v49;
    end, 
    resize = function(_, v51, v52) --[[ Line: 242 ]] --[[ Name: resize ]]
        -- upvalues: v2 (copy)
        local v53 = v2:cloneTable(v51);
        resize(v51, v52);
        return v53;
    end, 
    expandFromCenter = function(_, v55, v56) --[[ Line: 249 ]] --[[ Name: expandFromCenter ]]
        -- upvalues: v2 (copy)
        local v57 = v2:cloneTable(v55);
        expandFromCenter(v55, v56);
        return v57;
    end
};
v58.getExtentsFromGui = function(_, v60) --[[ Line: 256 ]] --[[ Name: getExtentsFromGui ]]
    -- upvalues: v58 (copy), v30 (copy)
    local v61 = v58.new(Vector2.new(0, 0));
    v30(v61, v60.AbsolutePosition, v60.AbsolutePosition + v60.AbsoluteSize);
    return v61;
end;
v58.getExtentsFromGuis = function(_, v63) --[[ Line: 264 ]] --[[ Name: getExtentsFromGuis ]]
    -- upvalues: v58 (copy), v30 (copy), v27 (copy)
    if #v63 == 0 then
        return nil;
    else
        local v64 = v58.new(Vector2.new(0, 0));
        v30(v64, v63[1].AbsolutePosition, v63[1].AbsolutePosition + v63[1].AbsoluteSize);
        for v65 = 2, #v63 do
            v27(v64, v63[v65].AbsolutePosition, v63[v65].AbsolutePosition + v63[v65].AbsoluteSize);
        end;
        return v64;
    end;
end;
return v58;