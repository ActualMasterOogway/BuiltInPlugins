local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        MeshName = v1, 
        Index = v2, 
        __eq = function(v3, v4) --[[ Line: 8 ]] --[[ Name: __eq ]]
            local v5 = false;
            if v3.MeshName == v4.MeshName then
                v5 = v3.Index == v4.Index;
            end;
            return v5;
        end
    }, v0));
end;
return v0;