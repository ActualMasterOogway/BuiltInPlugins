local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
return function(v2) --[[ Line: 7 ]] --[[ Name: ForceRerender ]]
    -- upvalues: v1 (copy)
    local v3, v4 = v1.useState(false);
    v1.useEffect(function() --[[ Line: 14 ]]
        -- upvalues: v4 (copy)
        v4(true);
    end, v2.dependencies);
    v1.useEffect(function() --[[ Line: 18 ]]
        -- upvalues: v3 (copy), v4 (copy)
        if not v3 then
            return;
        else
            v4(false);
            return;
        end;
    end, {
        v3
    });
    if v3 then
        return nil;
    else
        return v1.createElement(v2.component, v2.innerProps);
    end;
end;