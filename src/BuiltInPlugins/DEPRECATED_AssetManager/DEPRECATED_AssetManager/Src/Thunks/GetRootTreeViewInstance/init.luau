local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.PreviewModelGetter);
local v2 = require(l_Parent_0.Src.Actions.SetRootTreeViewInstance);
return function(v3, v4) --[[ Line: 7 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v5) --[[ Line: 8 ]]
        -- upvalues: v1 (ref), v3 (copy), v4 (copy), v2 (ref)
        return v1(v3, v4):andThen(function(v6) --[[ Line: 9 ]]
            -- upvalues: v5 (copy), v2 (ref), v3 (ref)
            if type(v6) == "string" then
                v5:dispatch(v2(v3, nil));
                return;
            else
                v5:dispatch(v2(v3, v6));
                return;
            end;
        end);
    end;
end;