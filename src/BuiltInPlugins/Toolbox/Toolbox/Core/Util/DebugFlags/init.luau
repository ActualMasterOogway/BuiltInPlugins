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
        return nil;
    else
        local l_l_ToolboxDebugFlags_1_FirstChild_0 = l_ToolboxDebugFlags_1:FindFirstChild(v4);
        if l_l_ToolboxDebugFlags_1_FirstChild_0 then
            return l_l_ToolboxDebugFlags_1_FirstChild_0.Value;
        else
            return nil;
        end;
    end;
end;
local v8 = {};
game:DefineFastFlag("DebugToolboxRunTests", false);
v8.shouldRunTests = function() --[[ Line: 35 ]] --[[ Name: shouldRunTests ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_DebugToolboxRunTests_0 = game:GetFastFlag("DebugToolboxRunTests");
    if not l_DebugToolboxRunTests_0 then
        local l_ToolboxDebugFlags_2 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if not l_ToolboxDebugFlags_2 then
            return nil;
        else
            local l_RunTests_0 = l_ToolboxDebugFlags_2:FindFirstChild("RunTests");
            if l_RunTests_0 then
                return l_RunTests_0.Value;
            else
                l_DebugToolboxRunTests_0 = nil;
            end;
        end;
    end;
    return l_DebugToolboxRunTests_0;
end;
game:DefineFastFlag("DebugToolboxRunRhodiumTests", false);
v8.shouldRunRhodiumTests = function() --[[ Line: 40 ]] --[[ Name: shouldRunRhodiumTests ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_DebugToolboxRunRhodiumTests_0 = game:GetFastFlag("DebugToolboxRunRhodiumTests");
    if not l_DebugToolboxRunRhodiumTests_0 then
        local l_ToolboxDebugFlags_3 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if not l_ToolboxDebugFlags_3 then
            return nil;
        else
            local l_RunRhodiumTests_0 = l_ToolboxDebugFlags_3:FindFirstChild("RunRhodiumTests");
            if l_RunRhodiumTests_0 then
                return l_RunRhodiumTests_0.Value;
            else
                l_DebugToolboxRunRhodiumTests_0 = nil;
            end;
        end;
    end;
    return l_DebugToolboxRunRhodiumTests_0;
end;
game:DefineFastFlag("DebugToolboxRunJest3Tests", false);
v8.shouldRunJest3Tests = function() --[[ Line: 45 ]] --[[ Name: shouldRunJest3Tests ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_DebugToolboxRunJest3Tests_0 = game:GetFastFlag("DebugToolboxRunJest3Tests");
    if not l_DebugToolboxRunJest3Tests_0 then
        local l_ToolboxDebugFlags_4 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if not l_ToolboxDebugFlags_4 then
            return nil;
        else
            local l_RunJest3Tests_0 = l_ToolboxDebugFlags_4:FindFirstChild("RunJest3Tests");
            if l_RunJest3Tests_0 then
                return l_RunJest3Tests_0.Value;
            else
                l_DebugToolboxRunJest3Tests_0 = nil;
            end;
        end;
    end;
    return l_DebugToolboxRunJest3Tests_0;
end;
game:DefineFastFlag("DebugToolboxLogTestsQuiet", false);
v8.logTestsQuiet = function() --[[ Line: 50 ]] --[[ Name: logTestsQuiet ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_DebugToolboxLogTestsQuiet_0 = game:GetFastFlag("DebugToolboxLogTestsQuiet");
    if not l_DebugToolboxLogTestsQuiet_0 then
        local l_ToolboxDebugFlags_5 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if not l_ToolboxDebugFlags_5 then
            return nil;
        else
            local l_LogTestsQuiet_0 = l_ToolboxDebugFlags_5:FindFirstChild("LogTestsQuiet");
            if l_LogTestsQuiet_0 then
                return l_LogTestsQuiet_0.Value;
            else
                l_DebugToolboxLogTestsQuiet_0 = nil;
            end;
        end;
    end;
    return l_DebugToolboxLogTestsQuiet_0;
end;
game:DefineFastFlag("DebugToolboxDisableTooltips", false);
v8.shouldDisableTooltips = function() --[[ Line: 56 ]] --[[ Name: shouldDisableTooltips ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_DebugToolboxDisableTooltips_0 = game:GetFastFlag("DebugToolboxDisableTooltips");
    if not l_DebugToolboxDisableTooltips_0 then
        local l_ToolboxDebugFlags_6 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if not l_ToolboxDebugFlags_6 then
            return nil;
        else
            local l_ToolboxDisableTooltips_0 = l_ToolboxDebugFlags_6:FindFirstChild("ToolboxDisableTooltips");
            if l_ToolboxDisableTooltips_0 then
                return l_ToolboxDisableTooltips_0.Value;
            else
                l_DebugToolboxDisableTooltips_0 = nil;
            end;
        end;
    end;
    return l_DebugToolboxDisableTooltips_0;
end;
game:DefineFastFlag("DebugToolboxDebugUrls", false);
v8.shouldDebugUrls = function() --[[ Line: 61 ]] --[[ Name: shouldDebugUrls ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_DebugToolboxDebugUrls_0 = game:GetFastFlag("DebugToolboxDebugUrls");
    if not l_DebugToolboxDebugUrls_0 then
        local l_ToolboxDebugFlags_7 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if not l_ToolboxDebugFlags_7 then
            return nil;
        else
            local l_ToolboxDebugUrls_0 = l_ToolboxDebugFlags_7:FindFirstChild("ToolboxDebugUrls");
            if l_ToolboxDebugUrls_0 then
                return l_ToolboxDebugUrls_0.Value;
            else
                l_DebugToolboxDebugUrls_0 = nil;
            end;
        end;
    end;
    return l_DebugToolboxDebugUrls_0;
end;
game:DefineFastFlag("DebugToolboxDebugState", false);
v8.shouldDebugState = function() --[[ Line: 66 ]] --[[ Name: shouldDebugState ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_DebugToolboxDebugState_0 = game:GetFastFlag("DebugToolboxDebugState");
    if not l_DebugToolboxDebugState_0 then
        local l_ToolboxDebugFlags_8 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if not l_ToolboxDebugFlags_8 then
            return nil;
        else
            local l_ToolboxDebugState_0 = l_ToolboxDebugFlags_8:FindFirstChild("ToolboxDebugState");
            if l_ToolboxDebugState_0 then
                return l_ToolboxDebugState_0.Value;
            else
                l_DebugToolboxDebugState_0 = nil;
            end;
        end;
    end;
    return l_DebugToolboxDebugState_0;
end;
game:DefineFastFlag("DebugToolboxLogAnalytics", false);
v8.shouldLogAnalytics = function() --[[ Line: 71 ]] --[[ Name: shouldLogAnalytics ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_DebugToolboxLogAnalytics_0 = game:GetFastFlag("DebugToolboxLogAnalytics");
    if not l_DebugToolboxLogAnalytics_0 then
        local l_ToolboxDebugFlags_9 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if not l_ToolboxDebugFlags_9 then
            return nil;
        else
            local l_ToolboxLogAnalytics_0 = l_ToolboxDebugFlags_9:FindFirstChild("ToolboxLogAnalytics");
            if l_ToolboxLogAnalytics_0 then
                return l_ToolboxLogAnalytics_0.Value;
            else
                l_DebugToolboxLogAnalytics_0 = nil;
            end;
        end;
    end;
    return l_DebugToolboxLogAnalytics_0;
end;
game:DefineFastFlag("DebugToolboxDebugWarnings", false);
v8.shouldDebugWarnings = function() --[[ Line: 76 ]] --[[ Name: shouldDebugWarnings ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_DebugToolboxDebugWarnings_0 = game:GetFastFlag("DebugToolboxDebugWarnings");
    if not l_DebugToolboxDebugWarnings_0 then
        local l_ToolboxDebugFlags_10 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if not l_ToolboxDebugFlags_10 then
            return nil;
        else
            local l_ToolboxDebugWarnings_0 = l_ToolboxDebugFlags_10:FindFirstChild("ToolboxDebugWarnings");
            if l_ToolboxDebugWarnings_0 then
                return l_ToolboxDebugWarnings_0.Value;
            else
                l_DebugToolboxDebugWarnings_0 = nil;
            end;
        end;
    end;
    return l_DebugToolboxDebugWarnings_0;
end;
game:DefineFastFlag("DebugToolboxLogSettings", false);
v8.shouldLogSettings = function() --[[ Line: 81 ]] --[[ Name: shouldLogSettings ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_DebugToolboxLogSettings_0 = game:GetFastFlag("DebugToolboxLogSettings");
    if not l_DebugToolboxLogSettings_0 then
        local l_ToolboxDebugFlags_11 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if not l_ToolboxDebugFlags_11 then
            return nil;
        else
            local l_ToolboxLogSettings_0 = l_ToolboxDebugFlags_11:FindFirstChild("ToolboxLogSettings");
            if l_ToolboxLogSettings_0 then
                return l_ToolboxLogSettings_0.Value;
            else
                l_DebugToolboxLogSettings_0 = nil;
            end;
        end;
    end;
    return l_DebugToolboxLogSettings_0;
end;
game:DefineFastFlag("DebugToolboxUseTestCustomLocale", false);
v8.shouldUseTestCustomLocale = function() --[[ Line: 86 ]] --[[ Name: shouldUseTestCustomLocale ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_DebugToolboxUseTestCustomLocale_0 = game:GetFastFlag("DebugToolboxUseTestCustomLocale");
    if not l_DebugToolboxUseTestCustomLocale_0 then
        local l_ToolboxDebugFlags_12 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if not l_ToolboxDebugFlags_12 then
            return nil;
        else
            local l_ToolboxUseTestCustomLocale_0 = l_ToolboxDebugFlags_12:FindFirstChild("ToolboxUseTestCustomLocale");
            if l_ToolboxUseTestCustomLocale_0 then
                return l_ToolboxUseTestCustomLocale_0.Value;
            else
                l_DebugToolboxUseTestCustomLocale_0 = nil;
            end;
        end;
    end;
    return l_DebugToolboxUseTestCustomLocale_0;
end;
game:DefineFastFlag("DebugToolboxUseTestRealLocaleId", false);
v8.shouldUseTestRealLocale = function() --[[ Line: 91 ]] --[[ Name: shouldUseTestRealLocale ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_DebugToolboxUseTestRealLocaleId_0 = game:GetFastFlag("DebugToolboxUseTestRealLocaleId");
    if not l_DebugToolboxUseTestRealLocaleId_0 then
        local l_ToolboxDebugFlags_13 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if not l_ToolboxDebugFlags_13 then
            return nil;
        else
            local l_ToolboxUseTestRealLocaleId_0 = l_ToolboxDebugFlags_13:FindFirstChild("ToolboxUseTestRealLocaleId");
            if l_ToolboxUseTestRealLocaleId_0 then
                return l_ToolboxUseTestRealLocaleId_0.Value;
            else
                l_DebugToolboxUseTestRealLocaleId_0 = nil;
            end;
        end;
    end;
    return l_DebugToolboxUseTestRealLocaleId_0;
end;
game:DefineFastFlag("DebugToolboxDebugOverrideAssetLoading", false);
v8.shouldDebugOverrideAssetLoading = function() --[[ Line: 96 ]] --[[ Name: shouldDebugOverrideAssetLoading ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_DebugToolboxDebugOverrideAssetLoading_0 = game:GetFastFlag("DebugToolboxDebugOverrideAssetLoading");
    if not l_DebugToolboxDebugOverrideAssetLoading_0 then
        local l_ToolboxDebugFlags_14 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if not l_ToolboxDebugFlags_14 then
            return nil;
        else
            local l_ToolboxDebugOverrideAssetLoading_0 = l_ToolboxDebugFlags_14:FindFirstChild("ToolboxDebugOverrideAssetLoading");
            if l_ToolboxDebugOverrideAssetLoading_0 then
                return l_ToolboxDebugOverrideAssetLoading_0.Value;
            else
                l_DebugToolboxDebugOverrideAssetLoading_0 = nil;
            end;
        end;
    end;
    return l_DebugToolboxDebugOverrideAssetLoading_0;
end;
v8.getOrCreateTestCustomLocale = function() --[[ Line: 101 ]] --[[ Name: getOrCreateTestCustomLocale ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_ToolboxDebugFlags_15 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
    if not l_ToolboxDebugFlags_15 then
        l_ToolboxDebugFlags_15 = Instance.new("Folder");
        l_ToolboxDebugFlags_15.Name = "ToolboxDebugFlags";
        l_ToolboxDebugFlags_15.Parent = l_Workspace_0;
    end;
    local l_l_ToolboxDebugFlags_15_0 = l_ToolboxDebugFlags_15;
    l_ToolboxDebugFlags_15 = l_l_ToolboxDebugFlags_15_0:FindFirstChild("ToolboxCustomLocale");
    if not l_ToolboxDebugFlags_15 then
        l_ToolboxDebugFlags_15 = Instance.new("StringValue");
        l_ToolboxDebugFlags_15.Name = "ToolboxCustomLocale";
        l_ToolboxDebugFlags_15.Value = "CustomLocale";
        l_ToolboxDebugFlags_15.Parent = l_l_ToolboxDebugFlags_15_0;
    end;
    return l_ToolboxDebugFlags_15;
end;
v8.getOrCreateTestRealLocale = function() --[[ Line: 116 ]] --[[ Name: getOrCreateTestRealLocale ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_ToolboxDebugFlags_16 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
    if not l_ToolboxDebugFlags_16 then
        l_ToolboxDebugFlags_16 = Instance.new("Folder");
        l_ToolboxDebugFlags_16.Name = "ToolboxDebugFlags";
        l_ToolboxDebugFlags_16.Parent = l_Workspace_0;
    end;
    local l_l_ToolboxDebugFlags_16_0 = l_ToolboxDebugFlags_16;
    l_ToolboxDebugFlags_16 = l_l_ToolboxDebugFlags_16_0:FindFirstChild("ToolboxRealLocale");
    if not l_ToolboxDebugFlags_16 then
        l_ToolboxDebugFlags_16 = Instance.new("StringValue");
        l_ToolboxDebugFlags_16.Name = "ToolboxRealLocale";
        l_ToolboxDebugFlags_16.Value = "en-us";
        l_ToolboxDebugFlags_16.Parent = l_l_ToolboxDebugFlags_16_0;
    end;
    return l_ToolboxDebugFlags_16;
end;
return v8;