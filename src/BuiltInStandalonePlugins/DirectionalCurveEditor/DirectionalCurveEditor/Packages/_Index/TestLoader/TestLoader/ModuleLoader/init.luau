local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.NoYield);
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Dash);
local l_forEach_0 = v3.forEach;
local l_getOrSet_0 = v3.getOrSet;
local v6 = {
    requirers = {}, 
    connections = {}, 
    cache = {}, 
    errors = {}, 
    listeners = {}
};
local l_loadmodule_0 = debug.loadmodule;
local v8 = pcall(function() --[[ Line: 24 ]]
    -- upvalues: l_loadmodule_0 (copy)
    l_loadmodule_0(script);
end);
v6.usingLoadModule = function(_) --[[ Line: 28 ]] --[[ Name: usingLoadModule ]]
    -- upvalues: v8 (copy)
    return v8;
end;
v6.connect = function(v10, v11) --[[ Line: 33 ]] --[[ Name: connect ]]
    v10.listeners[v11] = true;
end;
v6.disconnect = function(v12, v13) --[[ Line: 38 ]] --[[ Name: disconnect ]]
    v12.listeners[v13] = nil;
end;
v6.load = function(v14, v15) --[[ Line: 42 ]] --[[ Name: load ]]
    -- upvalues: v1 (copy)
    return v1(function() --[[ Line: 43 ]]
        -- upvalues: v14 (copy), v15 (copy)
        return v14:attemptLoad(v15);
    end);
end;
v6.attemptLoad = function(v16, v17) --[[ Line: 48 ]] --[[ Name: attemptLoad ]]
    -- upvalues: l_loadmodule_0 (copy), l_getOrSet_0 (copy), l_forEach_0 (copy)
    if not v16:usingLoadModule() then
        return require(v17);
    else
        local v18, v19 = l_loadmodule_0(v17);
        assert(v18, v19);
        getfenv(v18).require = function(v20) --[[ Line: 55 ]]
            -- upvalues: l_getOrSet_0 (ref), v16 (copy), v17 (copy)
            l_getOrSet_0(v16.requirers, v20, function() --[[ Line: 56 ]]
                return {};
            end)[v17] = true;
            return v16:_require(v20);
        end;
        pcall(function() --[[ Line: 64 ]]
            -- upvalues: l_getOrSet_0 (ref), v16 (copy), v17 (copy), l_forEach_0 (ref)
            l_getOrSet_0(v16.connections, v17, function() --[[ Line: 65 ]]
                -- upvalues: v17 (ref), v16 (ref), l_forEach_0 (ref)
                return v17:GetPropertyChangedSignal("Source"):Connect(function() --[[ Line: 66 ]]
                    -- upvalues: v16 (ref), v17 (ref), l_forEach_0 (ref)
                    v16:clear(v17);
                    l_forEach_0(v16.listeners, function(_, v22) --[[ Line: 68 ]]
                        -- upvalues: v17 (ref)
                        v22(v17);
                    end);
                end);
            end);
        end);
        return v18();
    end;
end;
v6._require = function(v23, v24) --[[ Line: 78 ]] --[[ Name: _require ]]
    -- upvalues: l_getOrSet_0 (copy)
    return l_getOrSet_0(v23.cache, v24, function() --[[ Line: 79 ]]
        -- upvalues: v23 (copy), v24 (copy)
        return v23:load(v24);
    end);
end;
v6.clear = function(v25, v26) --[[ Line: 84 ]] --[[ Name: clear ]]
    -- upvalues: l_forEach_0 (copy)
    if not v25.cache[v26] then
        return;
    else
        v25.cache[v26] = nil;
        if v25.requirers[v26] then
            l_forEach_0(v25.requirers[v26], function(_, v28) --[[ Line: 92 ]]
                -- upvalues: v25 (copy)
                v25:clear(v28);
            end);
        end;
        v25.requirers[v26] = nil;
        return;
    end;
end;
v6.reset = function(v29) --[[ Line: 99 ]] --[[ Name: reset ]]
    -- upvalues: l_forEach_0 (copy)
    l_forEach_0(v29.connections, function(v30) --[[ Line: 100 ]]
        v30:Disconnect();
    end);
    v29.requirers = {};
    v29.connections = {};
    v29.cache = {};
    v29.errors = {};
end;
return v6;