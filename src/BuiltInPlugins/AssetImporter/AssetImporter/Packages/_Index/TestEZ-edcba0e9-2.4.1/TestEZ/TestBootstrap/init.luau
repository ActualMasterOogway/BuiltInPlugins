local v0 = require(script.Parent.TestPlanner);
local v1 = require(script.Parent.TestRunner);
local v2 = require(script.Parent.Reporters.TextReporter);
local v3 = {};
local function _(v4) --[[ Line: 11 ]] --[[ Name: stripSpecSuffix ]]
    return (v4:gsub("%.spec$", ""));
end;
local function _(v6) --[[ Line: 14 ]] --[[ Name: isSpecScript ]]
    return v6:IsA("ModuleScript") and v6.Name:match("%.spec$");
end;
local function v12(v8, v9) --[[ Line: 18 ]] --[[ Name: getPath ]]
    v9 = v9 or game;
    local v10 = {};
    local l_v8_0 = v8;
    if l_v8_0.Name == "init.spec" then
        l_v8_0 = l_v8_0.Parent;
    end;
    while l_v8_0 ~= nil and l_v8_0 ~= v9 do
        table.insert(v10, (l_v8_0.Name:gsub("%.spec$", "")));
        l_v8_0 = l_v8_0.Parent;
    end;
    table.insert(v10, (v9.Name:gsub("%.spec$", "")));
    return v10;
end;
local _ = function(v13) --[[ Line: 38 ]] --[[ Name: toStringPath ]]
    local v14 = "";
    local v15 = true;
    for _, v17 in ipairs(v13) do
        if v15 then
            v14 = v17;
            v15 = false;
        else
            v14 = v17 .. " " .. v14;
        end;
    end;
    return v14;
end;
v3.getModulesImpl = function(_, v20, v21, v22) --[[ Line: 52 ]] --[[ Name: getModulesImpl ]]
    -- upvalues: v12 (copy)
    v21 = v21 or {};
    v22 = v22 or v20;
    local l_v22_0 = v22;
    if l_v22_0:IsA("ModuleScript") and l_v22_0.Name:match("%.spec$") then
        local v24 = require(v22);
        l_v22_0 = v12(v22, v20);
        local v25 = "";
        local v26 = true;
        for _, v28 in ipairs(l_v22_0) do
            if v26 then
                v25 = v28;
                v26 = false;
            else
                v25 = v28 .. " " .. v25;
            end;
        end;
        table.insert(v21, {
            instance = v22, 
            method = v24, 
            path = l_v22_0, 
            pathStringForSorting = v25:lower()
        });
    end;
end;
v3.getModules = function(v29, v30) --[[ Line: 73 ]] --[[ Name: getModules ]]
    local v31 = {};
    v29:getModulesImpl(v30, v31);
    for _, v33 in ipairs(v30:GetDescendants()) do
        v29:getModulesImpl(v30, v31, v33);
    end;
    return v31;
end;
v3.run = function(v34, v35, v36, v37) --[[ Line: 100 ]] --[[ Name: run ]]
    -- upvalues: v2 (copy), v0 (copy), v1 (copy)
    v36 = v36 or v2;
    v37 = v37 or {};
    local v38 = v37.showTimingInfo or false;
    local v39 = {};
    local l_TESTEZ_TEST_NAME_PATTERN_0 = _G.TESTEZ_TEST_NAME_PATTERN;
    local l_TESTEZ_TEST_PATH_PATTERN_0 = _G.TESTEZ_TEST_PATH_PATTERN;
    local l_TESTEZ_TEST_PATH_IGNORE_PATTERNS_0 = _G.TESTEZ_TEST_PATH_IGNORE_PATTERNS;
    local v43 = v37.extraEnvironment or {};
    for v44 in string.gmatch(_G.TESTEZ_RUN_TESTS_PATH or "", "([^,]+)") do
        table.insert(v39, v44);
    end;
    if type(v35) ~= "table" then
        error(("Bad argument #1 to TestBootstrap:run. Expected table, got %s"):format((typeof(v35))), 2);
    end;
    local v45 = tick();
    local v46 = {};
    for _, v48 in ipairs(v35) do
        local v49 = v34:getModules(v48);
        for _, v51 in ipairs(v49) do
            table.insert(v46, v51);
        end;
    end;
    local v52 = tick();
    local v53 = {
        runTestsByPath = v39, 
        testNamePattern = l_TESTEZ_TEST_NAME_PATTERN_0, 
        testPathPattern = l_TESTEZ_TEST_PATH_PATTERN_0, 
        testPathIgnorePatterns = l_TESTEZ_TEST_PATH_IGNORE_PATTERNS_0, 
        extraEnvironment = v43
    };
    local v54 = v0.createPlan(v46, v53);
    local v55 = tick();
    local v56 = v1.runPlan(v54);
    local v57 = tick();
    v36.report(v56);
    local v58 = tick();
    if v38 then
        local v59 = {
            ("Took %f seconds to locate test modules"):format(v52 - v45), 
            ("Took %f seconds to create test plan"):format(v55 - v52), 
            ("Took %f seconds to run tests"):format(v57 - v55), 
            ("Took %f seconds to report tests"):format(v58 - v57)
        };
        print(table.concat(v59, "\n"));
    end;
    return v56;
end;
return v3;