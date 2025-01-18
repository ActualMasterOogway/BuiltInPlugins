local v0 = nil;
local l_CoreGui_0 = game:GetService("CoreGui");
local function _(v2, v3) --[[ Line: 13 ]] --[[ Name: createFolder ]]
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = v2;
    l_Folder_0.Parent = v3;
    return l_Folder_0;
end;
local function _(v6, v7) --[[ Line: 20 ]] --[[ Name: createScreenGui ]]
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Name = v6;
    l_ScreenGui_0.Parent = v7;
    l_ScreenGui_0.ClipToDeviceSafeArea = false;
    l_ScreenGui_0.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None;
    return l_ScreenGui_0;
end;
local function _() --[[ Line: 31 ]] --[[ Name: getMainFolder ]]
    -- upvalues: v0 (ref), l_CoreGui_0 (copy)
    if not v0 then
        local l_l_CoreGui_0_0 = l_CoreGui_0;
        local l_Folder_1 = Instance.new("Folder");
        l_Folder_1.Name = "RobloxGUIEditor";
        l_Folder_1.Parent = l_l_CoreGui_0_0;
        v0 = l_Folder_1;
    end;
    return v0;
end;
return {
    findOrCreateFolder = function(_, v14) --[[ Line: 40 ]] --[[ Name: findOrCreateFolder ]]
        -- upvalues: v0 (ref), l_CoreGui_0 (copy)
        if not v0 then
            local l_l_CoreGui_0_1 = l_CoreGui_0;
            local l_Folder_2 = Instance.new("Folder");
            l_Folder_2.Name = "RobloxGUIEditor";
            l_Folder_2.Parent = l_l_CoreGui_0_1;
            v0 = l_Folder_2;
        end;
        local l_v0_FirstChild_0 = v0:FindFirstChild(v14);
        if not l_v0_FirstChild_0 then
            if not v0 then
                local l_l_CoreGui_0_2 = l_CoreGui_0;
                local l_Folder_3 = Instance.new("Folder");
                l_Folder_3.Name = "RobloxGUIEditor";
                l_Folder_3.Parent = l_l_CoreGui_0_2;
                v0 = l_Folder_3;
            end;
            local l_v0_0 = v0;
            local l_Folder_4 = Instance.new("Folder");
            l_Folder_4.Name = v14;
            l_Folder_4.Parent = l_v0_0;
            l_v0_FirstChild_0 = l_Folder_4;
        end;
        return l_v0_FirstChild_0;
    end, 
    findOrCreateScreenGui = function(_, v23) --[[ Line: 48 ]] --[[ Name: findOrCreateScreenGui ]]
        -- upvalues: v0 (ref), l_CoreGui_0 (copy)
        if not v0 then
            local l_l_CoreGui_0_3 = l_CoreGui_0;
            local l_Folder_5 = Instance.new("Folder");
            l_Folder_5.Name = "RobloxGUIEditor";
            l_Folder_5.Parent = l_l_CoreGui_0_3;
            v0 = l_Folder_5;
        end;
        local l_v0_FirstChild_1 = v0:FindFirstChild(v23);
        if not l_v0_FirstChild_1 then
            if not v0 then
                local l_l_CoreGui_0_4 = l_CoreGui_0;
                local l_Folder_6 = Instance.new("Folder");
                l_Folder_6.Name = "RobloxGUIEditor";
                l_Folder_6.Parent = l_l_CoreGui_0_4;
                v0 = l_Folder_6;
            end;
            local l_v0_1 = v0;
            local l_ScreenGui_1 = Instance.new("ScreenGui");
            l_ScreenGui_1.Name = v23;
            l_ScreenGui_1.Parent = l_v0_1;
            l_ScreenGui_1.ClipToDeviceSafeArea = false;
            l_ScreenGui_1.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None;
            l_v0_FirstChild_1 = l_ScreenGui_1;
        end;
        return l_v0_FirstChild_1;
    end
};