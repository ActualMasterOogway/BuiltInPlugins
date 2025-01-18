local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Util);
local l_React_0 = v1.React;
local l_Symbol_0 = v1.Symbol;
local l_Signal_0 = v1.Signal;
local v6 = {
    __tostring = function(v5) --[[ Line: 23 ]] --[[ Name: __tostring ]]
        return v5.__name;
    end
};
local v7 = {};
v7.__index = v7;
setmetatable(v7, v6);
v7.extend = function(v8, v9) --[[ Line: 34 ]] --[[ Name: extend ]]
    -- upvalues: l_Symbol_0 (copy), l_React_0 (copy), v6 (copy)
    assert(typeof(v9) == "string", "ContextItem class name must be a string");
    local v10 = table.clone(v8);
    v10.__index = v10;
    v10.__name = v9;
    v10.Key = l_Symbol_0.named(v9);
    if l_React_0 ~= "" then
        v10.Context = l_React_0.createContext({});
        v10.use = function() --[[ Line: 45 ]] --[[ Name: use ]]
            -- upvalues: l_React_0 (ref), v10 (copy)
            return l_React_0.useContext(v10.Context);
        end;
    end;
    setmetatable(v10, v6);
    return v10;
end;
if l_React_0 ~= "" then
    v7.getProvider = function(v11, v12) --[[ Line: 56 ]] --[[ Name: getProvider ]]
        -- upvalues: l_React_0 (copy)
        return l_React_0.createElement(v11.Context.Provider, {
            value = v11
        }, v12);
    end;
end;
v7.getSignal = function(_) --[[ Line: 66 ]] --[[ Name: getSignal ]]
    return nil;
end;
v7.destroy = function(_) --[[ Line: 74 ]] --[[ Name: destroy ]]

end;
v7.__tostring = function(v15) --[[ Line: 76 ]] --[[ Name: __tostring ]]
    return (tostring(v15.__name));
end;
v7.createSimple = function(_, v17, v18) --[[ Line: 97 ]] --[[ Name: createSimple ]]
    -- upvalues: v7 (copy), l_Signal_0 (copy)
    assert(v17, "ContextItem:createSimple expects a name parameter");
    assert(typeof(v17) == "string", "ContextItem:createSimple expects the name parameter to be a string");
    if v18 then
        assert(typeof(v18) == "table", "ContextItem:createSimple expects the options parameter to be either nil or a table");
    end;
    local v19 = v7:extend(v17);
    v19.new = function(v20) --[[ Line: 108 ]] --[[ Name: new ]]
        -- upvalues: v18 (copy), v19 (copy), l_Signal_0 (ref)
        if v18 and v18.verifyNewItem then
            v18.verifyNewItem(v20);
        end;
        local v21 = setmetatable({
            _obj = v20
        }, v19);
        local v22 = v18 and v18.getChangedSignal and v18.getChangedSignal(v20);
        if v22 then
            v21._updateSignal = l_Signal_0.new();
            v21._connection = v22:Connect(function() --[[ Line: 119 ]]
                -- upvalues: v21 (copy)
                v21._updateSignal:Fire(v21);
            end);
        end;
        return v21;
    end;
    v19.destroy = function(v23) --[[ Line: 127 ]] --[[ Name: destroy ]]
        -- upvalues: v18 (copy)
        if v23._connection then
            v23._connection:Disconnect();
            v23._connection = nil;
        end;
        if v18 and v18.destroy then
            v18.destroy(v23._obj);
        end;
        v23._obj = nil;
    end;
    v19.getSignal = function(v24) --[[ Line: 139 ]] --[[ Name: getSignal ]]
        return v24._updateSignal;
    end;
    v19.getConsumerItem = function(v25) --[[ Line: 143 ]] --[[ Name: getConsumerItem ]]
        return table.clone(v25);
    end;
    v19.get = function(v26) --[[ Line: 147 ]] --[[ Name: get ]]
        -- upvalues: v18 (copy)
        return v18 and v18.getValues and v18.getValues(v26._obj) or v26._obj;
    end;
    return v19;
end;
return v7;