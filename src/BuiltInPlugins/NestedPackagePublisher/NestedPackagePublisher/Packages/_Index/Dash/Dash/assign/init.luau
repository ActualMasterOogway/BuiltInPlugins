local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.None);
local _ = require(l_Parent_0.Types);
local v3 = require(l_Parent_0.assertEqual);
local v4 = require(l_Parent_0.forEach);
local v5 = require(l_Parent_0.forEachArgs);
return function(v6, ...) --[[ Line: 53 ]] --[[ Name: assign ]]
    -- upvalues: v3 (copy), v5 (copy), v1 (copy), v4 (copy)
    v3(typeof(v6), "table", "Attempted to call Dash.assign with argument #1 of type {left:?} not {right:?}");
    v5(function(v7) --[[ Line: 56 ]]
        -- upvalues: v1 (ref), v4 (ref), v6 (copy)
        if v7 == nil or v7 == v1 then
            return;
        else
            v4(v7, function(v8, v9) --[[ Line: 62 ]]
                -- upvalues: v1 (ref), v6 (ref)
                if v8 == v1 then
                    v6[v9] = nil;
                    return;
                else
                    v6[v9] = v8;
                    return;
                end;
            end);
            return;
        end;
    end, ...);
    return v6;
end;