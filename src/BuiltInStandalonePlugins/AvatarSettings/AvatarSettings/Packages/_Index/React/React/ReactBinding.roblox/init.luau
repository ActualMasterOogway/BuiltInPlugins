local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local _ = require(l_Parent_0.Shared);
local l_Symbol_0 = v1.Symbol;
local v5 = require(script.Parent["createSignal.roblox"]);
local v6 = l_Symbol_0("BindingImpl");
local v7 = {};
local v12 = {
    __index = {
        getValue = function(v8) --[[ Line: 47 ]] --[[ Name: getValue ]]
            -- upvalues: v7 (copy)
            return v7.getValue(v8);
        end, 
        map = function(v9, v10) --[[ Line: 51 ]] --[[ Name: map ]]
            -- upvalues: v7 (copy)
            return v7.map(v9, v10);
        end
    }, 
    __tostring = function(v11) --[[ Line: 60 ]] --[[ Name: __tostring ]]
        return string.format("RoactBinding(%s)", (tostring(v11:getValue())));
    end
};
v7.update = function(v13, v14) --[[ Line: 65 ]] --[[ Name: update ]]
    -- upvalues: v6 (copy)
    return v13[v6].update(v14);
end;
v7.subscribe = function(v15, v16) --[[ Line: 69 ]] --[[ Name: subscribe ]]
    -- upvalues: v6 (copy)
    return v15[v6].subscribe(v16);
end;
v7.getValue = function(v17) --[[ Line: 73 ]] --[[ Name: getValue ]]
    -- upvalues: v6 (copy)
    return v17[v6]:getValue();
end;
v7.create = function(v18) --[[ Line: 77 ]] --[[ Name: create ]]
    -- upvalues: v5 (copy), l_ReactSymbols_0 (copy), v6 (copy), v12 (copy)
    local v19, v20 = v5();
    local v21 = {
        value = v18, 
        subscribe = v19
    };
    v21.update = function(v22) --[[ Line: 84 ]] --[[ Name: update ]]
        -- upvalues: v21 (copy), v20 (copy)
        v21.value = v22;
        v20(v22);
    end;
    v21.getValue = function() --[[ Line: 89 ]] --[[ Name: getValue ]]
        -- upvalues: v21 (copy)
        return v21.value;
    end;
    local v23 = nil;
    if _G.__DEV__ then
        v23 = debug.traceback("Binding created at:", 3);
    end;
    return setmetatable({
        ["$$typeof"] = l_ReactSymbols_0.REACT_BINDING_TYPE, 
        [v6] = v21, 
        _source = v23
    }, v12), v21.update;
end;
v7.map = function(v24, v25) --[[ Line: 107 ]] --[[ Name: map ]]
    -- upvalues: l_ReactSymbols_0 (copy), v7 (copy), v6 (copy), v12 (copy)
    if _G.__DEV__ then
        local v26 = false;
        if typeof(v24) == "table" then
            v26 = v24["$$typeof"] == l_ReactSymbols_0.REACT_BINDING_TYPE;
        end;
        assert(v26, "Expected `self` to be a binding");
        assert(typeof(v25) == "function", "Expected arg #1 to be a function");
    end;
    local v30 = {
        subscribe = function(v27) --[[ Line: 123 ]] --[[ Name: subscribe ]]
            -- upvalues: v7 (ref), v24 (copy), v25 (copy)
            return v7.subscribe(v24, function(v28) --[[ Line: 124 ]]
                -- upvalues: v27 (copy), v25 (ref)
                v27(v25(v28));
            end);
        end, 
        update = function(_) --[[ Line: 129 ]] --[[ Name: update ]]
            error("Bindings created by Binding:map(fn) cannot be updated directly", 2);
        end, 
        getValue = function() --[[ Line: 133 ]] --[[ Name: getValue ]]
            -- upvalues: v25 (copy), v24 (copy)
            return v25(v24:getValue());
        end
    };
    local v31 = nil;
    if _G.__DEV__ then
        v31 = debug.traceback("Mapped binding created at:", 3);
    end;
    return (setmetatable({
        ["$$typeof"] = l_ReactSymbols_0.REACT_BINDING_TYPE, 
        [v6] = v30, 
        _source = v31
    }, v12));
end;
v7.join = function(v32) --[[ Line: 154 ]] --[[ Name: join ]]
    -- upvalues: l_ReactSymbols_0 (copy), v7 (copy), v6 (copy), v12 (copy)
    if _G.__DEV__ then
        assert(typeof(v32) == "table", "Expected arg #1 to be of type table");
        for v33, v34 in v32 do
            if typeof(v34) ~= "table" or v34["$$typeof"] ~= l_ReactSymbols_0.REACT_BINDING_TYPE then
                local v35 = ("Expected arg #1 to contain only bindings, but key %q had a non-binding value"):format((tostring(v33)));
                error(v35, 2);
            end;
        end;
    end;
    local v36 = {};
    local function v40() --[[ Line: 175 ]] --[[ Name: getValue ]]
        -- upvalues: v32 (copy)
        local v37 = {};
        for v38, v39 in pairs(v32) do
            v37[v38] = v39:getValue();
        end;
        return v37;
    end;
    v36.subscribe = function(v41) --[[ Line: 186 ]] --[[ Name: subscribe ]]
        -- upvalues: v32 (copy), v7 (ref), v40 (copy)
        local v42 = {};
        for v43, v44 in v32 do
            v42[v43] = v7.subscribe(v44, function(_) --[[ Line: 191 ]]
                -- upvalues: v41 (copy), v40 (ref)
                v41((v40()));
            end);
        end;
        return function() --[[ Line: 196 ]]
            -- upvalues: v42 (ref)
            if v42 == nil then
                return;
            else
                for _, v47 in v42 do
                    v47();
                end;
                v42 = nil;
                return;
            end;
        end;
    end;
    v36.update = function(_) --[[ Line: 209 ]] --[[ Name: update ]]
        error("Bindings created by joinBindings(...) cannot be updated directly", 2);
    end;
    v36.getValue = function() --[[ Line: 213 ]] --[[ Name: getValue ]]
        -- upvalues: v40 (copy)
        return (v40());
    end;
    local v49 = nil;
    if _G.__DEV__ then
        v49 = debug.traceback("Joined binding created at:", 2);
    end;
    return (setmetatable({
        ["$$typeof"] = l_ReactSymbols_0.REACT_BINDING_TYPE, 
        [v6] = v36, 
        _source = v49
    }, v12));
end;
return v7;