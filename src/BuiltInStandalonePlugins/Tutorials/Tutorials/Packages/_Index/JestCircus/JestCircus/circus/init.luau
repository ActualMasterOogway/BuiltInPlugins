local l_Parent_0 = script.Parent.Parent;
local v1 = nil;
local v2 = {};
local _ = require(l_Parent_0.JestTypes);
local l_bind_0 = require(l_Parent_0.JestEach).bind;
local v5 = require(l_Parent_0.JestUtil);
local l_ErrorWithStack_0 = v5.ErrorWithStack;
local l_convertDescriptorToString_0 = v5.convertDescriptorToString;
local l_isPromise_0 = v5.isPromise;
local l_dispatchSync_0 = require(script.state).dispatchSync;
local v10 = require(script.state);
v2.setState = v10.setState;
v2.getState = v10.getState;
v2.resetState = v10.resetState;
v2.run = require(script.run).default;
local _ = require(l_Parent_0.LuauPolyfill);
local v24 = (function() --[[ Line: 57 ]]
    -- upvalues: v1 (ref), l_bind_0 (copy)
    local v12 = nil;
    v12 = setmetatable({}, {
        __call = function(_, v14, v15) --[[ Line: 60 ]] --[[ Name: __call ]]
            -- upvalues: v1 (ref), v12 (ref)
            return v1(v15, v14, v12);
        end
    });
    local v16 = nil;
    v16 = setmetatable({}, {
        __call = function(_, v18, v19) --[[ Line: 66 ]] --[[ Name: __call ]]
            -- upvalues: v1 (ref), v16 (ref)
            return v1(v19, v18, v16, "only");
        end
    });
    local v20 = nil;
    v20 = setmetatable({}, {
        __call = function(_, v22, v23) --[[ Line: 72 ]] --[[ Name: __call ]]
            -- upvalues: v1 (ref), v20 (ref)
            return v1(v23, v22, v20, "skip");
        end
    });
    v12.each = l_bind_0(v12, false);
    v16.each = l_bind_0(v16, false);
    v20.each = l_bind_0(v20, false);
    v12.only = v16;
    v12.skip = v20;
    return v12;
end)();
v1 = function(v25, v26, v27, v28) --[[ Line: 100 ]] --[[ Name: _dispatchDescribe ]]
    -- upvalues: l_ErrorWithStack_0 (copy), l_convertDescriptorToString_0 (copy), l_dispatchSync_0 (copy), l_isPromise_0 (copy)
    local v29 = l_ErrorWithStack_0.new(nil, v27);
    if v25 == nil then
        v29.message = "Missing second argument. It must be a callback function.";
        error(v29);
    end;
    if typeof(v25) ~= "function" then
        v29.message = ("Invalid second argument, %s. It must be a callback function."):format(v25);
        error(v29);
    end;
    local v31, v32, v33 = xpcall(function() --[[ Line: 123 ]]
        -- upvalues: v26 (ref), l_convertDescriptorToString_0 (ref)
        v26 = l_convertDescriptorToString_0(v26);
    end, function(v30) --[[ Line: 126 ]]
        -- upvalues: v29 (copy)
        v29.message = v30.message;
        error(v29);
    end);
    if v33 then
        return v32;
    else
        l_dispatchSync_0({
            asyncError = v29, 
            blockName = v26, 
            mode = v28, 
            name = "start_describe_definition"
        });
        v31 = v25();
        if l_isPromise_0(v31) then
            error(l_ErrorWithStack_0.new("Returning a Promise from \"describe\" is not supported. Tests must be defined synchronously.", v27));
        elseif v31 ~= nil then
            error(l_ErrorWithStack_0.new("A \"describe\" callback must not return a value.", v27));
        end;
        l_dispatchSync_0({
            blockName = v26, 
            mode = v28, 
            name = "finish_describe_definition"
        });
        return;
    end;
end;
local function v39(v34, v35, v36, v37) --[[ Line: 168 ]] --[[ Name: _addHook ]]
    -- upvalues: l_ErrorWithStack_0 (copy), l_dispatchSync_0 (copy)
    local v38 = l_ErrorWithStack_0.new(nil, v36);
    if typeof(v34) ~= "function" then
        v38.message = "Invalid first argument. It must be a callback function.";
        error(v38);
    end;
    l_dispatchSync_0({
        asyncError = v38, 
        fn = v34, 
        hookType = v35, 
        name = "add_hook", 
        timeout = v37
    });
end;
local v40 = nil;
v40 = function(v41, v42) --[[ Line: 185 ]] --[[ Name: beforeEach ]]
    -- upvalues: v39 (copy), v40 (ref)
    return v39(v41, "beforeEach", v40, v42);
end;
local v43 = nil;
v43 = function(v44, v45) --[[ Line: 189 ]] --[[ Name: beforeAll ]]
    -- upvalues: v39 (copy), v43 (ref)
    return v39(v44, "beforeAll", v43, v45);
end;
local v46 = nil;
v46 = function(v47, v48) --[[ Line: 193 ]] --[[ Name: afterEach ]]
    -- upvalues: v39 (copy), v46 (ref)
    return v39(v47, "afterEach", v46, v48);
end;
local v49 = nil;
v49 = function(v50, v51) --[[ Line: 197 ]] --[[ Name: afterAll ]]
    -- upvalues: v39 (copy), v49 (ref)
    return v39(v50, "afterAll", v49, v51);
end;
local v85 = (function() --[[ Line: 201 ]]
    -- upvalues: l_ErrorWithStack_0 (copy), l_convertDescriptorToString_0 (copy), l_dispatchSync_0 (copy), l_bind_0 (copy)
    local v52 = nil;
    local v53 = nil;
    v53 = setmetatable({}, {
        __call = function(_, v55, v56, v57) --[[ Line: 215 ]] --[[ Name: __call ]]
            -- upvalues: v52 (ref), v53 (ref)
            return v52(v55, nil, v56, v53, v57);
        end
    });
    local v58 = nil;
    v58 = setmetatable({}, {
        __call = function(_, v60, v61, v62) --[[ Line: 221 ]] --[[ Name: __call ]]
            -- upvalues: v52 (ref), v58 (ref)
            return v52(v60, "skip", v61, v58, v62);
        end
    });
    local v63 = nil;
    v63 = setmetatable({}, {
        __call = function(_, v65, v66, v67) --[[ Line: 227 ]] --[[ Name: __call ]]
            -- upvalues: v52 (ref), v53 (ref)
            return v52(v65, "only", v66, v53.only, v67);
        end
    });
    bindFailing = function(v68) --[[ Line: 232 ]] --[[ Name: bindFailing ]]
        -- upvalues: v52 (ref)
        failing = function(v69, v70, v71) --[[ Line: 233 ]] --[[ Name: failing ]]
            -- upvalues: v52 (ref), v68 (copy)
            return v52(v69, v68, v70, failing, v71, true);
        end;
        return failing;
    end;
    v53.todo = function(v72, ...) --[[ Line: 239 ]]
        -- upvalues: l_ErrorWithStack_0 (ref), v53 (ref), v52 (ref)
        if #{
            ...
        } > 0 or typeof(v72) ~= "string" then
            error(l_ErrorWithStack_0.new("Todo must be called with only a description.", v53.todo));
        end;
        return v52(v72, "todo", function() --[[ Line: 244 ]]

        end, v53.todo);
    end;
    v52 = function(v73, v74, v75, v76, v77, v78) --[[ Line: 247 ]] --[[ Name: _addTest ]]
        -- upvalues: l_ErrorWithStack_0 (ref), l_convertDescriptorToString_0 (ref), l_dispatchSync_0 (ref)
        local v79 = l_ErrorWithStack_0.new(nil, v76);
        local v80 = false;
        local _, v83, v84 = xpcall(function() --[[ Line: 258 ]]
            -- upvalues: v73 (ref), l_convertDescriptorToString_0 (ref)
            v73 = l_convertDescriptorToString_0(v73);
        end, function(v81) --[[ Line: 260 ]]
            -- upvalues: v79 (copy), v80 (ref)
            v79.message = v81.message;
            v80 = true;
        end);
        if v84 then
            return v83;
        else
            if v80 then
                error(v79);
            end;
            if v75 == nil then
                v79.message = "Missing second argument. It must be a callback function. Perhaps you want to use `test.todo` for a test placeholder.";
                error(v79);
            end;
            if typeof(v75) ~= "function" then
                v79.message = ("Invalid second argument, %s. It must be a callback function."):format((tostring(v75)));
                error(v79);
            end;
            return l_dispatchSync_0({
                asyncError = v79, 
                fn = v75, 
                failing = v78 ~= nil and v78, 
                mode = v74, 
                name = "add_test", 
                testName = v73, 
                timeout = v77
            });
        end;
    end;
    v53.each = l_bind_0(v53);
    v63.each = l_bind_0(v63);
    v58.each = l_bind_0(v58);
    v63.failing = bindFailing("only");
    v58.failing = bindFailing("skip");
    v53.failing = bindFailing();
    v53.only = v63;
    v53.skip = v58;
    return v53;
end)();
v2.afterAll = v49;
v2.afterEach = v46;
v2.beforeAll = v43;
v2.beforeEach = v40;
v2.describe = v24;
v2.it = v85;
v2.test = v85;
v2.default = {
    afterAll = v49, 
    afterEach = v46, 
    beforeAll = v43, 
    beforeEach = v40, 
    describe = v24, 
    it = v85, 
    test = v85
};
return v2;