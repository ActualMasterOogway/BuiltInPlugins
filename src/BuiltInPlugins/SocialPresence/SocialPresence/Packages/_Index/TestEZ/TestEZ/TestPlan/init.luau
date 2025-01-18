local v0 = require(script.Parent.TestEnum);
local v1 = require(script.Parent.Expectation);
local function v4() --[[ Line: 11 ]] --[[ Name: getCoreScriptSyncService ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 12 ]]
        return game:GetService("CoreScriptSyncService");
    end);
    return l_status_0 and l_result_0 or nil;
end;
local v5 = nil;
local function v9(v6) --[[ Line: 21 ]] --[[ Name: getFilePathFromInstance ]]
    -- upvalues: v5 (ref), v4 (copy)
    if v5 == nil then
        v5 = v4() or false;
    end;
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 26 ]]
        -- upvalues: v5 (ref), v6 (copy)
        if not v5 then
            return nil;
        else
            return v5:GetScriptFilePath(v6);
        end;
    end);
    return l_status_1 and l_result_1 or nil;
end;
local function v46(v10, v11, v12) --[[ Line: 36 ]] --[[ Name: newEnvironment ]]
    -- upvalues: v0 (copy), v1 (copy)
    local v13 = {};
    if v11 then
        if type(v11) ~= "table" then
            error(("Bad argument #2 to newEnvironment. Expected table, got %s"):format((typeof(v11))), 2);
        end;
        for v14, v15 in pairs(v11) do
            v13[v14] = v15;
        end;
    end;
    local function v21(v16, v17, v18, v19) --[[ Line: 49 ]] --[[ Name: addChild ]]
        -- upvalues: v10 (copy), v12 (copy), v0 (ref)
        local v20 = v10:addChild(v16, v18, v19, v12);
        v20.callback = v17;
        if v18 == v0.NodeType.Describe then
            v20:expand();
        end;
        return v20;
    end;
    v13.describeFOCUS = function(v22, v23) --[[ Line: 58 ]] --[[ Name: describeFOCUS ]]
        -- upvalues: v21 (copy), v0 (ref)
        v21(v22, v23, v0.NodeType.Describe, v0.NodeModifier.Focus);
    end;
    v13.describeSKIP = function(v24, v25) --[[ Line: 62 ]] --[[ Name: describeSKIP ]]
        -- upvalues: v21 (copy), v0 (ref)
        v21(v24, v25, v0.NodeType.Describe, v0.NodeModifier.Skip);
    end;
    v13.describe = function(v26, v27, _) --[[ Line: 66 ]] --[[ Name: describe ]]
        -- upvalues: v21 (copy), v0 (ref)
        v21(v26, v27, v0.NodeType.Describe, v0.NodeModifier.None);
    end;
    v13.itFOCUS = function(v29, v30) --[[ Line: 70 ]] --[[ Name: itFOCUS ]]
        -- upvalues: v21 (copy), v0 (ref)
        v21(v29, v30, v0.NodeType.It, v0.NodeModifier.Focus);
    end;
    v13.itSKIP = function(v31, v32) --[[ Line: 74 ]] --[[ Name: itSKIP ]]
        -- upvalues: v21 (copy), v0 (ref)
        v21(v31, v32, v0.NodeType.It, v0.NodeModifier.Skip);
    end;
    v13.itFIXME = function(v33, v34) --[[ Line: 78 ]] --[[ Name: itFIXME ]]
        -- upvalues: v21 (copy), v0 (ref)
        local v35 = v21(v33, v34, v0.NodeType.It, v0.NodeModifier.Skip);
        warn("FIXME: broken test", v35:getFullName());
    end;
    v13.it = function(v36, v37, _) --[[ Line: 83 ]] --[[ Name: it ]]
        -- upvalues: v21 (copy), v0 (ref)
        v21(v36, v37, v0.NodeType.It, v0.NodeModifier.None);
    end;
    local v39 = 0;
    local v40 = {
        [v0.NodeType.BeforeAll] = "beforeAll", 
        [v0.NodeType.AfterAll] = "afterAll", 
        [v0.NodeType.BeforeEach] = "beforeEach", 
        [v0.NodeType.AfterEach] = "afterEach"
    };
    for v41, v42 in pairs(v40) do
        v13[v42] = function(v43) --[[ Line: 98 ]]
            -- upvalues: v21 (copy), v42 (copy), v39 (ref), v41 (copy), v0 (ref)
            v21(v42 .. "_" .. tostring(v39), v43, v41, v0.NodeModifier.None);
            v39 = v39 + 1;
        end;
    end;
    v13.FIXME = function(v44) --[[ Line: 104 ]] --[[ Name: FIXME ]]
        -- upvalues: v10 (copy), v0 (ref)
        warn("FIXME: broken test", v10:getFullName(), v44 or "");
        v10.modifier = v0.NodeModifier.Skip;
    end;
    v13.FOCUS = function() --[[ Line: 110 ]] --[[ Name: FOCUS ]]
        -- upvalues: v10 (copy), v0 (ref)
        v10.modifier = v0.NodeModifier.Focus;
    end;
    v13.SKIP = function() --[[ Line: 114 ]] --[[ Name: SKIP ]]
        -- upvalues: v10 (copy), v0 (ref)
        v10.modifier = v0.NodeModifier.Skip;
    end;
    v13.HACK_NO_XPCALL = function() --[[ Line: 122 ]] --[[ Name: HACK_NO_XPCALL ]]
        warn("HACK_NO_XPCALL is deprecated. It is now safe to yield in an " .. "xpcall, so this is no longer necessary. It can be safely deleted.");
    end;
    v13.fit = v13.itFOCUS;
    v13.xit = v13.itSKIP;
    v13.fdescribe = v13.describeFOCUS;
    v13.xdescribe = v13.describeSKIP;
    v13.expect = setmetatable({
        extend = function(...) --[[ Line: 135 ]] --[[ Name: extend ]]
            error("Cannot call \"expect.extend\" from within a \"describe\" node.");
        end
    }, {
        __call = function(_, ...) --[[ Line: 139 ]] --[[ Name: __call ]]
            -- upvalues: v1 (ref)
            return v1.new(...);
        end
    });
    return v13;
end;
local v47 = {};
v47.__index = v47;
v47.new = function(v48, v49, v50, v51, v52) --[[ Line: 155 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), v46 (copy), v47 (copy)
    local v53 = v51 or v0.NodeModifier.None;
    v53 = {
        plan = v48, 
        phrase = v49, 
        type = v50, 
        modifier = v53, 
        children = {}, 
        callback = nil, 
        parent = nil
    };
    v53.environment = v46(v53, v48.extraEnvironment, v52);
    return (setmetatable(v53, v47));
end;
local function v57(v54, v55, v56) --[[ Line: 172 ]] --[[ Name: getModifier ]]
    -- upvalues: v0 (copy)
    if v55 and (v56 == nil or v56 == v0.NodeModifier.None) then
        if v54:match(v55) then
            return v0.NodeModifier.Focus;
        else
            return v0.NodeModifier.Skip;
        end;
    else
        return v56;
    end;
end;
local function v61(v58, v59, v60) --[[ Line: 183 ]] --[[ Name: getIgnoreModifier ]]
    -- upvalues: v0 (copy)
    if v59 and (v60 == nil or v60 == v0.NodeModifier.None) and v58:match(v59) then
        return v0.NodeModifier.Skip;
    else
        return v60;
    end;
end;
v47.addChild = function(v62, v63, v64, v65, v66) --[[ Line: 192 ]] --[[ Name: addChild ]]
    -- upvalues: v0 (copy), v57 (copy), v61 (copy), v47 (copy)
    if v64 == v0.NodeType.It then
        for _, v68 in pairs(v62.children) do
            if v68.phrase == v63 then
                error("Duplicate it block found: " .. v68:getFullName());
            end;
        end;
    end;
    local v69 = v62:getFullName() .. " " .. v63;
    local v70 = {};
    if v62.plan.testNamePattern then
        v70.nameNodeModifier = v57(v69, v62.plan.testNamePattern, v65);
    end;
    if v62.plan.testPathPattern and v66 then
        v70.pathNodeModifier = v57(v66, v62.plan.testPathPattern, v65);
    end;
    if v62.plan.testPathIgnorePatterns and v66 then
        v70.pathIgnoreNodeModifier = v61(v66, v62.plan.testPathIgnorePatterns, v65);
    end;
    for _, v72 in pairs(v70) do
        if v72 ~= v0.NodeModifier.Focus then
            v65 = v72;
            break;
        else
            v65 = v72;
        end;
    end;
    if v62.plan.runTestsByPath and #v62.plan.runTestsByPath > 0 and v66 and not table.find(v62.plan.runTestsByPath, v66) then
        v65 = v0.NodeModifier.Skip;
    end;
    local v73 = v47.new(v62.plan, v63, v64, v65, v66);
    v73.parent = v62;
    table.insert(v62.children, v73);
    return v73;
end;
v47.getFullName = function(v74) --[[ Line: 237 ]] --[[ Name: getFullName ]]
    if v74.parent then
        local v75 = v74.parent:getFullName();
        if v75 then
            return v75 .. " " .. v74.phrase;
        end;
    end;
    return v74.phrase;
end;
v47.expand = function(v76) --[[ Line: 251 ]] --[[ Name: expand ]]
    local v77 = getfenv(v76.callback);
    local v78 = setmetatable({}, {
        __index = v77
    });
    for v79, v80 in pairs(v76.environment) do
        v78[v79] = v80;
    end;
    v78.script = v77.script;
    setfenv(v76.callback, v78);
    local v82, v83 = xpcall(v76.callback, function(v81) --[[ Line: 262 ]]
        return debug.traceback(tostring(v81), 2);
    end);
    if not v82 then
        v76.loadError = v83;
    end;
end;
local v84 = {};
v84.__index = v84;
v84.new = function(v85) --[[ Line: 277 ]] --[[ Name: new ]]
    -- upvalues: v84 (copy)
    local v86 = {
        children = {}
    };
    if v85 then
        for v87, v88 in pairs(v85) do
            v86[v87] = v88;
        end;
    end;
    return (setmetatable(v86, v84));
end;
v84.addChild = function(v89, v90, v91, v92) --[[ Line: 294 ]] --[[ Name: addChild ]]
    -- upvalues: v57 (copy), v47 (copy)
    v92 = v57(v90, v89.testNamePattern, v92);
    local v93 = v47.new(v89, v90, v91, v92);
    table.insert(v89.children, v93);
    return v93;
end;
v84.addRoot = function(v94, v95, v96, v97) --[[ Line: 305 ]] --[[ Name: addRoot ]]
    -- upvalues: v9 (copy), v0 (copy)
    local l_v94_0 = v94;
    for v99 = #v95, 1, -1 do
        local v100 = nil;
        for _, v102 in ipairs(l_v94_0.children) do
            if v102.phrase == v95[v99] then
                v100 = v102;
                break;
            end;
        end;
        if v100 == nil then
            local v103 = v9(v97);
            v100 = l_v94_0:addChild(v95[v99], v0.NodeType.Describe, nil, v103);
        end;
        l_v94_0 = v100;
    end;
    l_v94_0.isRoot = true;
    l_v94_0.instance = v97;
    l_v94_0.callback = v96;
    l_v94_0:expand();
end;
v84.visitAllNodes = function(v104, v105, v106, v107) --[[ Line: 334 ]] --[[ Name: visitAllNodes ]]
    v106 = v106 or v104;
    v107 = v107 or 0;
    for _, v109 in ipairs(v106.children) do
        v105(v109, v107);
        v104:visitAllNodes(v105, v109, v107 + 1);
    end;
end;
v84.visualize = function(v110) --[[ Line: 349 ]] --[[ Name: visualize ]]
    local v111 = {};
    v110:visitAllNodes(function(v112, v113) --[[ Line: 351 ]]
        -- upvalues: v111 (copy)
        table.insert(v111, (" "):rep(3 * v113) .. v112.phrase);
    end);
    return table.concat(v111, "\n");
end;
v84.findNodes = function(v114, v115) --[[ Line: 361 ]] --[[ Name: findNodes ]]
    local v116 = {};
    v114:visitAllNodes(function(v117) --[[ Line: 363 ]]
        -- upvalues: v115 (copy), v116 (copy)
        if v115(v117) then
            table.insert(v116, v117);
        end;
    end);
    return v116;
end;
return v84;