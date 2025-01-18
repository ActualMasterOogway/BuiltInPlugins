local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.Error);
local v3 = require(l_Parent_0.assertEqual);
local v4 = require(l_Parent_0.format);
local v5 = v2.new("ReadonlyKey", "Attempted to write to readonly key {key:?} of frozen object {objectName:?}");
local v6 = v2.new("MissingKey", "Attempted to read missing key {key:?} of frozen object {objectName:?}");
return function(v7, v8, v9) --[[ Line: 35 ]] --[[ Name: freeze ]]
    -- upvalues: v3 (copy), v6 (copy), v5 (copy), v4 (copy)
    v3(typeof(v7), "string", "Attempted to call Dash.freeze with argument #1 of type {left:?} not {right:?}");
    v3(typeof(v8), "table", "Attempted to call Dash.freeze with argument #2 of type {left:?} not {right:?}");
    local v10 = {};
    setmetatable(v10, {
        __index = function(_, v12) --[[ Line: 43 ]] --[[ Name: __index ]]
            -- upvalues: v8 (copy), v9 (copy), v6 (ref), v7 (copy)
            local v13 = v8[v12];
            if v13 == nil and v9 then
                v6:throw({
                    key = v12, 
                    objectName = v7
                });
            end;
            return v13;
        end, 
        __newindex = function(_, v15) --[[ Line: 54 ]] --[[ Name: __newindex ]]
            -- upvalues: v5 (ref), v7 (copy)
            v5:throw({
                key = v15, 
                objectName = v7
            });
        end, 
        __len = function() --[[ Line: 61 ]] --[[ Name: __len ]]
            -- upvalues: v8 (copy)
            return #v8;
        end, 
        __tostring = function() --[[ Line: 64 ]] --[[ Name: __tostring ]]
            -- upvalues: v4 (ref), v7 (copy)
            return v4("Frozen({})", v7);
        end, 
        __call = function(_, ...) --[[ Line: 67 ]] --[[ Name: __call ]]
            -- upvalues: v8 (copy)
            return v8(...);
        end
    });
    return v10;
end;