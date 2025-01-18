local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.ModuleLoader);
local v3 = require(l_Parent_0.getDebugFlags);
local v4 = require(l_Parent_0.isCli);
local _ = require(l_Parent_0.types);
local function v11(v6, v7, v8) --[[ Line: 10 ]] --[[ Name: runAndCheck ]]
    -- upvalues: v4 (copy)
    local l_status_0, l_result_0 = pcall(v6, v7, v8);
    if not l_status_0 then
        warn(l_result_0);
    end;
    if v4() then
        game:GetService("ProcessService"):ExitAsync(l_status_0 and 0 or 1);
    end;
end;
return function(v12, v13) --[[ Line: 21 ]] --[[ Name: launch ]]
    -- upvalues: v3 (copy), l_Parent_1 (copy), v4 (copy), v2 (copy), v11 (copy)
    local v14 = v3(v12);
    if v14.EnableRoactConfigs then
        _G.__DEV__ = true;
        if not l_Parent_1.Packages:FindFirstChild("React") and l_Parent_1.Packages:FindFirstChild("Roact") then
            require(l_Parent_1.Packages.Roact).setGlobalConfig({
                elementTracing = true, 
                propValidation = true, 
                typeChecks = true
            });
        end;
    end;
    if not v14.RunTests and not v14.RunRhodiumTests and not v14.RunUnitTests then
        return;
    else
        if v4() then
            _G.__ROACT_17_MOCK_SCHEDULER__ = true;
        end;
        if (l_Parent_1.Packages:FindFirstChild("React") and true or if l_Parent_1.Packages:FindFirstChild("Roact") then require(l_Parent_1.Packages.Roact).Ref == "ref" else false) and not v4() then
            local v15 = v2:load(script.Parent.runTestsInternal);
            v11(v15, v13, v14);
            return;
        else
            local v16 = require(script.Parent.runTestsInternal);
            v11(v16, v13, v14);
            return;
        end;
    end;
end;