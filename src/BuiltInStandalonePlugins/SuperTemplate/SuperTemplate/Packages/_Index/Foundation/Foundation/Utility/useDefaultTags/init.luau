local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Cryo);
return function(v5, v6) --[[ Line: 10 ]] --[[ Name: useDefaultTags ]]
    -- upvalues: v3 (copy), v4 (copy)
    return v3.useMemo(function() --[[ Line: 11 ]]
        -- upvalues: v5 (copy), v6 (copy), v4 (ref)
        if v5 ~= nil then
            if type(v5) == "string" then
                return (("%* %*"):format(v6, v5));
            else
                return (v4.Dictionary.join(v5, {
                    [v6] = true
                }));
            end;
        else
            return v6;
        end;
    end, {
        v5, 
        v6
    });
end;