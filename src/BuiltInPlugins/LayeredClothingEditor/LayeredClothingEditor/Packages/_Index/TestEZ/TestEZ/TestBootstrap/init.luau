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
            method = v24, 
            path = l_v22_0, 
            pathStringForSorting = v25:lower()
        });
    end;
end;
v3.getModules = function(v29, v30) --[[ Line: 72 ]] --[[ Name: getModules ]]
    local v31 = {};
    v29:getModulesImpl(v30, v31);
    for _, v33 in ipairs(v30:GetDescendants()) do
        v29:getModulesImpl(v30, v31, v33);
    end;
    return v31;
end;
v3.run = function(v34, v35, v36, v37) --[[ Line: 99 ]] --[[ Name: run ]]
    -- upvalues: v2 (copy), v0 (copy), v1 (copy)
    v36 = v36 or v2;
    v37 = v37 or {};
    local v38 = v37.showTimingInfo or false;
    local l_testNamePattern_0 = v37.testNamePattern;
    local v40 = v37.extraEnvironment or {};
    if type(v35) ~= "table" then
        error(("Bad argument #1 to TestBootstrap:run. Expected table, got %s"):format((typeof(v35))), 2);
    end;
    local v41 = tick();
    local v42 = {};
    for _, v44 in ipairs(v35) do
        local v45 = v34:getModules(v44);
        for _, v47 in ipairs(v45) do
            table.insert(v42, v47);
        end;
    end;
    local v48 = tick();
    local v49 = v0.createPlan(v42, l_testNamePattern_0, v40);
    local v50 = tick();
    local v51 = v1.runPlan(v49);
    local v52 = tick();
    v36.report(v51);
    local v53 = tick();
    if v38 then
        local v54 = {
            ("Took %f seconds to locate test modules"):format(v48 - v41), 
            ("Took %f seconds to create test plan"):format(v50 - v48), 
            ("Took %f seconds to run tests"):format(v52 - v50), 
            ("Took %f seconds to report tests"):format(v53 - v52)
        };
        print(table.concat(v54, "\n"));
    end;
    return v51;
end;
return v3;