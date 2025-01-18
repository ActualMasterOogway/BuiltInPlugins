local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Parent.Dash);
local l_omit_0 = v2.omit;
local l_join_0 = v2.join;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 8 ]]
    -- upvalues: v1 (copy)
    return v1.forwardRef;
end);
return function(v7) --[[ Line: 12 ]] --[[ Name: withForwardRef ]]
    -- upvalues: l_status_0 (copy), l_result_0 (copy), v1 (copy), l_join_0 (copy), l_omit_0 (copy)
    if l_status_0 and l_result_0 then
        return l_result_0(function(v8, v9) --[[ Line: 14 ]]
            -- upvalues: v1 (ref), v7 (copy), l_join_0 (ref)
            return v1.createElement(v7, l_join_0(v8, {
                ForwardRef = v9
            }));
        end);
    else
        return function(v10) --[[ Line: 18 ]]
            -- upvalues: v1 (ref), l_omit_0 (ref), v7 (copy)
            local v11 = v10[v1.Ref];
            local v12 = l_omit_0(v10, {
                v1.Ref
            });
            v12.ForwardRef = v11;
            return v1.createElement(v7, v12);
        end;
    end;
end;