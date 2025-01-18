local l_Parent_0 = script.Parent.Parent.Parent;
local l_Error_0 = require(l_Parent_0.LuauPolyfill).Error;
local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
local function _(v3) --[[ Line: 9 ]] --[[ Name: getRoot ]]
    local l_Parent_1 = v3.Parent;
    if l_Parent_1 == nil then
        return v3;
    else
        while l_Parent_1.Parent ~= nil and l_Parent_1.Parent.Parent ~= game do
            l_Parent_1 = l_Parent_1.Parent;
        end;
        return l_Parent_1;
    end;
end;
local function _(v6) --[[ Line: 21 ]] --[[ Name: makeInteractable ]]
    return function(v7, v8) --[[ Line: 22 ]]
        -- upvalues: v6 (copy)
        local l_v7_FirstAncestorOfClass_0 = v7:FindFirstAncestorOfClass("CoreGui");
        local l_v7_FirstAncestorOfClass_1 = v7:FindFirstAncestorOfClass("ScreenGui");
        local v11 = l_v7_FirstAncestorOfClass_0 or game:GetService("CoreGui");
        local v12 = l_v7_FirstAncestorOfClass_1 or Instance.new("ScreenGui");
        local v13 = nil;
        local v14 = false;
        if not v12:FindFirstAncestorOfClass("CoreGui") and v12.Parent == nil then
            v12.Parent = v11;
            v14 = true;
        end;
        if not v7:FindFirstAncestorOfClass("ScreenGui") then
            local l_Parent_2 = v7.Parent;
            if l_Parent_2 == nil then
                v13 = v7;
            else
                while l_Parent_2.Parent ~= nil and l_Parent_2.Parent.Parent ~= game do
                    l_Parent_2 = l_Parent_2.Parent;
                end;
                v13 = l_Parent_2;
            end;
            v13.Parent = v12;
        end;
        v6(v7, v8);
        if l_v7_FirstAncestorOfClass_1 ~= v12 then
            v13.Parent = nil;
            v12:Destroy();
        end;
        if v12 and v14 then
            v12.Parent = nil;
        end;
    end;
end;
local function _(v17) --[[ Line: 53 ]] --[[ Name: getCenter ]]
    local l_AbsolutePosition_0 = v17.AbsolutePosition;
    local l_AbsoluteSize_0 = v17.AbsoluteSize;
    return l_AbsolutePosition_0.X + l_AbsoluteSize_0.X / 2, l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y / 2;
end;
local function v26(v21) --[[ Line: 60 ]] --[[ Name: click ]]
    -- upvalues: l_VirtualInputManager_0 (copy)
    local l_AbsolutePosition_1 = v21.AbsolutePosition;
    local l_AbsoluteSize_1 = v21.AbsoluteSize;
    local v24 = l_AbsolutePosition_1.X + l_AbsoluteSize_1.X / 2;
    local v25 = l_AbsolutePosition_1.Y + l_AbsoluteSize_1.Y / 2;
    l_VirtualInputManager_0:SendMouseButtonEvent(v24, v25, 0, true, nil, 1);
    l_VirtualInputManager_0:SendMouseButtonEvent(v24, v25, 0, false, nil, 1);
    l_VirtualInputManager_0:WaitForInputEventsProcessed();
end;
local function v29(_, v28) --[[ Line: 71 ]] --[[ Name: keyDown ]]
    -- upvalues: l_VirtualInputManager_0 (copy)
    if not v28 or not v28.key then
        error("No key set for event");
    end;
    l_VirtualInputManager_0:SendKeyEvent(true, v28.key, false, nil);
    l_VirtualInputManager_0:WaitForInputEventsProcessed();
end;
local function v32(_, v31) --[[ Line: 79 ]] --[[ Name: keyUp ]]
    -- upvalues: l_VirtualInputManager_0 (copy)
    if not v31 or not v31.key then
        error("No key set for event");
    end;
    l_VirtualInputManager_0:SendKeyEvent(false, v31.key, false, nil);
    l_VirtualInputManager_0:WaitForInputEventsProcessed();
end;
local function v37(v33, v34) --[[ Line: 87 ]] --[[ Name: change ]]
    -- upvalues: l_Error_0 (copy)
    if v33:IsA("TextBox") then
        if v34 and v34.target then
            for v35, v36 in pairs(v34.target) do
                v33[v35] = v36;
            end;
            return;
        end;
    else
        error(l_Error_0.new("The change event must be fired in a TextBox Instance"));
    end;
end;
local function v40(v38, v39) --[[ Line: 99 ]] --[[ Name: resize ]]
    v38.Size = if v39 and v39.value then v39.value else v38.Size;
end;
local v86 = {
    click = function(v41, v42) --[[ Line: 22 ]]
        -- upvalues: v26 (copy)
        local l_v41_FirstAncestorOfClass_0 = v41:FindFirstAncestorOfClass("CoreGui");
        local l_v41_FirstAncestorOfClass_1 = v41:FindFirstAncestorOfClass("ScreenGui");
        local v45 = l_v41_FirstAncestorOfClass_0 or game:GetService("CoreGui");
        local v46 = l_v41_FirstAncestorOfClass_1 or Instance.new("ScreenGui");
        local v47 = nil;
        local v48 = false;
        if not v46:FindFirstAncestorOfClass("CoreGui") and v46.Parent == nil then
            v46.Parent = v45;
            v48 = true;
        end;
        if not v41:FindFirstAncestorOfClass("ScreenGui") then
            local l_Parent_3 = v41.Parent;
            if l_Parent_3 == nil then
                v47 = v41;
            else
                while l_Parent_3.Parent ~= nil and l_Parent_3.Parent.Parent ~= game do
                    l_Parent_3 = l_Parent_3.Parent;
                end;
                v47 = l_Parent_3;
            end;
            v47.Parent = v46;
        end;
        v26(v41, v42);
        if l_v41_FirstAncestorOfClass_1 ~= v46 then
            v47.Parent = nil;
            v46:Destroy();
        end;
        if v46 and v48 then
            v46.Parent = nil;
        end;
    end, 
    keyDown = function(v50, v51) --[[ Line: 22 ]]
        -- upvalues: v29 (copy)
        local l_v50_FirstAncestorOfClass_0 = v50:FindFirstAncestorOfClass("CoreGui");
        local l_v50_FirstAncestorOfClass_1 = v50:FindFirstAncestorOfClass("ScreenGui");
        local v54 = l_v50_FirstAncestorOfClass_0 or game:GetService("CoreGui");
        local v55 = l_v50_FirstAncestorOfClass_1 or Instance.new("ScreenGui");
        local v56 = nil;
        local v57 = false;
        if not v55:FindFirstAncestorOfClass("CoreGui") and v55.Parent == nil then
            v55.Parent = v54;
            v57 = true;
        end;
        if not v50:FindFirstAncestorOfClass("ScreenGui") then
            local l_Parent_4 = v50.Parent;
            if l_Parent_4 == nil then
                v56 = v50;
            else
                while l_Parent_4.Parent ~= nil and l_Parent_4.Parent.Parent ~= game do
                    l_Parent_4 = l_Parent_4.Parent;
                end;
                v56 = l_Parent_4;
            end;
            v56.Parent = v55;
        end;
        v29(v50, v51);
        if l_v50_FirstAncestorOfClass_1 ~= v55 then
            v56.Parent = nil;
            v55:Destroy();
        end;
        if v55 and v57 then
            v55.Parent = nil;
        end;
    end, 
    keyUp = function(v59, v60) --[[ Line: 22 ]]
        -- upvalues: v32 (copy)
        local l_v59_FirstAncestorOfClass_0 = v59:FindFirstAncestorOfClass("CoreGui");
        local l_v59_FirstAncestorOfClass_1 = v59:FindFirstAncestorOfClass("ScreenGui");
        local v63 = l_v59_FirstAncestorOfClass_0 or game:GetService("CoreGui");
        local v64 = l_v59_FirstAncestorOfClass_1 or Instance.new("ScreenGui");
        local v65 = nil;
        local v66 = false;
        if not v64:FindFirstAncestorOfClass("CoreGui") and v64.Parent == nil then
            v64.Parent = v63;
            v66 = true;
        end;
        if not v59:FindFirstAncestorOfClass("ScreenGui") then
            local l_Parent_5 = v59.Parent;
            if l_Parent_5 == nil then
                v65 = v59;
            else
                while l_Parent_5.Parent ~= nil and l_Parent_5.Parent.Parent ~= game do
                    l_Parent_5 = l_Parent_5.Parent;
                end;
                v65 = l_Parent_5;
            end;
            v65.Parent = v64;
        end;
        v32(v59, v60);
        if l_v59_FirstAncestorOfClass_1 ~= v64 then
            v65.Parent = nil;
            v64:Destroy();
        end;
        if v64 and v66 then
            v64.Parent = nil;
        end;
    end, 
    change = function(v68, v69) --[[ Line: 22 ]]
        -- upvalues: v37 (copy)
        local l_v68_FirstAncestorOfClass_0 = v68:FindFirstAncestorOfClass("CoreGui");
        local l_v68_FirstAncestorOfClass_1 = v68:FindFirstAncestorOfClass("ScreenGui");
        local v72 = l_v68_FirstAncestorOfClass_0 or game:GetService("CoreGui");
        local v73 = l_v68_FirstAncestorOfClass_1 or Instance.new("ScreenGui");
        local v74 = nil;
        local v75 = false;
        if not v73:FindFirstAncestorOfClass("CoreGui") and v73.Parent == nil then
            v73.Parent = v72;
            v75 = true;
        end;
        if not v68:FindFirstAncestorOfClass("ScreenGui") then
            local l_Parent_6 = v68.Parent;
            if l_Parent_6 == nil then
                v74 = v68;
            else
                while l_Parent_6.Parent ~= nil and l_Parent_6.Parent.Parent ~= game do
                    l_Parent_6 = l_Parent_6.Parent;
                end;
                v74 = l_Parent_6;
            end;
            v74.Parent = v73;
        end;
        v37(v68, v69);
        if l_v68_FirstAncestorOfClass_1 ~= v73 then
            v74.Parent = nil;
            v73:Destroy();
        end;
        if v73 and v75 then
            v73.Parent = nil;
        end;
    end, 
    resize = function(v77, v78) --[[ Line: 22 ]]
        -- upvalues: v40 (copy)
        local l_v77_FirstAncestorOfClass_0 = v77:FindFirstAncestorOfClass("CoreGui");
        local l_v77_FirstAncestorOfClass_1 = v77:FindFirstAncestorOfClass("ScreenGui");
        local v81 = l_v77_FirstAncestorOfClass_0 or game:GetService("CoreGui");
        local v82 = l_v77_FirstAncestorOfClass_1 or Instance.new("ScreenGui");
        local v83 = nil;
        local v84 = false;
        if not v82:FindFirstAncestorOfClass("CoreGui") and v82.Parent == nil then
            v82.Parent = v81;
            v84 = true;
        end;
        if not v77:FindFirstAncestorOfClass("ScreenGui") then
            local l_Parent_7 = v77.Parent;
            if l_Parent_7 == nil then
                v83 = v77;
            else
                while l_Parent_7.Parent ~= nil and l_Parent_7.Parent.Parent ~= game do
                    l_Parent_7 = l_Parent_7.Parent;
                end;
                v83 = l_Parent_7;
            end;
            v83.Parent = v82;
        end;
        v40(v77, v78);
        if l_v77_FirstAncestorOfClass_1 ~= v82 then
            v83.Parent = nil;
            v82:Destroy();
        end;
        if v82 and v84 then
            v82.Parent = nil;
        end;
    end
};
return function(v87, v88, v89) --[[ Line: 112 ]] --[[ Name: dispatchEvent ]]
    -- upvalues: v86 (copy)
    local v90 = v86[v88];
    if not v90 then
        error("Event not found");
    end;
    v90(v87, v89);
end;