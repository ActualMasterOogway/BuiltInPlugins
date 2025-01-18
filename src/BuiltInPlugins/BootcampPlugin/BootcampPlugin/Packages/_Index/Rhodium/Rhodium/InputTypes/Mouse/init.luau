local v0 = require(script.Parent.Parent.VirtualInputUtils);
local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
local v2 = require(script.Parent.Parent.InputVisualizer).new();
local v22 = {
    sendMouseButtonEvent = function(v3, v4, v5, v6, v7) --[[ Line: 11 ]] --[[ Name: sendMouseButtonEvent ]]
        -- upvalues: v0 (copy), l_VirtualInputManager_0 (copy)
        local v8, v9 = v0.__handleGuiInset(v3, v4);
        local v10 = v0.getCurrentWindow();
        l_VirtualInputManager_0:SendMouseButtonEvent(v8, v9, v5, v6, v10, v7 or 0);
    end, 
    SendMouseMoveEvent = function(v11, v12) --[[ Line: 19 ]] --[[ Name: SendMouseMoveEvent ]]
        -- upvalues: v0 (copy), l_VirtualInputManager_0 (copy)
        local v13, v14 = v0.__handleGuiInset(v11, v12);
        local v15 = v0.getCurrentWindow();
        l_VirtualInputManager_0:SendMouseMoveEvent(v13, v14, v15);
    end, 
    SendMouseWheelEvent = function(v16, v17, v18) --[[ Line: 27 ]] --[[ Name: SendMouseWheelEvent ]]
        -- upvalues: v0 (copy), l_VirtualInputManager_0 (copy)
        local v19, v20 = v0.__handleGuiInset(v16, v17);
        local v21 = v0.getCurrentWindow();
        l_VirtualInputManager_0:SendMouseWheelEvent(v19, v20, v18, v21);
    end
};
v22.mouseWheel = function(v23, v24) --[[ Line: 35 ]] --[[ Name: mouseWheel ]]
    -- upvalues: v22 (copy)
    local v25 = false;
    if v24 < 0 then
        v25 = true;
        v24 = -v24;
    end;
    for _ = 1, v24 do
        v22.SendMouseWheelEvent(v23.X, v23.Y, v25);
    end;
end;
local function v30(v27, v28, v29) --[[ Line: 46 ]] --[[ Name: click ]]
    -- upvalues: v2 (copy), v0 (copy), v22 (copy)
    v2:click(v27, v0.getCurrentWindow());
    v22.sendMouseButtonEvent(v27.X, v27.Y, v29, true, v28);
    v0.waitForInputEventsProcessed();
    v22.sendMouseButtonEvent(v27.X, v27.Y, v29, false, v28);
    v0.waitForInputEventsProcessed();
end;
local function _(v31, v32, v33) --[[ Line: 54 ]] --[[ Name: multiClick ]]
    -- upvalues: v30 (copy)
    local v34 = true;
    local v35 = 0;
    return function() --[[ Line: 58 ]]
        -- upvalues: v34 (ref), v32 (ref), v30 (ref), v31 (copy), v35 (ref), v33 (copy)
        if v34 then
            v34 = false;
            return false;
        elseif v32 >= 1 then
            v30(v31, v35, v33);
            v32 = v32 - 1;
            v35 = v35 + 1;
            v34 = true;
            return false;
        elseif v32 == 0 then
            return true;
        else
            return false;
        end;
    end;
end;
v22.click = function(v37) --[[ Line: 76 ]] --[[ Name: click ]]
    -- upvalues: v0 (copy), v30 (copy)
    local l___syncRun_0 = v0.__syncRun;
    local v39 = 1;
    local v40 = true;
    local v41 = 0;
    local v42 = 0;
    local v43;
    do
        local l_v39_0, l_v40_0, l_v41_0 = v39, v40, v41;
        v43 = function() --[[ Line: 58 ]]
            -- upvalues: l_v40_0 (ref), l_v39_0 (ref), v30 (ref), v37 (copy), l_v41_0 (ref), v42 (copy)
            if l_v40_0 then
                l_v40_0 = false;
                return false;
            elseif l_v39_0 >= 1 then
                v30(v37, l_v41_0, v42);
                l_v39_0 = l_v39_0 - 1;
                l_v41_0 = l_v41_0 + 1;
                l_v40_0 = true;
                return false;
            elseif l_v39_0 == 0 then
                return true;
            else
                return false;
            end;
        end;
    end;
    l___syncRun_0(v43);
end;
v22.multiClick = function(v47, v48) --[[ Line: 80 ]] --[[ Name: multiClick ]]
    -- upvalues: v0 (copy), v30 (copy)
    local l___syncRun_1 = v0.__syncRun;
    local l_v48_0 = v48;
    local v51 = true;
    local v52 = 0;
    local v53 = 0;
    local v54;
    do
        local l_l_v48_0_0, l_v51_0, l_v52_0 = l_v48_0, v51, v52;
        v54 = function() --[[ Line: 58 ]]
            -- upvalues: l_v51_0 (ref), l_l_v48_0_0 (ref), v30 (ref), v47 (copy), l_v52_0 (ref), v53 (copy)
            if l_v51_0 then
                l_v51_0 = false;
                return false;
            elseif l_l_v48_0_0 >= 1 then
                v30(v47, l_v52_0, v53);
                l_l_v48_0_0 = l_l_v48_0_0 - 1;
                l_v52_0 = l_v52_0 + 1;
                l_v51_0 = true;
                return false;
            elseif l_l_v48_0_0 == 0 then
                return true;
            else
                return false;
            end;
        end;
    end;
    l___syncRun_1(v54);
end;
v22.rightClick = function(v58) --[[ Line: 84 ]] --[[ Name: rightClick ]]
    -- upvalues: v0 (copy), v30 (copy)
    local l___syncRun_2 = v0.__syncRun;
    local v60 = 1;
    local v61 = true;
    local v62 = 0;
    local v63 = 1;
    local v64;
    do
        local l_v60_0, l_v61_0, l_v62_0 = v60, v61, v62;
        v64 = function() --[[ Line: 58 ]]
            -- upvalues: l_v61_0 (ref), l_v60_0 (ref), v30 (ref), v58 (copy), l_v62_0 (ref), v63 (copy)
            if l_v61_0 then
                l_v61_0 = false;
                return false;
            elseif l_v60_0 >= 1 then
                v30(v58, l_v62_0, v63);
                l_v60_0 = l_v60_0 - 1;
                l_v62_0 = l_v62_0 + 1;
                l_v61_0 = true;
                return false;
            elseif l_v60_0 == 0 then
                return true;
            else
                return false;
            end;
        end;
    end;
    l___syncRun_2(v64);
end;
v22.mouseLeftDown = function(v68) --[[ Line: 88 ]] --[[ Name: mouseLeftDown ]]
    -- upvalues: v22 (copy)
    v22.sendMouseButtonEvent(v68.X, v68.Y, 0, true);
end;
v22.mouseLeftUp = function(v69) --[[ Line: 92 ]] --[[ Name: mouseLeftUp ]]
    -- upvalues: v22 (copy)
    v22.sendMouseButtonEvent(v69.X, v69.Y, 0, false);
end;
v22.mouseRightDown = function(v70) --[[ Line: 96 ]] --[[ Name: mouseRightDown ]]
    -- upvalues: v22 (copy)
    v22.sendMouseButtonEvent(v70.X, v70.Y, 1, true);
end;
v22.mouseRightUp = function(v71) --[[ Line: 100 ]] --[[ Name: mouseRightUp ]]
    -- upvalues: v22 (copy)
    v22.sendMouseButtonEvent(v71.X, v71.Y, 1, false);
end;
v22.mouseMove = function(v72) --[[ Line: 104 ]] --[[ Name: mouseMove ]]
    -- upvalues: v22 (copy)
    v22.SendMouseMoveEvent(v72.X, v72.Y);
end;
local function _(v73, v74, v75) --[[ Line: 108 ]] --[[ Name: drag ]]
    -- upvalues: v22 (copy)
    local v76 = 0;
    local v77 = false;
    return function(v78) --[[ Line: 111 ]]
        -- upvalues: v77 (ref), v22 (ref), v73 (copy), v76 (ref), v75 (copy), v74 (copy)
        if not v77 then
            v22.mouseLeftDown(v73);
            v77 = true;
        else
            v76 = v76 + v78;
            if v75 and v76 < v75 then
                local v79 = v76 / v75;
                local v80 = (v74 - v73) * v79 + v73;
                v22.mouseMove(v80);
            else
                v22.mouseMove(v74);
                v22.mouseLeftUp(v74);
                return true;
            end;
        end;
        return false;
    end;
end;
v22.mouseDrag = function(v82, v83, v84) --[[ Line: 131 ]] --[[ Name: mouseDrag ]]
    -- upvalues: v0 (copy), v22 (copy)
    local l___syncRun_3 = v0.__syncRun;
    local v86 = 0;
    local v87 = false;
    local v88;
    do
        local l_v86_0, l_v87_0 = v86, v87;
        v88 = function(v91) --[[ Line: 111 ]]
            -- upvalues: l_v87_0 (ref), v22 (ref), v82 (copy), l_v86_0 (ref), v84 (copy), v83 (copy)
            if not l_v87_0 then
                v22.mouseLeftDown(v82);
                l_v87_0 = true;
            else
                l_v86_0 = l_v86_0 + v91;
                if v84 and l_v86_0 < v84 then
                    local v92 = l_v86_0 / v84;
                    local v93 = (v83 - v82) * v92 + v82;
                    v22.mouseMove(v93);
                else
                    v22.mouseMove(v83);
                    v22.mouseLeftUp(v83);
                    return true;
                end;
            end;
            return false;
        end;
    end;
    l___syncRun_3(v88);
end;
return v22;