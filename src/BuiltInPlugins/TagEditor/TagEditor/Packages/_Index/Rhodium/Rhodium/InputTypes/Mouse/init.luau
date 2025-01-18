local v0 = require(script.Parent.Parent.VirtualInputUtils);
local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
local v2 = require(script.Parent.Parent.InputVisualizer):new();
local v19 = {
    sendMouseButtonEvent = function(v3, v4, v5, v6, v7) --[[ Line: 8 ]] --[[ Name: sendMouseButtonEvent ]]
        -- upvalues: v0 (copy), l_VirtualInputManager_0 (copy)
        local v8, v9 = v0.__handleGuiInset(v3, v4);
        l_VirtualInputManager_0:SendMouseButtonEvent(v8, v9, v5, v6, v0.getCurrentWindow(), v7 or 0);
    end, 
    SendMouseMoveEvent = function(v10, v11) --[[ Line: 13 ]] --[[ Name: SendMouseMoveEvent ]]
        -- upvalues: v0 (copy), l_VirtualInputManager_0 (copy)
        local v12, v13 = v0.__handleGuiInset(v10, v11);
        l_VirtualInputManager_0:SendMouseMoveEvent(v12, v13, v0.getCurrentWindow());
    end, 
    SendMouseWheelEvent = function(v14, v15, v16) --[[ Line: 18 ]] --[[ Name: SendMouseWheelEvent ]]
        -- upvalues: v0 (copy), l_VirtualInputManager_0 (copy)
        local v17, v18 = v0.__handleGuiInset(v14, v15);
        l_VirtualInputManager_0:SendMouseWheelEvent(v17, v18, v16, v0.getCurrentWindow());
    end
};
v19.mouseWheel = function(v20, v21) --[[ Line: 23 ]] --[[ Name: mouseWheel ]]
    -- upvalues: v19 (copy)
    local v22 = false;
    if v21 < 0 then
        v22 = true;
        v21 = -v21;
    end;
    for _ = 1, v21 do
        v19.SendMouseWheelEvent(v20.x, v20.y, v22);
    end;
end;
local function _(v24, v25, v26) --[[ Line: 34 ]] --[[ Name: click ]]
    -- upvalues: v2 (copy), v0 (copy), v19 (copy)
    v2:click(v24, v0.getCurrentWindow());
    v19.sendMouseButtonEvent(v24.x, v24.y, v26, true, v25);
    v19.sendMouseButtonEvent(v24.x, v24.y, v26, false, v25);
end;
local function _(v28, v29, v30) --[[ Line: 40 ]] --[[ Name: multiClick ]]
    -- upvalues: v2 (copy), v0 (copy), v19 (copy)
    local v31 = true;
    local v32 = 0;
    return function() --[[ Line: 43 ]]
        -- upvalues: v31 (ref), v29 (ref), v28 (copy), v32 (ref), v30 (copy), v2 (ref), v0 (ref), v19 (ref)
        if v31 then
            v31 = false;
            return false;
        elseif v29 >= 1 then
            local l_v28_0 = v28;
            local l_v32_0 = v32;
            local l_v30_0 = v30;
            v2:click(l_v28_0, v0.getCurrentWindow());
            v19.sendMouseButtonEvent(l_v28_0.x, l_v28_0.y, l_v30_0, true, l_v32_0);
            v19.sendMouseButtonEvent(l_v28_0.x, l_v28_0.y, l_v30_0, false, l_v32_0);
            v29 = v29 - 1;
            v32 = v32 + 1;
            v31 = true;
            return false;
        elseif v29 == 0 then
            return true;
        else
            return;
        end;
    end;
end;
v19.click = function(v37) --[[ Line: 59 ]] --[[ Name: click ]]
    -- upvalues: v0 (copy), v2 (copy), v19 (copy)
    local l___syncRun_0 = v0.__syncRun;
    local v39 = 1;
    local v40 = true;
    local v41 = 0;
    local v42 = 0;
    local v43;
    do
        local l_v39_0, l_v40_0, l_v41_0 = v39, v40, v41;
        v43 = function() --[[ Line: 43 ]]
            -- upvalues: l_v40_0 (ref), l_v39_0 (ref), v37 (copy), l_v41_0 (ref), v42 (copy), v2 (ref), v0 (ref), v19 (ref)
            if l_v40_0 then
                l_v40_0 = false;
                return false;
            elseif l_v39_0 >= 1 then
                local l_v37_0 = v37;
                local l_l_v41_0_0 = l_v41_0;
                local l_v42_0 = v42;
                v2:click(l_v37_0, v0.getCurrentWindow());
                v19.sendMouseButtonEvent(l_v37_0.x, l_v37_0.y, l_v42_0, true, l_l_v41_0_0);
                v19.sendMouseButtonEvent(l_v37_0.x, l_v37_0.y, l_v42_0, false, l_l_v41_0_0);
                l_v39_0 = l_v39_0 - 1;
                l_v41_0 = l_v41_0 + 1;
                l_v40_0 = true;
                return false;
            elseif l_v39_0 == 0 then
                return true;
            else
                return;
            end;
        end;
    end;
    l___syncRun_0(v43);
end;
v19.multiClick = function(v50, v51) --[[ Line: 63 ]] --[[ Name: multiClick ]]
    -- upvalues: v0 (copy), v2 (copy), v19 (copy)
    local l___syncRun_1 = v0.__syncRun;
    local l_v51_0 = v51;
    local v54 = true;
    local v55 = 0;
    local v56 = 0;
    local v57;
    do
        local l_l_v51_0_0, l_v54_0, l_v55_0 = l_v51_0, v54, v55;
        v57 = function() --[[ Line: 43 ]]
            -- upvalues: l_v54_0 (ref), l_l_v51_0_0 (ref), v50 (copy), l_v55_0 (ref), v56 (copy), v2 (ref), v0 (ref), v19 (ref)
            if l_v54_0 then
                l_v54_0 = false;
                return false;
            elseif l_l_v51_0_0 >= 1 then
                local l_v50_0 = v50;
                local l_l_v55_0_0 = l_v55_0;
                local l_v56_0 = v56;
                v2:click(l_v50_0, v0.getCurrentWindow());
                v19.sendMouseButtonEvent(l_v50_0.x, l_v50_0.y, l_v56_0, true, l_l_v55_0_0);
                v19.sendMouseButtonEvent(l_v50_0.x, l_v50_0.y, l_v56_0, false, l_l_v55_0_0);
                l_l_v51_0_0 = l_l_v51_0_0 - 1;
                l_v55_0 = l_v55_0 + 1;
                l_v54_0 = true;
                return false;
            elseif l_l_v51_0_0 == 0 then
                return true;
            else
                return;
            end;
        end;
    end;
    l___syncRun_1(v57);
end;
v19.rightClick = function(v64) --[[ Line: 67 ]] --[[ Name: rightClick ]]
    -- upvalues: v0 (copy), v2 (copy), v19 (copy)
    local l___syncRun_2 = v0.__syncRun;
    local v66 = 1;
    local v67 = true;
    local v68 = 0;
    local v69 = 1;
    local v70;
    do
        local l_v66_0, l_v67_0, l_v68_0 = v66, v67, v68;
        v70 = function() --[[ Line: 43 ]]
            -- upvalues: l_v67_0 (ref), l_v66_0 (ref), v64 (copy), l_v68_0 (ref), v69 (copy), v2 (ref), v0 (ref), v19 (ref)
            if l_v67_0 then
                l_v67_0 = false;
                return false;
            elseif l_v66_0 >= 1 then
                local l_v64_0 = v64;
                local l_l_v68_0_0 = l_v68_0;
                local l_v69_0 = v69;
                v2:click(l_v64_0, v0.getCurrentWindow());
                v19.sendMouseButtonEvent(l_v64_0.x, l_v64_0.y, l_v69_0, true, l_l_v68_0_0);
                v19.sendMouseButtonEvent(l_v64_0.x, l_v64_0.y, l_v69_0, false, l_l_v68_0_0);
                l_v66_0 = l_v66_0 - 1;
                l_v68_0 = l_v68_0 + 1;
                l_v67_0 = true;
                return false;
            elseif l_v66_0 == 0 then
                return true;
            else
                return;
            end;
        end;
    end;
    l___syncRun_2(v70);
end;
v19.mouseLeftDown = function(v77) --[[ Line: 71 ]] --[[ Name: mouseLeftDown ]]
    -- upvalues: v19 (copy)
    v19.sendMouseButtonEvent(v77.x, v77.y, 0, true);
end;
v19.mouseLeftUp = function(v78) --[[ Line: 75 ]] --[[ Name: mouseLeftUp ]]
    -- upvalues: v19 (copy)
    v19.sendMouseButtonEvent(v78.x, v78.y, 0, false);
end;
v19.mouseRightDown = function(v79) --[[ Line: 79 ]] --[[ Name: mouseRightDown ]]
    -- upvalues: v19 (copy)
    v19.sendMouseButtonEvent(v79.x, v79.y, 1, true);
end;
v19.mouseRightUp = function(v80) --[[ Line: 83 ]] --[[ Name: mouseRightUp ]]
    -- upvalues: v19 (copy)
    v19.sendMouseButtonEvent(v80.x, v80.y, 1, false);
end;
v19.mouseMove = function(v81) --[[ Line: 87 ]] --[[ Name: mouseMove ]]
    -- upvalues: v19 (copy)
    v19.SendMouseMoveEvent(v81.X, v81.Y);
end;
local function _(v82, v83, v84) --[[ Line: 91 ]] --[[ Name: drag ]]
    -- upvalues: v19 (copy)
    local v85 = 0;
    local v86 = false;
    return function(v87) --[[ Line: 94 ]]
        -- upvalues: v86 (ref), v19 (ref), v82 (copy), v85 (ref), v84 (copy), v83 (copy)
        if not v86 then
            v19.mouseLeftDown(v82);
            v86 = true;
        else
            v85 = v85 + v87;
            if v84 and v85 < v84 then
                local v88 = v85 / v84;
                local v89 = (v83 - v82) * v88 + v82;
                v19.mouseMove(v89);
            else
                v19.mouseMove(v83);
                v19.mouseLeftUp(v83);
                return true;
            end;
        end;
        return false;
    end;
end;
v19.mouseDrag = function(v91, v92, v93) --[[ Line: 114 ]] --[[ Name: mouseDrag ]]
    -- upvalues: v0 (copy), v19 (copy)
    local l___syncRun_3 = v0.__syncRun;
    local v95 = 0;
    local v96 = false;
    local v97;
    do
        local l_v95_0, l_v96_0 = v95, v96;
        v97 = function(v100) --[[ Line: 94 ]]
            -- upvalues: l_v96_0 (ref), v19 (ref), v91 (copy), l_v95_0 (ref), v93 (copy), v92 (copy)
            if not l_v96_0 then
                v19.mouseLeftDown(v91);
                l_v96_0 = true;
            else
                l_v95_0 = l_v95_0 + v100;
                if v93 and l_v95_0 < v93 then
                    local v101 = l_v95_0 / v93;
                    local v102 = (v92 - v91) * v101 + v91;
                    v19.mouseMove(v102);
                else
                    v19.mouseMove(v92);
                    v19.mouseLeftUp(v92);
                    return true;
                end;
            end;
            return false;
        end;
    end;
    l___syncRun_3(v97);
end;
return v19;