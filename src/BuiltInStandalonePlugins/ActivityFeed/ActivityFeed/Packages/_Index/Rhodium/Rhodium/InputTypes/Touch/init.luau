local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Rhodium");
local v2 = require(l_script_FirstAncestor_0.VirtualInputUtils);
local v9 = {
    SendTouchEvent = function(v3, v4, v5, v6) --[[ Line: 10 ]] --[[ Name: SendTouchEvent ]]
        -- upvalues: v2 (copy), l_VirtualInputManager_0 (copy)
        local v7, v8 = v2.__handleGuiInset(v5, v6);
        l_VirtualInputManager_0:SendTouchEvent(v3, v4, v7, v8);
    end
};
v9.touchStart = function(v10, v11) --[[ Line: 15 ]] --[[ Name: touchStart ]]
    -- upvalues: v9 (copy)
    local v12 = 123456 + (v11 or 0);
    v9.SendTouchEvent(v12, 0, v10.X, v10.Y);
end;
v9.touchMove = function(v13, v14) --[[ Line: 20 ]] --[[ Name: touchMove ]]
    -- upvalues: v9 (copy)
    local v15 = 123456 + (v14 or 0);
    v9.SendTouchEvent(v15, 1, v13.X, v13.Y);
end;
v9.touchStop = function(v16, v17) --[[ Line: 25 ]] --[[ Name: touchStop ]]
    -- upvalues: v9 (copy)
    local v18 = 123456 + (v17 or 0);
    v9.SendTouchEvent(v18, 2, v16.X, v16.Y);
end;
local function _(v19, v20, v21, v22) --[[ Line: 30 ]] --[[ Name: smoothSwipe ]]
    -- upvalues: v9 (copy)
    local v23 = 0;
    local v24 = false;
    local v25 = 123456 + (v22 or 0);
    return function(v26) --[[ Line: 34 ]]
        -- upvalues: v24 (ref), v9 (ref), v19 (copy), v25 (copy), v23 (ref), v21 (copy), v20 (copy)
        if not v24 then
            v9.touchStart(v19, v25);
            v24 = true;
        else
            v23 = v23 + v26;
            if v21 and v23 < v21 then
                local v27 = v23 / v21;
                local v28 = (v20 - v19) * v27 + v19;
                v9.touchMove(v28, v25);
            else
                v9.touchMove(v20, v25);
                v9.touchStop(v20, v25);
                return true;
            end;
        end;
        return false;
    end;
end;
v9.swipe = function(v30, v31, v32, v33, v34) --[[ Line: 54 ]] --[[ Name: swipe ]]
    -- upvalues: v2 (copy), v9 (copy)
    local v35 = 123456 + (v34 or 0);
    if v33 == true then
        local l___asyncRun_0 = v2.__asyncRun;
        local v37 = 0;
        local v38 = false;
        local v39 = 123456 + (v35 or 0);
        local v40;
        do
            local l_v37_0, l_v38_0 = v37, v38;
            v40 = function(v43) --[[ Line: 34 ]]
                -- upvalues: l_v38_0 (ref), v9 (ref), v30 (copy), v39 (copy), l_v37_0 (ref), v32 (copy), v31 (copy)
                if not l_v38_0 then
                    v9.touchStart(v30, v39);
                    l_v38_0 = true;
                else
                    l_v37_0 = l_v37_0 + v43;
                    if v32 and l_v37_0 < v32 then
                        local v44 = l_v37_0 / v32;
                        local v45 = (v31 - v30) * v44 + v30;
                        v9.touchMove(v45, v39);
                    else
                        v9.touchMove(v31, v39);
                        v9.touchStop(v31, v39);
                        return true;
                    end;
                end;
                return false;
            end;
        end;
        l___asyncRun_0(v40);
        return;
    else
        local l___syncRun_0 = v2.__syncRun;
        local v47 = 0;
        local v48 = false;
        local v49 = 123456 + (v35 or 0);
        local v50;
        do
            local l_v47_0, l_v48_0 = v47, v48;
            v50 = function(v53) --[[ Line: 34 ]]
                -- upvalues: l_v48_0 (ref), v9 (ref), v30 (copy), v49 (copy), l_v47_0 (ref), v32 (copy), v31 (copy)
                if not l_v48_0 then
                    v9.touchStart(v30, v49);
                    l_v48_0 = true;
                else
                    l_v47_0 = l_v47_0 + v53;
                    if v32 and l_v47_0 < v32 then
                        local v54 = l_v47_0 / v32;
                        local v55 = (v31 - v30) * v54 + v30;
                        v9.touchMove(v55, v49);
                    else
                        v9.touchMove(v31, v49);
                        v9.touchStop(v31, v49);
                        return true;
                    end;
                end;
                return false;
            end;
        end;
        l___syncRun_0(v50);
        return;
    end;
end;
v9.touchScroll = function(v56, v57, v58, v59, v60, v61) --[[ Line: 63 ]] --[[ Name: touchScroll ]]
    -- upvalues: v9 (copy)
    local v62 = v56 + Vector2.new(v57, v58);
    v9.swipe(v56, v62, v59, v60, v61);
end;
v9.tap = function(v63) --[[ Line: 75 ]] --[[ Name: tap ]]
    -- upvalues: v9 (copy), v2 (copy)
    v9.touchStart(v63);
    v9.touchStop(v63);
    v2.waitForInputEventsProcessed();
end;
return v9;