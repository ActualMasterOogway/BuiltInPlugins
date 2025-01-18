local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.types);
local v3 = require(l_Parent_0.isFTF);
local l_insert_0 = table.insert;
local function _(v5) --[[ Line: 9 ]] --[[ Name: findFirstJestConfig ]]
    local l_v5_FirstChild_0 = v5:FindFirstChild("jest.config", true);
    if l_v5_FirstChild_0 and l_v5_FirstChild_0:IsA("ModuleScript") then
        return l_v5_FirstChild_0;
    else
        return nil;
    end;
end;
local function v12(v8) --[[ Line: 22 ]] --[[ Name: requireAllModuleScripts ]]
    local l_v8_Descendants_0 = v8:GetDescendants();
    for _, v11 in ipairs(l_v8_Descendants_0) do
        if not v11.Name:match("%.test") and v11:IsA("ModuleScript") then
            require(v11);
        end;
    end;
end;
return function(v13, v14) --[[ Line: 41 ]] --[[ Name: runTestsInternal ]]
    -- upvalues: l_Parent_1 (copy), l_Parent_0 (copy), v3 (copy), v12 (copy), l_insert_0 (copy)
    _G.__DEV__ = v14.EnableRoactConfigs;
    _G.__ROACT_17_MOCK_SCHEDULER__ = true;
    _G.__ROACT_17_INLINE_ACT__ = true;
    local v15 = if l_Parent_1.Packages._Index:FindFirstChild("DeveloperFramework") then l_Parent_1.Packages._Index.DeveloperFramework.DeveloperFramework else nil;
    if v14.RunUnitTests then
        local v16 = require(l_Parent_0.Parent.Jest);
        print("----- All " .. l_Parent_1.Name .. " Tests (Jest 3) ------");
        local l_l_Parent_1_FirstChild_0 = l_Parent_1:FindFirstChild("jest.config", true);
        local v18 = if l_l_Parent_1_FirstChild_0 and l_l_Parent_1_FirstChild_0:IsA("ModuleScript") then l_l_Parent_1_FirstChild_0 else nil;
        assert(v18, (("failed to run Jest 3 tests for %* (no jest.config.lua file found)"):format(l_Parent_1)));
        local l_Parent_2 = v18.Parent;
        l_l_Parent_1_FirstChild_0 = {
            l_Parent_2
        };
        if v14.RunFeatureTests and v3() then
            table.insert(l_l_Parent_1_FirstChild_0, l_Parent_1.FeatureTests);
        end;
        local v20, v21 = v16.runCLI(l_Parent_2, {
            verbose = false, 
            ci = true, 
            testPathPattern = _G.LEST_TEST_NAME_PATTERN
        }, l_l_Parent_1_FirstChild_0):awaitStatus();
        if v20 == "Rejected" then
            print(v21);
        end;
        print("----------------------------------");
        if v20 ~= "Resolved" or v21.results.numFailedTestSuites > 0 or v21.results.numFailedTests > 0 then
            error("Jest 3 test run failed");
        end;
    end;
    if v14.RunTests or v14.RunRhodiumTests or v14.RunDeveloperFrameworkTests then
        local l_TestEZ_0 = require(l_Parent_1.Packages.Dev.JestGlobals).TestEZ;
        local l_TestBootstrap_0 = l_TestEZ_0.TestBootstrap;
        local l_TeamCityReporter_0 = l_TestEZ_0.Reporters.TeamCityReporter;
        local l_TextReporter_0 = l_TestEZ_0.Reporters.TextReporter;
        if v14.LogTestsQuiet then
            l_TextReporter_0 = l_TestEZ_0.Reporters.TextReporterQuiet;
        end;
        if _G.TEAMCITY then
            l_TextReporter_0 = l_TeamCityReporter_0;
        end;
        if v14.RunTests then
            v12(v13);
            print("----- All " .. l_Parent_1.Name .. " Tests (Jest 2) ------");
            l_TestBootstrap_0:run({
                v13
            }, l_TextReporter_0);
            print("----------------------------------");
        end;
        if v14.RunRhodiumTests then
            print("----- All " .. l_Parent_1.Name .. " Rhodium Tests ------");
            l_TestBootstrap_0:run({
                l_Parent_1.RhodiumTests
            }, l_TextReporter_0);
            print("----------------------------------");
        end;
        if v14.RunFeatureTests then
            print("----- All " .. l_Parent_1.Name .. " Feature Tests ------");
            l_TestBootstrap_0:run({
                l_Parent_1.FeatureTests
            }, l_TextReporter_0);
            print("----------------------------------");
        end;
        if v15 and v14.RunDeveloperFrameworkTests then
            print("----- All DeveloperFramework Tests ------");
            local v26 = {};
            for _, v28 in ipairs(v15:GetChildren()) do
                local v29 = true;
                if v28.ClassName ~= "Folder" then
                    v29 = v28.ClassName == "ModuleScript";
                end;
                if v29 and v28.Name ~= "packages" then
                    l_insert_0(v26, v28);
                end;
            end;
            l_TestBootstrap_0:run(v26, l_TextReporter_0);
            print("----------------------------------");
        end;
    end;
end;