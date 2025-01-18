local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Util.prioritize);
return function(v2, v3) --[[ Line: 16 ]] --[[ Name: getSizeFromPropsAndStyle ]]
    -- upvalues: v1 (copy)
    v3 = v3 or {};
    local v4 = v1(v2.Size, v3.Size, UDim2.new(1, 0, 1, 0));
    local v5 = v1(v2.Width, v3.Width);
    local v6 = v1(v2.Height, v3.Height);
    if typeof(v5) == "number" then
        v4 = UDim2.new(UDim.new(0, v5), v4.Y);
    elseif typeof(v5) == "UDim" then
        v4 = UDim2.new(v5, v4.Y);
    end;
    if typeof(v6) == "number" then
        return (UDim2.new(v4.X, UDim.new(0, v6)));
    else
        if typeof(v6) == "UDim" then
            v4 = UDim2.new(v4.X, v6);
        end;
        return v4;
    end;
end;