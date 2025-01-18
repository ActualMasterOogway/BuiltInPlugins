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
    while l_v8_0 ~= nil and l_v8_0 ~= v9 do
        table.insert(v10, (l_v8_0.Name:gsub("%.spec$", "")));
        l_v8_0 = l_v8_0.Parent;
    end;
    table.insert(v10, (v9.Name:gsub("%.spec$", "")));
    return v10;
end;
v3.getModules = function(_, v14) --[[ Line: 36 ]] --[[ Name: getModules ]]
    -- upvalues: v12 (copy)
    local v15 = {};
    if v14:IsA("ModuleScript") and v14.Name:match("%.spec$") then
        local v16 = require(v14);
        local v17 = v12(v14, v14);
        table.insert(v15, {
            method = v16, 
            path = v17
        });
    end;
    for _, v19 in ipairs(v14:GetDescendants()) do
        if v19:IsA("ModuleScript") and v19.Name:match("%.spec$") then
            local v20 = require(v19);
            local v21 = v12(v19, v14);
            table.insert(v15, {
                method = v20, 
                path = v21
            });
        end;
    end;
    table.sort(v15, function(v22, v23) --[[ Line: 61 ]]
        return v22.path[#v22.path]:lower() < v23.path[#v23.path]:lower();
    end);
    return v15;
end;
v3.run = function(v24, v25, v26, v27) --[[ Line: 83 ]] --[[ Name: run ]]
    -- upvalues: v2 (copy), v0 (copy), v1 (copy)
    v26 = v26 or v2;
    v27 = v27 or {};
    local v28 = v27.showTimingInfo or false;
    local v29 = v27.noXpcallByDefault or false;
    local l_testNamePattern_0 = v27.testNamePattern;
    local v31 = v27.extraEnvironment or {};
    if type(v25) ~= "table" then
        error(("Bad argument #1 to TestBootstrap:run. Expected table, got %s"):format((typeof(v25))), 2);
    end;
    local v32 = tick();
    local v33 = {};
    for _, v35 in ipairs(v25) do
        local v36 = v24:getModules(v35);
        for _, v38 in ipairs(v36) do
            table.insert(v33, v38);
        end;
    end;
    local v39 = tick();
    local v40 = v0.createPlan(v33, v29, l_testNamePattern_0, v31);
    local v41 = tick();
    local v42 = v1.runPlan(v40);
    local v43 = tick();
    v26.report(v42);
    local v44 = tick();
    if v28 then
        local v45 = {
            ("Took %f seconds to locate test modules"):format(v39 - v32), 
            ("Took %f seconds to create test plan"):format(v41 - v39), 
            ("Took %f seconds to run tests"):format(v43 - v41), 
            ("Took %f seconds to report tests"):format(v44 - v43)
        };
        print(table.concat(v45, "\n"));
    end;
    return v42;
end;
return v3;