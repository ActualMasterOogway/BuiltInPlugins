local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
return function(v2, v3, v4) --[[ Line: 4 ]]
    local v5 = 0;
    local v6 = 0;
    local v7 = 0;
    for _, v9 in ipairs(v2) do
        v5 = v5 + v9.Offset;
        v6 = v6 + v9.Scale;
        if v9.Offset ~= 0 or v9.Scale ~= 0 then
            v7 = v7 + 1;
        end;
    end;
    if v7 == 0 then
        return UDim.new(1, 0);
    else
        v5 = v5 + (v3 or 0) * 2 + (v4 or 0) * (v7 - 1);
        return UDim.new(1 - v6, -v5);
    end;
end;