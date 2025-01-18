local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Rhodium");
local v2 = require(l_script_FirstAncestor_0.VirtualInputUtils);
local v3 = require(l_script_FirstAncestor_0.InputVisualizer).new();
local v23 = {
    sendMouseButtonEvent = function(v4, v5, v6, v7, v8) --[[ Line: 12 ]] --[[ Name: sendMouseButtonEvent ]]
        -- upvalues: v2 (copy), l_VirtualInputManager_0 (copy)
        local v9, v10 = v2.__handleGuiInset(v4, v5);
        local v11 = v2.getCurrentWindow();
        l_VirtualInputManager_0:SendMouseButtonEvent(v9, v10, v6, v7, v11, v8 or 0);
    end, 
    SendMouseMoveEvent = function(v12, v13) --[[ Line: 20 ]] --[[ Name: SendMouseMoveEvent ]]
        -- upvalues: v2 (copy), l_VirtualInputManager_0 (copy)
        local v14, v15 = v2.__handleGuiInset(v12, v13);
        local v16 = v2.getCurrentWindow();
        l_VirtualInputManager_0:SendMouseMoveEvent(v14, v15, v16);
    end, 
    SendMouseWheelEvent = function(v17, v18, v19) --[[ Line: 28 ]] --[[ Name: SendMouseWheelEvent ]]
        -- upvalues: v2 (copy), l_VirtualInputManager_0 (copy)
        local v20, v21 = v2.__handleGuiInset(v17, v18);
        local v22 = v2.getCurrentWindow();
        l_VirtualInputManager_0:SendMouseWheelEvent(v20, v21, v19, v22);
    end
};
v23.mouseWheel = function(v24, v25) --[[ Line: 36 ]] --[[ Name: mouseWheel ]]
    -- upvalues: v23 (copy)
    local v26 = false;
    if v25 < 0 then
        v26 = true;
        v25 = -v25;
    end;
    for _ = 1, v25 do
        v23.SendMouseWheelEvent(v24.X, v24.Y, v26);
    end;
end;
local function v31(v28, v29, v30) --[[ Line: 47 ]] --[[ Name: click ]]
    -- upvalues: v3 (copy), v2 (copy), v23 (copy)
    v3:click(v28, v2.getCurrentWindow());
    v23.sendMouseButtonEvent(v28.X, v28.Y, v30, true, v29);
    v23.sendMouseButtonEvent(v28.X, v28.Y, v30, false, v29);
    v2.waitForInputEventsProcessed();
end;
local function _(v32, v33, v34) --[[ Line: 54 ]] --[[ Name: multiClick ]]
    -- upvalues: v31 (copy)
    local v35 = true;
    local v36 = 0;
    return function() --[[ Line: 58 ]]
        -- upvalues: v35 (ref), v33 (ref), v31 (ref), v32 (copy), v36 (ref), v34 (copy)
        if v35 then
            v35 = false;
            return false;
        elseif v33 >= 1 then
            v31(v32, v36, v34);
            v33 = v33 - 1;
            v36 = v36 + 1;
            v35 = true;
            return false;
        elseif v33 == 0 then
            return true;
        else
            return false;
        end;
    end;
end;
v23.click = function(v38) --[[ Line: 76 ]] --[[ Name: click ]]
    -- upvalues: v2 (copy), v31 (copy)
    local l___syncRun_0 = v2.__syncRun;
    local v40 = 1;
    local v41 = true;
    local v42 = 0;
    local v43 = 0;
    local v44;
    do
        local l_v40_0, l_v41_0, l_v42_0 = v40, v41, v42;
        v44 = function() --[[ Line: 58 ]]
            -- upvalues: l_v41_0 (ref), l_v40_0 (ref), v31 (ref), v38 (copy), l_v42_0 (ref), v43 (copy)
            if l_v41_0 then
                l_v41_0 = false;
                return false;
            elseif l_v40_0 >= 1 then
                v31(v38, l_v42_0, v43);
                l_v40_0 = l_v40_0 - 1;
                l_v42_0 = l_v42_0 + 1;
                l_v41_0 = true;
                return false;
            elseif l_v40_0 == 0 then
                return true;
            else
                return false;
            end;
        end;
    end;
    l___syncRun_0(v44);
end;
v23.multiClick = function(v48, v49) --[[ Line: 80 ]] --[[ Name: multiClick ]]
    -- upvalues: v2 (copy), v31 (copy)
    local l___syncRun_1 = v2.__syncRun;
    local l_v49_0 = v49;
    local v52 = true;
    local v53 = 0;
    local v54 = 0;
    local v55;
    do
        local l_l_v49_0_0, l_v52_0, l_v53_0 = l_v49_0, v52, v53;
        v55 = function() --[[ Line: 58 ]]
            -- upvalues: l_v52_0 (ref), l_l_v49_0_0 (ref), v31 (ref), v48 (copy), l_v53_0 (ref), v54 (copy)
            if l_v52_0 then
                l_v52_0 = false;
                return false;
            elseif l_l_v49_0_0 >= 1 then
                v31(v48, l_v53_0, v54);
                l_l_v49_0_0 = l_l_v49_0_0 - 1;
                l_v53_0 = l_v53_0 + 1;
                l_v52_0 = true;
                return false;
            elseif l_l_v49_0_0 == 0 then
                return true;
            else
                return false;
            end;
        end;
    end;
    l___syncRun_1(v55);
end;
v23.rightClick = function(v59) --[[ Line: 84 ]] --[[ Name: rightClick ]]
    -- upvalues: v2 (copy), v31 (copy)
    local l___syncRun_2 = v2.__syncRun;
    local v61 = 1;
    local v62 = true;
    local v63 = 0;
    local v64 = 1;
    local v65;
    do
        local l_v61_0, l_v62_0, l_v63_0 = v61, v62, v63;
        v65 = function() --[[ Line: 58 ]]
            -- upvalues: l_v62_0 (ref), l_v61_0 (ref), v31 (ref), v59 (copy), l_v63_0 (ref), v64 (copy)
            if l_v62_0 then
                l_v62_0 = false;
                return false;
            elseif l_v61_0 >= 1 then
                v31(v59, l_v63_0, v64);
                l_v61_0 = l_v61_0 - 1;
                l_v63_0 = l_v63_0 + 1;
                l_v62_0 = true;
                return false;
            elseif l_v61_0 == 0 then
                return true;
            else
                return false;
            end;
        end;
    end;
    l___syncRun_2(v65);
end;
v23.mouseLeftDown = function(v69) --[[ Line: 88 ]] --[[ Name: mouseLeftDown ]]
    -- upvalues: v23 (copy)
    v23.sendMouseButtonEvent(v69.X, v69.Y, 0, true);
end;
v23.mouseLeftUp = function(v70) --[[ Line: 92 ]] --[[ Name: mouseLeftUp ]]
    -- upvalues: v23 (copy)
    v23.sendMouseButtonEvent(v70.X, v70.Y, 0, false);
end;
v23.mouseRightDown = function(v71) --[[ Line: 96 ]] --[[ Name: mouseRightDown ]]
    -- upvalues: v23 (copy)
    v23.sendMouseButtonEvent(v71.X, v71.Y, 1, true);
end;
v23.mouseRightUp = function(v72) --[[ Line: 100 ]] --[[ Name: mouseRightUp ]]
    -- upvalues: v23 (copy)
    v23.sendMouseButtonEvent(v72.X, v72.Y, 1, false);
end;
v23.mouseMove = function(v73) --[[ Line: 104 ]] --[[ Name: mouseMove ]]
    -- upvalues: v23 (copy)
    v23.SendMouseMoveEvent(v73.X, v73.Y);
end;
local function _(v74, v75, v76) --[[ Line: 108 ]] --[[ Name: drag ]]
    -- upvalues: v23 (copy)
    local v77 = 0;
    local v78 = false;
    return function(v79) --[[ Line: 111 ]]
        -- upvalues: v78 (ref), v23 (ref), v74 (copy), v77 (ref), v76 (copy), v75 (copy)
        if not v78 then
            v23.mouseLeftDown(v74);
            v78 = true;
        else
            v77 = v77 + v79;
            if v76 and v77 < v76 then
                local v80 = v77 / v76;
                local v81 = (v75 - v74) * v80 + v74;
                v23.mouseMove(v81);
            else
                v23.mouseMove(v75);
                v23.mouseLeftUp(v75);
                return true;
            end;
        end;
        return false;
    end;
end;
v23.mouseDrag = function(v83, v84, v85) --[[ Line: 131 ]] --[[ Name: mouseDrag ]]
    -- upvalues: v2 (copy), v23 (copy)
    local l___syncRun_3 = v2.__syncRun;
    local v87 = 0;
    local v88 = false;
    local v89;
    do
        local l_v87_0, l_v88_0 = v87, v88;
        v89 = function(v92) --[[ Line: 111 ]]
            -- upvalues: l_v88_0 (ref), v23 (ref), v83 (copy), l_v87_0 (ref), v85 (copy), v84 (copy)
            if not l_v88_0 then
                v23.mouseLeftDown(v83);
                l_v88_0 = true;
            else
                l_v87_0 = l_v87_0 + v92;
                if v85 and l_v87_0 < v85 then
                    local v93 = l_v87_0 / v85;
                    local v94 = (v84 - v83) * v93 + v83;
                    v23.mouseMove(v94);
                else
                    v23.mouseMove(v84);
                    v23.mouseLeftUp(v84);
                    return true;
                end;
            end;
            return false;
        end;
    end;
    l___syncRun_3(v89);
end;
v23.__setInputVisualizerEnabled = function(v95) --[[ Line: 135 ]] --[[ Name: __setInputVisualizerEnabled ]]
    -- upvalues: v3 (copy)
    if v95 then
        v3:enable();
        return;
    else
        v3:disable();
        return;
    end;
end;
return v23;