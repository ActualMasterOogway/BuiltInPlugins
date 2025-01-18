local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
return function(v2, v3) --[[ Line: 8 ]]
    local v4 = {};
    if v2 == nil then
        return v4;
    else
        for _, v6 in v2 do
            if v6:lower():match(v3:lower()) then
                table.insert(v4, {
                    Id = v6, 
                    Label = v6, 
                    Value = v6
                });
            end;
        end;
        table.sort(v4, function(v7, v8) --[[ Line: 23 ]]
            return v7.Label < v8.Label;
        end);
        return v4;
    end;
end;