local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local v4 = require(l_Parent_0.Promise);
local v5 = require(l_Parent_0.RegExp);
local v6 = {};
local _ = require(l_Parent_0.JestTestResult);
local _ = require(l_Parent_0.JestTypes);
local _ = require(l_Parent_0.JestRuntime);
local v10 = require(l_Parent_0.JestUtil);
local l_globsToMatcher_0 = v10.globsToMatcher;
local l_testPathPatternToRegExp_0 = v10.testPathPatternToRegExp;
local _ = require(script.Parent.types);
local _ = require(l_Parent_0.JestTypes);
local l_getRelativePath_0 = require(l_Parent_0.RobloxShared).getRelativePath;
local function v20(v16) --[[ Line: 65 ]] --[[ Name: getAllFiles ]]
    -- upvalues: l_Array_0 (copy), l_getRelativePath_0 (copy)
    local l_Descendants_0 = v16.config.rootDir:GetDescendants();
    return l_Array_0.map(l_Array_0.filter(l_Descendants_0, function(v18) --[[ Line: 68 ]]
        return v18:isA("ModuleScript");
    end), function(v19) --[[ Line: 71 ]]
        -- upvalues: l_getRelativePath_0 (ref), v16 (copy)
        return {
            path = l_getRelativePath_0(v19, v16.config.rootDir), 
            script = v19
        };
    end);
end;
local function _(v21) --[[ Line: 98 ]] --[[ Name: regexToMatcher ]]
    -- upvalues: l_Array_0 (copy), v5 (copy)
    local v23 = l_Array_0.map(v21, function(v22) --[[ Line: 99 ]]
        -- upvalues: v5 (ref)
        return v5(v22);
    end);
    return function(v24) --[[ Line: 102 ]]
        -- upvalues: l_Array_0 (ref), v23 (copy)
        return l_Array_0.some(v23, function(v25) --[[ Line: 103 ]]
            -- upvalues: v24 (copy)
            local v26 = v25:test(v24);
            v25.lastIndex = 0;
            return v26;
        end);
    end;
end;
local function _(v28, v29) --[[ Line: 114 ]] --[[ Name: toTests ]]
    -- upvalues: l_Array_0 (copy)
    return l_Array_0.map(v29, function(v30) --[[ Line: 120 ]]
        -- upvalues: v28 (copy)
        return {
            context = v28, 
            duration = nil, 
            path = v30.path, 
            script = v30.script
        };
    end);
end;
local v32 = {};
v32.__index = v32;
v32.new = function(v33) --[[ Line: 240 ]] --[[ Name: new ]]
    -- upvalues: v32 (copy), l_globsToMatcher_0 (copy), v5 (copy), l_Array_0 (copy)
    local v34 = setmetatable({}, v32);
    v34._testPathCases = {};
    local l_config_0 = v33.config;
    v34._context = v33;
    v34._dependencyResolver = nil;
    if #l_config_0.testMatch > 0 then
        table.insert(v34._testPathCases, {
            isMatch = l_globsToMatcher_0(l_config_0.testMatch), 
            stat = "testMatch"
        });
    end;
    if #l_config_0.testPathIgnorePatterns > 0 then
        local v36 = v5(l_Array_0.join(l_config_0.testPathIgnorePatterns, "|"));
        table.insert(v34._testPathCases, {
            isMatch = function(v37) --[[ Line: 269 ]] --[[ Name: isMatch ]]
                -- upvalues: v36 (copy)
                return not v36:test(v37);
            end, 
            stat = "testPathIgnorePatterns"
        });
    end;
    if #l_config_0.testRegex > 0 then
        local l__testPathCases_0 = v34._testPathCases;
        local v39 = {};
        local l_testRegex_0 = l_config_0.testRegex;
        local v42 = l_Array_0.map(l_testRegex_0, function(v41) --[[ Line: 99 ]]
            -- upvalues: v5 (ref)
            return v5(v41);
        end);
        v39.isMatch = function(v43) --[[ Line: 102 ]]
            -- upvalues: l_Array_0 (ref), v42 (copy)
            return l_Array_0.some(v42, function(v44) --[[ Line: 103 ]]
                -- upvalues: v43 (copy)
                local v45 = v44:test(v43);
                v44.lastIndex = 0;
                return v45;
            end);
        end;
        v39.stat = "testRegex";
        table.insert(l__testPathCases_0, v39);
    end;
    return v34;
end;
v32._filterTestPathsWithStats = function(v46, v47, v48) --[[ Line: 298 ]] --[[ Name: _filterTestPathsWithStats ]]
    -- upvalues: l_Array_0 (copy), l_Boolean_0 (copy), l_testPathPatternToRegExp_0 (copy)
    local v49 = {
        stats = {
            roots = 0, 
            testMatch = 0, 
            testPathIgnorePatterns = 0, 
            testRegex = 0
        }, 
        tests = {}, 
        total = #v47
    };
    local v50 = l_Array_0.from(v46._testPathCases);
    if v48 ~= nil and l_Boolean_0.toJSBoolean(v48) then
        local v51 = l_testPathPatternToRegExp_0(v48);
        table.insert(v50, {
            isMatch = function(v52) --[[ Line: 310 ]] --[[ Name: isMatch ]]
                -- upvalues: v51 (copy)
                return v51:test(v52);
            end, 
            stat = "testPathPattern"
        });
        v49.stats.testPathPattern = 0;
    end;
    v49.tests = l_Array_0.filter(v47, function(v53) --[[ Line: 318 ]]
        -- upvalues: v50 (copy), v49 (copy)
        local v54 = true;
        for _, v56 in v50 do
            local l_isMatch_0 = v56.isMatch;
            local l_stat_0 = v56.stat;
            if l_isMatch_0(v53.path) then
                v49.stats[l_stat_0] = v49.stats[l_stat_0] or 0;
                local l_stats_0 = v49.stats;
                l_stats_0[l_stat_0] = l_stats_0[l_stat_0] + 1;
            else
                v54 = false;
            end;
        end;
        return v54;
    end);
    return v49;
end;
v32._getAllTestPaths = function(v60, v61) --[[ Line: 338 ]] --[[ Name: _getAllTestPaths ]]
    -- upvalues: v20 (copy), l_Array_0 (copy)
    local l__context_0 = v60._context;
    local v63 = v20(v60._context);
    return v60:_filterTestPathsWithStats(l_Array_0.map(v63, function(v64) --[[ Line: 120 ]]
        -- upvalues: l__context_0 (copy)
        return {
            context = l__context_0, 
            duration = nil, 
            path = v64.path, 
            script = v64.script
        };
    end), v61);
end;
v32.isTestFilePath = function(v65, v66) --[[ Line: 353 ]] --[[ Name: isTestFilePath ]]
    -- upvalues: l_Array_0 (copy)
    return l_Array_0.every(v65._testPathCases, function(v67) --[[ Line: 354 ]]
        -- upvalues: v66 (copy)
        return v67.isMatch(v66);
    end);
end;
v32.findMatchingTests = function(v68, v69) --[[ Line: 362 ]] --[[ Name: findMatchingTests ]]
    return v68:_getAllTestPaths(v69);
end;
v32._getTestPaths = function(v70, v71, _) --[[ Line: 473 ]] --[[ Name: _getTestPaths ]]
    -- upvalues: v4 (copy)
    return v4.resolve():andThen(function() --[[ Line: 477 ]]
        -- upvalues: v71 (copy), v70 (copy)
        if v71.testPathPattern ~= nil then
            return v70:findMatchingTests(v71.testPathPattern);
        else
            return {
                tests = {}
            };
        end;
    end);
end;
v32.getTestPaths = function(v73, v74, v75, _) --[[ Line: 537 ]] --[[ Name: getTestPaths ]]
    -- upvalues: v4 (copy)
    return v4.resolve():andThen(function() --[[ Line: 542 ]]
        -- upvalues: v73 (copy), v74 (copy), v75 (copy)
        return (v73:_getTestPaths(v74, v75):expect());
    end);
end;
v6.default = v32;
return v6;