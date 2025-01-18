local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Error_0 = require(l_Parent_0.LuauPolyfill).Error;
local v3 = require(script.Parent["InputValidation.roblox"]);
local l_getGuiObject_0 = v3.getGuiObject;
local l_validateInput_0 = v3.validateInput;
local function _(v6) --[[ Line: 20 ]] --[[ Name: getRoot ]]
    local l_Parent_1 = v6.Parent;
    if l_Parent_1 == nil then
        return v6;
    else
        while l_Parent_1.Parent ~= nil and l_Parent_1.Parent.Parent ~= game do
            l_Parent_1 = l_Parent_1.Parent;
        end;
        return l_Parent_1;
    end;
end;
local function _(v9) --[[ Line: 32 ]] --[[ Name: makeInteractable ]]
    return function(v10, v11) --[[ Line: 33 ]]
        -- upvalues: v9 (copy)
        local l_v10_FirstAncestorOfClass_0 = v10:FindFirstAncestorOfClass("CoreGui");
        local l_v10_FirstAncestorOfClass_1 = v10:FindFirstAncestorOfClass("ScreenGui");
        local v14 = l_v10_FirstAncestorOfClass_0 or game:GetService("CoreGui");
        local v15 = l_v10_FirstAncestorOfClass_1 or Instance.new("ScreenGui");
        local v16 = nil;
        local v17 = false;
        if not v15:FindFirstAncestorOfClass("CoreGui") and v15.Parent == nil then
            v15.Parent = v14;
            v17 = true;
        end;
        if not v10:FindFirstAncestorOfClass("ScreenGui") then
            local l_Parent_2 = v10.Parent;
            if l_Parent_2 == nil then
                v16 = v10;
            else
                while l_Parent_2.Parent ~= nil and l_Parent_2.Parent.Parent ~= game do
                    l_Parent_2 = l_Parent_2.Parent;
                end;
                v16 = l_Parent_2;
            end;
            v16.Parent = v15;
        end;
        v9(v10, v11);
        if l_v10_FirstAncestorOfClass_1 ~= v15 then
            v16.Parent = nil;
            v15:Destroy();
        end;
        if v15 and v17 then
            v15.Parent = nil;
        end;
    end;
end;
local function _(v20) --[[ Line: 64 ]] --[[ Name: withInputValidation ]]
    -- upvalues: l_validateInput_0 (copy), l_getGuiObject_0 (copy)
    return function(v21) --[[ Line: 65 ]]
        -- upvalues: l_validateInput_0 (ref), l_getGuiObject_0 (ref), v20 (copy)
        l_validateInput_0(l_getGuiObject_0(v21), function() --[[ Line: 66 ]]
            -- upvalues: v20 (ref), v21 (copy)
            v20(v21);
        end);
    end;
end;
local function _(v23) --[[ Line: 72 ]] --[[ Name: getCenter ]]
    local l_AbsolutePosition_0 = v23.AbsolutePosition;
    local l_AbsoluteSize_0 = v23.AbsoluteSize;
    return l_AbsolutePosition_0.X + l_AbsoluteSize_0.X / 2, l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y / 2;
end;
local function v32(v27) --[[ Line: 79 ]] --[[ Name: click ]]
    -- upvalues: l_VirtualInputManager_0 (copy)
    local l_AbsolutePosition_1 = v27.AbsolutePosition;
    local l_AbsoluteSize_1 = v27.AbsoluteSize;
    local v30 = l_AbsolutePosition_1.X + l_AbsoluteSize_1.X / 2;
    local v31 = l_AbsolutePosition_1.Y + l_AbsoluteSize_1.Y / 2;
    l_VirtualInputManager_0:SendMouseButtonEvent(v30, v31, 0, true, nil, 1);
    l_VirtualInputManager_0:SendMouseButtonEvent(v30, v31, 0, false, nil, 1);
    l_VirtualInputManager_0:WaitForInputEventsProcessed();
end;
local function v38(v33) --[[ Line: 90 ]] --[[ Name: tap ]]
    -- upvalues: l_VirtualInputManager_0 (copy)
    local l_AbsolutePosition_2 = v33.AbsolutePosition;
    local l_AbsoluteSize_2 = v33.AbsoluteSize;
    local v36 = l_AbsolutePosition_2.X + l_AbsoluteSize_2.X / 2;
    local v37 = l_AbsolutePosition_2.Y + l_AbsoluteSize_2.Y / 2;
    l_VirtualInputManager_0:SendTouchEvent(123456, 0, v36, v37);
    l_VirtualInputManager_0:SendTouchEvent(123456, 2, v36, v37);
    l_VirtualInputManager_0:WaitForInputEventsProcessed();
end;
local function v44(v39) --[[ Line: 98 ]] --[[ Name: mouseEnter ]]
    -- upvalues: l_VirtualInputManager_0 (copy)
    local l_AbsolutePosition_3 = v39.AbsolutePosition;
    local l_AbsoluteSize_3 = v39.AbsoluteSize;
    local v42 = l_AbsolutePosition_3.X + l_AbsoluteSize_3.X / 2;
    local v43 = l_AbsolutePosition_3.Y + l_AbsoluteSize_3.Y / 2;
    l_VirtualInputManager_0:SendMouseMoveEvent(v42, v43, nil);
    l_VirtualInputManager_0:WaitForInputEventsProcessed();
end;
local function v50(v45) --[[ Line: 106 ]] --[[ Name: mouseLeave ]]
    -- upvalues: l_VirtualInputManager_0 (copy)
    local l_AbsolutePosition_4 = v45.AbsolutePosition;
    local l_AbsoluteSize_4 = v45.AbsoluteSize;
    local v48 = l_AbsolutePosition_4.X + l_AbsoluteSize_4.X / 2;
    local v49 = l_AbsolutePosition_4.Y + l_AbsoluteSize_4.Y / 2;
    l_AbsolutePosition_4 = v45.AbsolutePosition;
    l_VirtualInputManager_0:SendMouseMoveEvent(v48, v49, nil);
    l_VirtualInputManager_0:WaitForInputEventsProcessed();
    l_VirtualInputManager_0:SendMouseMoveEvent(l_AbsolutePosition_4.X - 1, l_AbsolutePosition_4.Y - 1, nil);
    l_VirtualInputManager_0:WaitForInputEventsProcessed();
end;
local function v53(_, v52) --[[ Line: 117 ]] --[[ Name: keyDown ]]
    -- upvalues: l_VirtualInputManager_0 (copy)
    if not v52 or not v52.key then
        error("No key set for event");
    end;
    l_VirtualInputManager_0:SendKeyEvent(true, v52.key, false, nil);
    l_VirtualInputManager_0:WaitForInputEventsProcessed();
end;
local function v56(_, v55) --[[ Line: 125 ]] --[[ Name: keyUp ]]
    -- upvalues: l_VirtualInputManager_0 (copy)
    if not v55 or not v55.key then
        error("No key set for event");
    end;
    l_VirtualInputManager_0:SendKeyEvent(false, v55.key, false, nil);
    l_VirtualInputManager_0:WaitForInputEventsProcessed();
end;
local function v61(v57, v58) --[[ Line: 133 ]] --[[ Name: change ]]
    -- upvalues: l_Error_0 (copy)
    if v57:IsA("TextBox") then
        if v58 and v58.target then
            for v59, v60 in pairs(v58.target) do
                v57[v59] = v60;
            end;
            return;
        end;
    else
        error(l_Error_0.new("The change event must be fired in a TextBox Instance"));
    end;
end;
local function v64(v62, v63) --[[ Line: 145 ]] --[[ Name: resize ]]
    v62.Size = if v63 and v63.value then v63.value else v62.Size;
end;
local v83 = {
    clickWithoutValidation = function(v65, v66) --[[ Line: 33 ]]
        -- upvalues: v32 (copy)
        local l_v65_FirstAncestorOfClass_0 = v65:FindFirstAncestorOfClass("CoreGui");
        local l_v65_FirstAncestorOfClass_1 = v65:FindFirstAncestorOfClass("ScreenGui");
        local v69 = l_v65_FirstAncestorOfClass_0 or game:GetService("CoreGui");
        local v70 = l_v65_FirstAncestorOfClass_1 or Instance.new("ScreenGui");
        local v71 = nil;
        local v72 = false;
        if not v70:FindFirstAncestorOfClass("CoreGui") and v70.Parent == nil then
            v70.Parent = v69;
            v72 = true;
        end;
        if not v65:FindFirstAncestorOfClass("ScreenGui") then
            local l_Parent_3 = v65.Parent;
            if l_Parent_3 == nil then
                v71 = v65;
            else
                while l_Parent_3.Parent ~= nil and l_Parent_3.Parent.Parent ~= game do
                    l_Parent_3 = l_Parent_3.Parent;
                end;
                v71 = l_Parent_3;
            end;
            v71.Parent = v70;
        end;
        v32(v65, v66);
        if l_v65_FirstAncestorOfClass_1 ~= v70 then
            v71.Parent = nil;
            v70:Destroy();
        end;
        if v70 and v72 then
            v70.Parent = nil;
        end;
    end, 
    tapWithoutValidation = function(v74, v75) --[[ Line: 33 ]]
        -- upvalues: v38 (copy)
        local l_v74_FirstAncestorOfClass_0 = v74:FindFirstAncestorOfClass("CoreGui");
        local l_v74_FirstAncestorOfClass_1 = v74:FindFirstAncestorOfClass("ScreenGui");
        local v78 = l_v74_FirstAncestorOfClass_0 or game:GetService("CoreGui");
        local v79 = l_v74_FirstAncestorOfClass_1 or Instance.new("ScreenGui");
        local v80 = nil;
        local v81 = false;
        if not v79:FindFirstAncestorOfClass("CoreGui") and v79.Parent == nil then
            v79.Parent = v78;
            v81 = true;
        end;
        if not v74:FindFirstAncestorOfClass("ScreenGui") then
            local l_Parent_4 = v74.Parent;
            if l_Parent_4 == nil then
                v80 = v74;
            else
                while l_Parent_4.Parent ~= nil and l_Parent_4.Parent.Parent ~= game do
                    l_Parent_4 = l_Parent_4.Parent;
                end;
                v80 = l_Parent_4;
            end;
            v80.Parent = v79;
        end;
        v38(v74, v75);
        if l_v74_FirstAncestorOfClass_1 ~= v79 then
            v80.Parent = nil;
            v79:Destroy();
        end;
        if v79 and v81 then
            v79.Parent = nil;
        end;
    end
};
local function v85(v84) --[[ Line: 65 ]]
    -- upvalues: l_validateInput_0 (copy), l_getGuiObject_0 (copy), v32 (copy)
    l_validateInput_0(l_getGuiObject_0(v84), function() --[[ Line: 66 ]]
        -- upvalues: v32 (ref), v84 (copy)
        v32(v84);
    end);
end;
local l_v85_0 = v85 --[[ copy: 21 -> 22 ]];
v83.click = function(v87, v88) --[[ Line: 33 ]]
    -- upvalues: l_v85_0 (copy)
    local l_v87_FirstAncestorOfClass_0 = v87:FindFirstAncestorOfClass("CoreGui");
    local l_v87_FirstAncestorOfClass_1 = v87:FindFirstAncestorOfClass("ScreenGui");
    local v91 = l_v87_FirstAncestorOfClass_0 or game:GetService("CoreGui");
    local v92 = l_v87_FirstAncestorOfClass_1 or Instance.new("ScreenGui");
    local v93 = nil;
    local v94 = false;
    if not v92:FindFirstAncestorOfClass("CoreGui") and v92.Parent == nil then
        v92.Parent = v91;
        v94 = true;
    end;
    if not v87:FindFirstAncestorOfClass("ScreenGui") then
        local l_Parent_5 = v87.Parent;
        if l_Parent_5 == nil then
            v93 = v87;
        else
            while l_Parent_5.Parent ~= nil and l_Parent_5.Parent.Parent ~= game do
                l_Parent_5 = l_Parent_5.Parent;
            end;
            v93 = l_Parent_5;
        end;
        v93.Parent = v92;
    end;
    l_v85_0(v87, v88);
    if l_v87_FirstAncestorOfClass_1 ~= v92 then
        v93.Parent = nil;
        v92:Destroy();
    end;
    if v92 and v94 then
        v92.Parent = nil;
    end;
end;
v85 = function(v96) --[[ Line: 65 ]]
    -- upvalues: l_validateInput_0 (copy), l_getGuiObject_0 (copy), v38 (copy)
    l_validateInput_0(l_getGuiObject_0(v96), function() --[[ Line: 66 ]]
        -- upvalues: v38 (ref), v96 (copy)
        v38(v96);
    end);
end;
v83.tap = function(v97, v98) --[[ Line: 33 ]]
    -- upvalues: v85 (copy)
    local l_v97_FirstAncestorOfClass_0 = v97:FindFirstAncestorOfClass("CoreGui");
    local l_v97_FirstAncestorOfClass_1 = v97:FindFirstAncestorOfClass("ScreenGui");
    local v101 = l_v97_FirstAncestorOfClass_0 or game:GetService("CoreGui");
    local v102 = l_v97_FirstAncestorOfClass_1 or Instance.new("ScreenGui");
    local v103 = nil;
    local v104 = false;
    if not v102:FindFirstAncestorOfClass("CoreGui") and v102.Parent == nil then
        v102.Parent = v101;
        v104 = true;
    end;
    if not v97:FindFirstAncestorOfClass("ScreenGui") then
        local l_Parent_6 = v97.Parent;
        if l_Parent_6 == nil then
            v103 = v97;
        else
            while l_Parent_6.Parent ~= nil and l_Parent_6.Parent.Parent ~= game do
                l_Parent_6 = l_Parent_6.Parent;
            end;
            v103 = l_Parent_6;
        end;
        v103.Parent = v102;
    end;
    v85(v97, v98);
    if l_v97_FirstAncestorOfClass_1 ~= v102 then
        v103.Parent = nil;
        v102:Destroy();
    end;
    if v102 and v104 then
        v102.Parent = nil;
    end;
end;
v83.mouseEnter = function(v106, v107) --[[ Line: 33 ]]
    -- upvalues: v44 (copy)
    local l_v106_FirstAncestorOfClass_0 = v106:FindFirstAncestorOfClass("CoreGui");
    local l_v106_FirstAncestorOfClass_1 = v106:FindFirstAncestorOfClass("ScreenGui");
    local v110 = l_v106_FirstAncestorOfClass_0 or game:GetService("CoreGui");
    local v111 = l_v106_FirstAncestorOfClass_1 or Instance.new("ScreenGui");
    local v112 = nil;
    local v113 = false;
    if not v111:FindFirstAncestorOfClass("CoreGui") and v111.Parent == nil then
        v111.Parent = v110;
        v113 = true;
    end;
    if not v106:FindFirstAncestorOfClass("ScreenGui") then
        local l_Parent_7 = v106.Parent;
        if l_Parent_7 == nil then
            v112 = v106;
        else
            while l_Parent_7.Parent ~= nil and l_Parent_7.Parent.Parent ~= game do
                l_Parent_7 = l_Parent_7.Parent;
            end;
            v112 = l_Parent_7;
        end;
        v112.Parent = v111;
    end;
    v44(v106, v107);
    if l_v106_FirstAncestorOfClass_1 ~= v111 then
        v112.Parent = nil;
        v111:Destroy();
    end;
    if v111 and v113 then
        v111.Parent = nil;
    end;
end;
v83.mouseLeave = function(v115, v116) --[[ Line: 33 ]]
    -- upvalues: v50 (copy)
    local l_v115_FirstAncestorOfClass_0 = v115:FindFirstAncestorOfClass("CoreGui");
    local l_v115_FirstAncestorOfClass_1 = v115:FindFirstAncestorOfClass("ScreenGui");
    local v119 = l_v115_FirstAncestorOfClass_0 or game:GetService("CoreGui");
    local v120 = l_v115_FirstAncestorOfClass_1 or Instance.new("ScreenGui");
    local v121 = nil;
    local v122 = false;
    if not v120:FindFirstAncestorOfClass("CoreGui") and v120.Parent == nil then
        v120.Parent = v119;
        v122 = true;
    end;
    if not v115:FindFirstAncestorOfClass("ScreenGui") then
        local l_Parent_8 = v115.Parent;
        if l_Parent_8 == nil then
            v121 = v115;
        else
            while l_Parent_8.Parent ~= nil and l_Parent_8.Parent.Parent ~= game do
                l_Parent_8 = l_Parent_8.Parent;
            end;
            v121 = l_Parent_8;
        end;
        v121.Parent = v120;
    end;
    v50(v115, v116);
    if l_v115_FirstAncestorOfClass_1 ~= v120 then
        v121.Parent = nil;
        v120:Destroy();
    end;
    if v120 and v122 then
        v120.Parent = nil;
    end;
end;
v83.keyDown = function(v124, v125) --[[ Line: 33 ]]
    -- upvalues: v53 (copy)
    local l_v124_FirstAncestorOfClass_0 = v124:FindFirstAncestorOfClass("CoreGui");
    local l_v124_FirstAncestorOfClass_1 = v124:FindFirstAncestorOfClass("ScreenGui");
    local v128 = l_v124_FirstAncestorOfClass_0 or game:GetService("CoreGui");
    local v129 = l_v124_FirstAncestorOfClass_1 or Instance.new("ScreenGui");
    local v130 = nil;
    local v131 = false;
    if not v129:FindFirstAncestorOfClass("CoreGui") and v129.Parent == nil then
        v129.Parent = v128;
        v131 = true;
    end;
    if not v124:FindFirstAncestorOfClass("ScreenGui") then
        local l_Parent_9 = v124.Parent;
        if l_Parent_9 == nil then
            v130 = v124;
        else
            while l_Parent_9.Parent ~= nil and l_Parent_9.Parent.Parent ~= game do
                l_Parent_9 = l_Parent_9.Parent;
            end;
            v130 = l_Parent_9;
        end;
        v130.Parent = v129;
    end;
    v53(v124, v125);
    if l_v124_FirstAncestorOfClass_1 ~= v129 then
        v130.Parent = nil;
        v129:Destroy();
    end;
    if v129 and v131 then
        v129.Parent = nil;
    end;
end;
v83.keyUp = function(v133, v134) --[[ Line: 33 ]]
    -- upvalues: v56 (copy)
    local l_v133_FirstAncestorOfClass_0 = v133:FindFirstAncestorOfClass("CoreGui");
    local l_v133_FirstAncestorOfClass_1 = v133:FindFirstAncestorOfClass("ScreenGui");
    local v137 = l_v133_FirstAncestorOfClass_0 or game:GetService("CoreGui");
    local v138 = l_v133_FirstAncestorOfClass_1 or Instance.new("ScreenGui");
    local v139 = nil;
    local v140 = false;
    if not v138:FindFirstAncestorOfClass("CoreGui") and v138.Parent == nil then
        v138.Parent = v137;
        v140 = true;
    end;
    if not v133:FindFirstAncestorOfClass("ScreenGui") then
        local l_Parent_10 = v133.Parent;
        if l_Parent_10 == nil then
            v139 = v133;
        else
            while l_Parent_10.Parent ~= nil and l_Parent_10.Parent.Parent ~= game do
                l_Parent_10 = l_Parent_10.Parent;
            end;
            v139 = l_Parent_10;
        end;
        v139.Parent = v138;
    end;
    v56(v133, v134);
    if l_v133_FirstAncestorOfClass_1 ~= v138 then
        v139.Parent = nil;
        v138:Destroy();
    end;
    if v138 and v140 then
        v138.Parent = nil;
    end;
end;
v83.change = function(v142, v143) --[[ Line: 33 ]]
    -- upvalues: v61 (copy)
    local l_v142_FirstAncestorOfClass_0 = v142:FindFirstAncestorOfClass("CoreGui");
    local l_v142_FirstAncestorOfClass_1 = v142:FindFirstAncestorOfClass("ScreenGui");
    local v146 = l_v142_FirstAncestorOfClass_0 or game:GetService("CoreGui");
    local v147 = l_v142_FirstAncestorOfClass_1 or Instance.new("ScreenGui");
    local v148 = nil;
    local v149 = false;
    if not v147:FindFirstAncestorOfClass("CoreGui") and v147.Parent == nil then
        v147.Parent = v146;
        v149 = true;
    end;
    if not v142:FindFirstAncestorOfClass("ScreenGui") then
        local l_Parent_11 = v142.Parent;
        if l_Parent_11 == nil then
            v148 = v142;
        else
            while l_Parent_11.Parent ~= nil and l_Parent_11.Parent.Parent ~= game do
                l_Parent_11 = l_Parent_11.Parent;
            end;
            v148 = l_Parent_11;
        end;
        v148.Parent = v147;
    end;
    v61(v142, v143);
    if l_v142_FirstAncestorOfClass_1 ~= v147 then
        v148.Parent = nil;
        v147:Destroy();
    end;
    if v147 and v149 then
        v147.Parent = nil;
    end;
end;
v83.resize = function(v151, v152) --[[ Line: 33 ]]
    -- upvalues: v64 (copy)
    local l_v151_FirstAncestorOfClass_0 = v151:FindFirstAncestorOfClass("CoreGui");
    local l_v151_FirstAncestorOfClass_1 = v151:FindFirstAncestorOfClass("ScreenGui");
    local v155 = l_v151_FirstAncestorOfClass_0 or game:GetService("CoreGui");
    local v156 = l_v151_FirstAncestorOfClass_1 or Instance.new("ScreenGui");
    local v157 = nil;
    local v158 = false;
    if not v156:FindFirstAncestorOfClass("CoreGui") and v156.Parent == nil then
        v156.Parent = v155;
        v158 = true;
    end;
    if not v151:FindFirstAncestorOfClass("ScreenGui") then
        local l_Parent_12 = v151.Parent;
        if l_Parent_12 == nil then
            v157 = v151;
        else
            while l_Parent_12.Parent ~= nil and l_Parent_12.Parent.Parent ~= game do
                l_Parent_12 = l_Parent_12.Parent;
            end;
            v157 = l_Parent_12;
        end;
        v157.Parent = v156;
    end;
    v64(v151, v152);
    if l_v151_FirstAncestorOfClass_1 ~= v156 then
        v157.Parent = nil;
        v156:Destroy();
    end;
    if v156 and v158 then
        v156.Parent = nil;
    end;
end;
return function(v160, v161, v162) --[[ Line: 164 ]] --[[ Name: dispatchEvent ]]
    -- upvalues: v83 (copy)
    local v163 = v83[v161];
    if not v163 then
        error(string.format("Event '%s' not supported", v161));
    end;
    v163(v160, v162);
end;