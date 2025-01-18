local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.Error);
local v3 = require(l_Parent_0.format);
local v4 = v2.new("ReadonlyKey", "Attempted to write to readonly key {key:?} of frozen object {objectName:?}");
local v5 = v2.new("MissingKey", "Attempted to read missing key {key:?} of frozen object {objectName:?}");
return function(v6, v7, v8) --[[ Line: 36 ]] --[[ Name: freeze ]]
    -- upvalues: v5 (copy), v4 (copy), v3 (copy)
    local v9 = {};
    setmetatable(v9, {
        __index = function(_, v11) --[[ Line: 40 ]] --[[ Name: __index ]]
            -- upvalues: v7 (copy), v8 (copy), v5 (ref), v6 (copy)
            local v12 = v7[v11];
            if v12 == nil and v8 then
                v5:throw({
                    key = v11, 
                    objectName = v6
                });
            end;
            return v12;
        end, 
        __newindex = function(_, v14) --[[ Line: 51 ]] --[[ Name: __newindex ]]
            -- upvalues: v4 (ref), v6 (copy)
            v4:throw({
                key = v14, 
                objectName = v6
            });
        end, 
        __len = function() --[[ Line: 58 ]] --[[ Name: __len ]]
            -- upvalues: v7 (copy)
            return #v7;
        end, 
        __tostring = function() --[[ Line: 61 ]] --[[ Name: __tostring ]]
            -- upvalues: v3 (ref), v6 (copy)
            return v3("Frozen({})", v6);
        end, 
        __call = function(_, ...) --[[ Line: 64 ]] --[[ Name: __call ]]
            -- upvalues: v7 (copy)
            return v7(...);
        end
    });
    return v9;
end;