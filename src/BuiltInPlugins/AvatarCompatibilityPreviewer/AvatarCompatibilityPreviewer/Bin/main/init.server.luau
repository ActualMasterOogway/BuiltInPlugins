local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_TestService_0 = game:GetService("TestService");
local l_Workspace_0 = game:GetService("Workspace");
if not plugin then
    return;
else
    local l_Parent_0 = script.Parent.Parent;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 18 ]]
        return game:GetService("ProcessService");
    end);
    if l_status_0 then
        local l_runCLI_0 = require(l_Parent_0.Packages.Dev.Jest).runCLI;
        _G.__ROACT_17_MOCK_SCHEDULER__ = true;
        _G.__ROACT_17_INLINE_ACT__ = true;
        local v8 = game:DefineFastFlag("DebugAvatarPreviewerUpdateSnapshots", false);
        local v9 = game:DefineFastString("DebugAvatarPreviewerTestPathPattern", "");
        local v10, v11 = l_runCLI_0(l_Parent_0.Src, {
            verbose = true, 
            ci = true, 
            updateSnapshot = v8, 
            testPathPattern = if v9 == "" then nil else v9
        }, {
            l_Parent_0.Src, 
            l_Parent_0.RhodiumTests
        }):awaitStatus();
        if v10 ~= "Resolved" or v11.results.numFailedTestSuites > 0 or v11.results.numFailedTests > 0 then
            if v10 == "Rejected" then
                print(v11);
            end;
            l_TestService_0:Error("Jest 3 test run failed");
            l_result_0:ExitAsync(1);
            return;
        else
            l_result_0:ExitAsync(0);
            return;
        end;
    else
        local v12 = require(l_Parent_0.Packages.React);
        local v13 = require(l_Parent_0.Packages.ReactRoblox);
        local v14 = require(l_Parent_0.Src.Util.Constants);
        local v15 = require(l_Parent_0.Src.MainPlugin);
        local v16 = require(l_Parent_0.Src.Util.TestInExperienceUtil);
        local v17 = require(l_Parent_0.Src.Flags.getFFlagAvatarPreviewerEditingTools);
        local function v22() --[[ Line: 78 ]] --[[ Name: cleanupOldEditingTools ]]
            -- upvalues: v14 (copy), l_CoreGui_0 (copy), l_Workspace_0 (copy)
            for _, v19 in v14.EDITING_TOOLS_GUI_NAMES do
                local l_l_CoreGui_0_FirstChild_0 = l_CoreGui_0:FindFirstChild(v19);
                if l_l_CoreGui_0_FirstChild_0 ~= nil then
                    l_l_CoreGui_0_FirstChild_0:Destroy();
                end;
            end;
            local l_l_Workspace_0_FirstChild_0 = l_Workspace_0:FindFirstChild(v14.CLONED_DUMMY_NAME);
            if l_l_Workspace_0_FirstChild_0 ~= nil then
                l_l_Workspace_0_FirstChild_0:Destroy();
            end;
        end;
        local v23 = nil;
        local function v25() --[[ Line: 94 ]] --[[ Name: init ]]
            -- upvalues: l_Parent_0 (copy), v17 (copy), v22 (copy), v12 (copy), v15 (copy), v23 (ref), v13 (copy), l_RunService_0 (copy), v16 (copy)
            plugin.Name = l_Parent_0.Name;
            if v17() then
                v22();
            end;
            local v24 = v12.createElement(v15, {
                Plugin = plugin
            });
            v23 = v13.createRoot(Instance.new("Frame"));
            v23:render(v24);
            if not l_RunService_0:IsRunning() then
                v16.reset();
            end;
        end;
        plugin.Unloading:Connect(function() --[[ Line: 114 ]]
            -- upvalues: v23 (ref), v17 (copy), v22 (copy)
            if v23 then
                v23:render(nil);
                v23 = nil;
            end;
            if v17() then
                v22();
            end;
        end);
        v25();
        return;
    end;
end;