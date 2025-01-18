local l_Parent_0 = script.Parent.Parent.Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
return {
    toMatchInlineSnapshot = function(_, v3, v4) --[[ Line: 8 ]] --[[ Name: toMatchInlineSnapshot ]]
        -- upvalues: l_Array_0 (copy)
        local function v5(v6) --[[ Line: 9 ]] --[[ Name: serialize ]]
            -- upvalues: l_Array_0 (ref), v5 (copy)
            if typeof(v6) == "string" then
                return v6;
            elseif l_Array_0.isArray(v6) then
                return (("Array [\n%s\n]"):format(l_Array_0.join(l_Array_0.map(v6, function(v7) --[[ Line: 16 ]]
                    -- upvalues: v5 (ref)
                    return v5(v7);
                end), ",")));
            else
                error("toMatchInlineSnapshot does not support " .. typeof(v6) .. ", please implement it yourself");
                return;
            end;
        end;
        local function _(v8, v9) --[[ Line: 28 ]] --[[ Name: passes ]]
            -- upvalues: v5 (copy)
            return v5(v8) == v9;
        end;
        return {
            pass = v5(v3) == v4, 
            message = function() --[[ Line: 34 ]] --[[ Name: message ]]
                -- upvalues: v4 (copy), v5 (copy), v3 (copy)
                return "expected " .. v4 .. " to equal " .. v5(v3);
            end
        };
    end
};