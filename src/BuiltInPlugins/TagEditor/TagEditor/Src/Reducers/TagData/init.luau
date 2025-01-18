local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
return function(v2, v3) --[[ Line: 4 ]]
    v2 = v2 or {};
    if v3.type == "SetTagData" then
        table.sort(v3.data, function(v4, v5) --[[ Line: 9 ]]
            local v6 = v4.Group or "";
            local v7 = v5.Group or "";
            if v6 < v7 then
                return true;
            elseif v7 < v6 then
                return false;
            else
                return (v4.Name or "") < (v5.Name or "");
            end;
        end);
        return v3.data;
    else
        return v2;
    end;
end;