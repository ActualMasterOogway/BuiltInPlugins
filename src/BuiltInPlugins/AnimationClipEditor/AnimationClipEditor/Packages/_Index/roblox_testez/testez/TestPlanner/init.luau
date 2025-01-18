local v0 = require(script.Parent.TestEnum);
local v1 = require(script.Parent.TestPlanBuilder);
local v2 = {};
local function v15(v3, v4, v5) --[[ Line: 12 ]] --[[ Name: buildPlan ]]
    -- upvalues: v0 (copy)
    local v6 = getfenv(v4.method);
    for v7, v8 in pairs(v5) do
        v6[v7] = v8;
    end;
    local v9 = #v4.path;
    for v10 = v9, 1, -1 do
        v3:pushNode(v4.path[v10], v0.NodeType.Describe);
    end;
    local v12, v13 = xpcall(v4.method, function(v11) --[[ Line: 27 ]]
        return v11 .. "\n" .. debug.traceback();
    end);
    if not v12 then
        v3:getCurrentNode().loadError = v13;
    end;
    for _ = 1, v9 do
        v3:popNode();
    end;
end;
v2.createEnvironment = function(v16, v17) --[[ Line: 52 ]] --[[ Name: createEnvironment ]]
    -- upvalues: v0 (copy), v15 (copy)
    local v18 = {};
    if v17 then
        if type(v17) ~= "table" then
            error(("Bad argument #2 to TestPlanner.createEnvironment. Expected table, got %s"):format((typeof(v17))), 2);
        end;
        for v19, v20 in pairs(v17) do
            v18[v19] = v20;
        end;
    end;
    v18.describeFOCUS = function(v21, v22) --[[ Line: 66 ]] --[[ Name: describeFOCUS ]]
        -- upvalues: v18 (copy), v0 (ref)
        return v18.describe(v21, v22, v0.NodeModifier.Focus);
    end;
    v18.describeSKIP = function(v23, v24) --[[ Line: 70 ]] --[[ Name: describeSKIP ]]
        -- upvalues: v18 (copy), v0 (ref)
        return v18.describe(v23, v24, v0.NodeModifier.Skip);
    end;
    v18.describe = function(v25, v26, v27) --[[ Line: 74 ]] --[[ Name: describe ]]
        -- upvalues: v16 (copy), v0 (ref)
        local v28 = v16:pushNode(v25, v0.NodeType.Describe, v27);
        local l_status_0, l_result_0 = pcall(v26);
        if not l_status_0 then
            v28.loadError = l_result_0;
        end;
        v16:popNode();
    end;
    v18.try = function(v31, v32) --[[ Line: 87 ]] --[[ Name: try ]]
        -- upvalues: v16 (copy), v0 (ref)
        local v33 = v16:pushNode(v31, v0.NodeType.Try);
        local l_status_1, l_result_1 = pcall(v32);
        if not l_status_1 then
            v33.loadError = l_result_1;
        end;
        v16:popNode();
    end;
    v18.it = function(v36, v37) --[[ Line: 100 ]] --[[ Name: it ]]
        -- upvalues: v16 (copy), v0 (ref)
        v16:pushNode(v36, v0.NodeType.It).callback = v37;
        v16:popNode();
    end;
    local v38 = 0;
    local v39 = {
        [v0.NodeType.BeforeAll] = "beforeAll", 
        [v0.NodeType.AfterAll] = "afterAll", 
        [v0.NodeType.BeforeEach] = "beforeEach", 
        [v0.NodeType.AfterEach] = "afterEach"
    };
    for v40, v41 in pairs(v39) do
        v18[v41] = function(v42) --[[ Line: 119 ]]
            -- upvalues: v16 (copy), v41 (copy), v38 (ref), v40 (copy)
            local v43 = v16:pushNode(v41 .. "_" .. tostring(v38), v40);
            v38 = v38 + 1;
            v43.callback = v42;
            v16:popNode();
        end;
    end;
    v18.itFOCUS = function(v44, v45) --[[ Line: 129 ]] --[[ Name: itFOCUS ]]
        -- upvalues: v16 (copy), v0 (ref)
        v16:pushNode(v44, v0.NodeType.It, v0.NodeModifier.Focus).callback = v45;
        v16:popNode();
    end;
    v18.itSKIP = function(v46, v47) --[[ Line: 137 ]] --[[ Name: itSKIP ]]
        -- upvalues: v16 (copy), v0 (ref)
        v16:pushNode(v46, v0.NodeType.It, v0.NodeModifier.Skip).callback = v47;
        v16:popNode();
    end;
    v18.itFIXME = function(v48, v49) --[[ Line: 145 ]] --[[ Name: itFIXME ]]
        -- upvalues: v16 (copy), v0 (ref)
        local v50 = v16:pushNode(v48, v0.NodeType.It, v0.NodeModifier.Skip);
        warn("FIXME: broken test", v50:getFullName());
        v50.callback = v49;
        v16:popNode();
    end;
    v18.FIXME = function(v51) --[[ Line: 154 ]] --[[ Name: FIXME ]]
        -- upvalues: v16 (copy), v0 (ref)
        local v52 = v16:getCurrentNode();
        warn("FIXME: broken test", v52:getFullName(), v51 or "");
        v52.modifier = v0.NodeModifier.Skip;
    end;
    v18.FOCUS = function() --[[ Line: 161 ]] --[[ Name: FOCUS ]]
        -- upvalues: v16 (copy), v0 (ref)
        v16:getCurrentNode().modifier = v0.NodeModifier.Focus;
    end;
    v18.SKIP = function() --[[ Line: 167 ]] --[[ Name: SKIP ]]
        -- upvalues: v16 (copy), v0 (ref)
        v16:getCurrentNode().modifier = v0.NodeModifier.Skip;
    end;
    v18.HACK_NO_XPCALL = function() --[[ Line: 182 ]] --[[ Name: HACK_NO_XPCALL ]]
        -- upvalues: v16 (copy)
        v16:getCurrentNode().HACK_NO_XPCALL = true;
    end;
    v18.step = v18.it;
    v18.fit = v18.itFOCUS;
    v18.xit = v18.itSKIP;
    v18.fdescribe = v18.describeFOCUS;
    v18.xdescribe = v18.describeSKIP;
    v18.include = function(...) --[[ Line: 195 ]] --[[ Name: include ]]
        -- upvalues: v15 (ref), v16 (copy), v18 (copy)
        local v53 = {
            ...
        };
        local v54 = nil;
        local v55 = nil;
        if #v53 == 1 then
            v54 = v53[1];
            v55 = {};
        elseif #v53 == 2 then
            v54 = v53[2];
            v55 = {
                v53[1]
            };
        end;
        v15(v16, {
            path = v55, 
            method = v54
        }, v18);
    end;
    return v18;
end;
v2.createPlan = function(v56, v57, v58, v59) --[[ Line: 217 ]] --[[ Name: createPlan ]]
    -- upvalues: v1 (copy), v2 (copy), v15 (copy)
    local v60 = v1.new();
    v60.noXpcallByDefault = v57;
    v60.testNamePattern = v58;
    local v61 = v2.createEnvironment(v60, v59);
    for _, v63 in ipairs(v56) do
        v15(v60, v63, v61);
    end;
    return v60:finalize();
end;
return v2;