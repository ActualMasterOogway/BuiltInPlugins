local v0 = require(script.Parent.Parent.VirtualInputUtils);
local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
local v8 = {
    SendTouchEvent = function(v2, v3, v4, v5) --[[ Line: 9 ]] --[[ Name: SendTouchEvent ]]
        -- upvalues: v0 (copy), l_VirtualInputManager_0 (copy)
        local v6, v7 = v0.__handleGuiInset(v4, v5);
        l_VirtualInputManager_0:SendTouchEvent(v2, v3, v6, v7);
    end
};
v8.touchStart = function(v9, v10) --[[ Line: 14 ]] --[[ Name: touchStart ]]
    -- upvalues: v8 (copy)
    local v11 = 123456 + (v10 or 0);
    v8.SendTouchEvent(v11, 0, v9.X, v9.Y);
end;
v8.touchMove = function(v12, v13) --[[ Line: 19 ]] --[[ Name: touchMove ]]
    -- upvalues: v8 (copy)
    local v14 = 123456 + (v13 or 0);
    v8.SendTouchEvent(v14, 1, v12.X, v12.Y);
end;
v8.touchStop = function(v15, v16) --[[ Line: 24 ]] --[[ Name: touchStop ]]
    -- upvalues: v8 (copy)
    local v17 = 123456 + (v16 or 0);
    v8.SendTouchEvent(v17, 2, v15.X, v15.Y);
end;
local function _(v18, v19, v20, v21) --[[ Line: 29 ]] --[[ Name: smoothSwipe ]]
    -- upvalues: v8 (copy)
    local v22 = 0;
    local v23 = false;
    local v24 = 123456 + (v21 or 0);
    return function(v25) --[[ Line: 33 ]]
        -- upvalues: v23 (ref), v8 (ref), v18 (copy), v24 (copy), v22 (ref), v20 (copy), v19 (copy)
        if not v23 then
            v8.touchStart(v18, v24);
            v23 = true;
        else
            v22 = v22 + v25;
            if v20 and v22 < v20 then
                local v26 = v22 / v20;
                local v27 = (v19 - v18) * v26 + v18;
                v8.touchMove(v27, v24);
            else
                v8.touchMove(v19, v24);
                v8.touchStop(v19, v24);
                return true;
            end;
        end;
        return false;
    end;
end;
v8.swipe = function(v29, v30, v31, v32, v33) --[[ Line: 53 ]] --[[ Name: swipe ]]
    -- upvalues: v0 (copy), v8 (copy)
    local v34 = 123456 + (v33 or 0);
    if v32 == true then
        local l___asyncRun_0 = v0.__asyncRun;
        local v36 = 0;
        local v37 = false;
        local v38 = 123456 + (v34 or 0);
        local v39;
        do
            local l_v36_0, l_v37_0 = v36, v37;
            v39 = function(v42) --[[ Line: 33 ]]
                -- upvalues: l_v37_0 (ref), v8 (ref), v29 (copy), v38 (copy), l_v36_0 (ref), v31 (copy), v30 (copy)
                if not l_v37_0 then
                    v8.touchStart(v29, v38);
                    l_v37_0 = true;
                else
                    l_v36_0 = l_v36_0 + v42;
                    if v31 and l_v36_0 < v31 then
                        local v43 = l_v36_0 / v31;
                        local v44 = (v30 - v29) * v43 + v29;
                        v8.touchMove(v44, v38);
                    else
                        v8.touchMove(v30, v38);
                        v8.touchStop(v30, v38);
                        return true;
                    end;
                end;
                return false;
            end;
        end;
        l___asyncRun_0(v39);
        return;
    else
        local l___syncRun_0 = v0.__syncRun;
        local v46 = 0;
        local v47 = false;
        local v48 = 123456 + (v34 or 0);
        local v49;
        do
            local l_v46_0, l_v47_0 = v46, v47;
            v49 = function(v52) --[[ Line: 33 ]]
                -- upvalues: l_v47_0 (ref), v8 (ref), v29 (copy), v48 (copy), l_v46_0 (ref), v31 (copy), v30 (copy)
                if not l_v47_0 then
                    v8.touchStart(v29, v48);
                    l_v47_0 = true;
                else
                    l_v46_0 = l_v46_0 + v52;
                    if v31 and l_v46_0 < v31 then
                        local v53 = l_v46_0 / v31;
                        local v54 = (v30 - v29) * v53 + v29;
                        v8.touchMove(v54, v48);
                    else
                        v8.touchMove(v30, v48);
                        v8.touchStop(v30, v48);
                        return true;
                    end;
                end;
                return false;
            end;
        end;
        l___syncRun_0(v49);
        return;
    end;
end;
v8.touchScroll = function(v55, v56, v57, v58, v59, v60) --[[ Line: 62 ]] --[[ Name: touchScroll ]]
    -- upvalues: v8 (copy)
    local v61 = v55 + Vector2.new(v56, v57);
    v8.swipe(v55, v61, v58, v59, v60);
end;
v8.tap = function(v62) --[[ Line: 74 ]] --[[ Name: tap ]]
    -- upvalues: v8 (copy), v0 (copy)
    v8.touchStart(v62);
    v0.waitForInputEventsProcessed();
    v8.touchStop(v62);
    v0.waitForInputEventsProcessed();
end;
return v8;