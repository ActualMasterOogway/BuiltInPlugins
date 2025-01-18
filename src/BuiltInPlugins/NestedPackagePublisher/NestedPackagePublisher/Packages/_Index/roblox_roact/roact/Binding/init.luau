local v0 = require(script.Parent.createSignal);
local v1 = require(script.Parent.Symbol);
local v2 = require(script.Parent.Type);
local v3 = require(script.Parent.GlobalConfig).get();
local v4 = v1.named("BindingImpl");
local v5 = {};
local v10 = {
    __index = {
        getValue = function(v6) --[[ Line: 13 ]] --[[ Name: getValue ]]
            -- upvalues: v5 (copy)
            return v5.getValue(v6);
        end, 
        map = function(v7, v8) --[[ Line: 17 ]] --[[ Name: map ]]
            -- upvalues: v5 (copy)
            return v5.map(v7, v8);
        end
    }, 
    __tostring = function(v9) --[[ Line: 23 ]] --[[ Name: __tostring ]]
        return string.format("RoactBinding(%s)", (tostring(v9:getValue())));
    end
};
v5.update = function(v11, v12) --[[ Line: 28 ]] --[[ Name: update ]]
    -- upvalues: v4 (copy)
    return v11[v4].update(v12);
end;
v5.subscribe = function(v13, v14) --[[ Line: 32 ]] --[[ Name: subscribe ]]
    -- upvalues: v4 (copy)
    return v13[v4].subscribe(v14);
end;
v5.getValue = function(v15) --[[ Line: 36 ]] --[[ Name: getValue ]]
    -- upvalues: v4 (copy)
    return v15[v4].getValue();
end;
v5.create = function(v16) --[[ Line: 40 ]] --[[ Name: create ]]
    -- upvalues: v0 (copy), v2 (copy), v4 (copy), v10 (copy)
    local v17 = {
        value = v16, 
        changeSignal = v0()
    };
    v17.subscribe = function(v18) --[[ Line: 46 ]] --[[ Name: subscribe ]]
        -- upvalues: v17 (copy)
        return v17.changeSignal:subscribe(v18);
    end;
    v17.update = function(v19) --[[ Line: 50 ]] --[[ Name: update ]]
        -- upvalues: v17 (copy)
        v17.value = v19;
        v17.changeSignal:fire(v19);
    end;
    v17.getValue = function() --[[ Line: 55 ]] --[[ Name: getValue ]]
        -- upvalues: v17 (copy)
        return v17.value;
    end;
    return setmetatable({
        [v2] = v2.Binding, 
        [v4] = v17
    }, v10), v17.update;
end;
v5.map = function(v20, v21) --[[ Line: 65 ]] --[[ Name: map ]]
    -- upvalues: v3 (copy), v2 (copy), v5 (copy), v4 (copy), v10 (copy)
    if v3.typeChecks then
        assert(v2.of(v20) == v2.Binding, "Expected arg #1 to be a binding");
        assert(typeof(v21) == "function", "Expected arg #1 to be a function");
    end;
    local v25 = {
        subscribe = function(v22) --[[ Line: 73 ]] --[[ Name: subscribe ]]
            -- upvalues: v5 (ref), v20 (copy), v21 (copy)
            return v5.subscribe(v20, function(v23) --[[ Line: 74 ]]
                -- upvalues: v22 (copy), v21 (ref)
                v22(v21(v23));
            end);
        end, 
        update = function(_) --[[ Line: 79 ]] --[[ Name: update ]]
            error("Bindings created by Binding:map(fn) cannot be updated directly", 2);
        end, 
        getValue = function() --[[ Line: 83 ]] --[[ Name: getValue ]]
            -- upvalues: v21 (copy), v20 (copy)
            return v21(v20:getValue());
        end
    };
    return (setmetatable({
        [v2] = v2.Binding, 
        [v4] = v25
    }, v10));
end;
v5.join = function(v26) --[[ Line: 93 ]] --[[ Name: join ]]
    -- upvalues: v3 (copy), v2 (copy), v5 (copy), v4 (copy), v10 (copy)
    if v3.typeChecks then
        assert(typeof(v26) == "table", "Expected arg #1 to be of type table");
        for v27, v28 in pairs(v26) do
            if v2.of(v28) ~= v2.Binding then
                local v29 = ("Expected arg #1 to contain only bindings, but key %q had a non-binding value"):format((tostring(v27)));
                error(v29, 2);
            end;
        end;
    end;
    local v30 = {};
    local function v34() --[[ Line: 111 ]] --[[ Name: getValue ]]
        -- upvalues: v26 (copy)
        local v31 = {};
        for v32, v33 in pairs(v26) do
            v31[v32] = v33:getValue();
        end;
        return v31;
    end;
    v30.subscribe = function(v35) --[[ Line: 121 ]] --[[ Name: subscribe ]]
        -- upvalues: v26 (copy), v5 (ref), v34 (copy)
        local v36 = {};
        for v37, v38 in pairs(v26) do
            v36[v37] = v5.subscribe(v38, function(_) --[[ Line: 125 ]]
                -- upvalues: v35 (copy), v34 (ref)
                v35((v34()));
            end);
        end;
        return function() --[[ Line: 130 ]]
            -- upvalues: v36 (ref)
            if v36 == nil then
                return;
            else
                for _, v41 in pairs(v36) do
                    v41();
                end;
                v36 = nil;
                return;
            end;
        end;
    end;
    v30.update = function(_) --[[ Line: 143 ]] --[[ Name: update ]]
        error("Bindings created by joinBindings(...) cannot be updated directly", 2);
    end;
    v30.getValue = function() --[[ Line: 147 ]] --[[ Name: getValue ]]
        -- upvalues: v34 (copy)
        return (v34());
    end;
    return (setmetatable({
        [v2] = v2.Binding, 
        [v4] = v30
    }, v10));
end;
return v5;