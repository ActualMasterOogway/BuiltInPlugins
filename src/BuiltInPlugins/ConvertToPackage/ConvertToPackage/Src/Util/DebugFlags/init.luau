local l_Workspace_0 = game:GetService("Workspace");
local function _() --[[ Line: 5 ]] --[[ Name: findDebugFlagsFolder ]]
    -- upvalues: l_Workspace_0 (copy)
    return l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
end;
local function _() --[[ Line: 9 ]] --[[ Name: findOrCreateDebugFlagsFolder ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_ToolboxDebugFlags_0 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
    if not l_ToolboxDebugFlags_0 then
        l_ToolboxDebugFlags_0 = Instance.new("Folder");
        l_ToolboxDebugFlags_0.Name = "ToolboxDebugFlags";
        l_ToolboxDebugFlags_0.Parent = l_Workspace_0;
    end;
    return l_ToolboxDebugFlags_0;
end;
local function _(v4) --[[ Line: 19 ]] --[[ Name: getDebugFlagValue ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_ToolboxDebugFlags_1 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
    if not l_ToolboxDebugFlags_1 then
        return false;
    else
        local l_l_ToolboxDebugFlags_1_FirstChild_0 = l_ToolboxDebugFlags_1:FindFirstChild(v4);
        if l_l_ToolboxDebugFlags_1_FirstChild_0 then
            return l_l_ToolboxDebugFlags_1_FirstChild_0.Value;
        else
            return false;
        end;
    end;
end;
return {
    shouldRunTests = function() --[[ Line: 33 ]] --[[ Name: shouldRunTests ]]
        -- upvalues: l_Workspace_0 (copy)
        wait(0.3);
        local l_ToolboxDebugFlags_2 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if not l_ToolboxDebugFlags_2 then
            return false;
        else
            local l_RunToolboxTests_0 = l_ToolboxDebugFlags_2:FindFirstChild("RunToolboxTests");
            if l_RunToolboxTests_0 then
                return l_RunToolboxTests_0.Value;
            else
                return false;
            end;
        end;
    end, 
    shouldDisableTooltips = function() --[[ Line: 39 ]] --[[ Name: shouldDisableTooltips ]]
        -- upvalues: l_Workspace_0 (copy)
        local l_ToolboxDebugFlags_3 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if not l_ToolboxDebugFlags_3 then
            return false;
        else
            local l_ToolboxDisableTooltips_0 = l_ToolboxDebugFlags_3:FindFirstChild("ToolboxDisableTooltips");
            if l_ToolboxDisableTooltips_0 then
                return l_ToolboxDisableTooltips_0.Value;
            else
                return false;
            end;
        end;
    end, 
    shouldDebugUrls = function() --[[ Line: 43 ]] --[[ Name: shouldDebugUrls ]]
        -- upvalues: l_Workspace_0 (copy)
        local l_ToolboxDebugFlags_4 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if not l_ToolboxDebugFlags_4 then
            return false;
        else
            local l_ToolboxDebugUrls_0 = l_ToolboxDebugFlags_4:FindFirstChild("ToolboxDebugUrls");
            if l_ToolboxDebugUrls_0 then
                return l_ToolboxDebugUrls_0.Value;
            else
                return false;
            end;
        end;
    end, 
    shouldDebugState = function() --[[ Line: 47 ]] --[[ Name: shouldDebugState ]]
        -- upvalues: l_Workspace_0 (copy)
        local l_ToolboxDebugFlags_5 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if not l_ToolboxDebugFlags_5 then
            return false;
        else
            local l_ToolboxDebugState_0 = l_ToolboxDebugFlags_5:FindFirstChild("ToolboxDebugState");
            if l_ToolboxDebugState_0 then
                return l_ToolboxDebugState_0.Value;
            else
                return false;
            end;
        end;
    end, 
    shouldDebugWarnings = function() --[[ Line: 51 ]] --[[ Name: shouldDebugWarnings ]]
        -- upvalues: l_Workspace_0 (copy)
        local l_ToolboxDebugFlags_6 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if not l_ToolboxDebugFlags_6 then
            return false;
        else
            local l_ToolboxDebugWarnings_0 = l_ToolboxDebugFlags_6:FindFirstChild("ToolboxDebugWarnings");
            if l_ToolboxDebugWarnings_0 then
                return l_ToolboxDebugWarnings_0.Value;
            else
                return false;
            end;
        end;
    end, 
    shouldLogSettings = function() --[[ Line: 55 ]] --[[ Name: shouldLogSettings ]]
        -- upvalues: l_Workspace_0 (copy)
        local l_ToolboxDebugFlags_7 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if not l_ToolboxDebugFlags_7 then
            return false;
        else
            local l_ToolboxLogSettings_0 = l_ToolboxDebugFlags_7:FindFirstChild("ToolboxLogSettings");
            if l_ToolboxLogSettings_0 then
                return l_ToolboxLogSettings_0.Value;
            else
                return false;
            end;
        end;
    end, 
    shouldUseTestCustomLocale = function() --[[ Line: 59 ]] --[[ Name: shouldUseTestCustomLocale ]]
        -- upvalues: l_Workspace_0 (copy)
        local l_ToolboxDebugFlags_8 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if not l_ToolboxDebugFlags_8 then
            return false;
        else
            local l_ToolboxUseTestCustomLocale_0 = l_ToolboxDebugFlags_8:FindFirstChild("ToolboxUseTestCustomLocale");
            if l_ToolboxUseTestCustomLocale_0 then
                return l_ToolboxUseTestCustomLocale_0.Value;
            else
                return false;
            end;
        end;
    end, 
    shouldUseTestRealLocale = function() --[[ Line: 63 ]] --[[ Name: shouldUseTestRealLocale ]]
        -- upvalues: l_Workspace_0 (copy)
        local l_ToolboxDebugFlags_9 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if not l_ToolboxDebugFlags_9 then
            return false;
        else
            local l_ToolboxUseTestRealLocaleId_0 = l_ToolboxDebugFlags_9:FindFirstChild("ToolboxUseTestRealLocaleId");
            if l_ToolboxUseTestRealLocaleId_0 then
                return l_ToolboxUseTestRealLocaleId_0.Value;
            else
                return false;
            end;
        end;
    end, 
    getOrCreateTestCustomLocale = function() --[[ Line: 67 ]] --[[ Name: getOrCreateTestCustomLocale ]]
        -- upvalues: l_Workspace_0 (copy)
        local l_ToolboxDebugFlags_10 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if not l_ToolboxDebugFlags_10 then
            l_ToolboxDebugFlags_10 = Instance.new("Folder");
            l_ToolboxDebugFlags_10.Name = "ToolboxDebugFlags";
            l_ToolboxDebugFlags_10.Parent = l_Workspace_0;
        end;
        local l_l_ToolboxDebugFlags_10_0 = l_ToolboxDebugFlags_10;
        l_ToolboxDebugFlags_10 = l_l_ToolboxDebugFlags_10_0:FindFirstChild("ToolboxCustomLocale");
        if not l_ToolboxDebugFlags_10 then
            l_ToolboxDebugFlags_10 = Instance.new("StringValue");
            l_ToolboxDebugFlags_10.Name = "ToolboxCustomLocale";
            l_ToolboxDebugFlags_10.Value = "CustomLocale";
            l_ToolboxDebugFlags_10.Parent = l_l_ToolboxDebugFlags_10_0;
        end;
        return l_ToolboxDebugFlags_10;
    end, 
    getOrCreateTestRealLocale = function() --[[ Line: 82 ]] --[[ Name: getOrCreateTestRealLocale ]]
        -- upvalues: l_Workspace_0 (copy)
        local l_ToolboxDebugFlags_11 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if not l_ToolboxDebugFlags_11 then
            l_ToolboxDebugFlags_11 = Instance.new("Folder");
            l_ToolboxDebugFlags_11.Name = "ToolboxDebugFlags";
            l_ToolboxDebugFlags_11.Parent = l_Workspace_0;
        end;
        local l_l_ToolboxDebugFlags_11_0 = l_ToolboxDebugFlags_11;
        l_ToolboxDebugFlags_11 = l_l_ToolboxDebugFlags_11_0:FindFirstChild("ToolboxRealLocale");
        if not l_ToolboxDebugFlags_11 then
            l_ToolboxDebugFlags_11 = Instance.new("StringValue");
            l_ToolboxDebugFlags_11.Name = "ToolboxRealLocale";
            l_ToolboxDebugFlags_11.Value = "en-us";
            l_ToolboxDebugFlags_11.Parent = l_l_ToolboxDebugFlags_11_0;
        end;
        return l_ToolboxDebugFlags_11;
    end
};