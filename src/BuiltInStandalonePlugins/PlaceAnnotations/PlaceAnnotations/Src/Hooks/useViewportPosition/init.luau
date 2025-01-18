local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_Focus_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.Focus;
return function(v3, v4, v5) --[[ Line: 7 ]] --[[ Name: useViewportPosition ]]
    -- upvalues: l_Focus_0 (copy), v1 (copy)
    local v6 = l_Focus_0:use():get();
    local v7, v8 = v1.useState(v6.AbsoluteSize);
    local v9, v10 = v1.useState(v3);
    v1.useEffect(function() --[[ Line: 12 ]]
        -- upvalues: v6 (copy), v8 (copy)
        local v11 = v6:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 13 ]]
            -- upvalues: v8 (ref), v6 (ref)
            v8(v6.AbsoluteSize);
        end);
        return function() --[[ Line: 16 ]]
            -- upvalues: v11 (copy)
            return v11:Disconnect();
        end;
    end, {
        v6
    });
    v1.useEffect(function() --[[ Line: 21 ]]
        -- upvalues: v3 (copy), v7 (copy), v4 (copy), v5 (copy), v10 (copy)
        local v12 = math.min(v3.X.Offset, v7.X - v4);
        local v13 = math.min(v3.Y.Offset, v7.Y - v5);
        v10(UDim2.fromOffset(v12, v13));
    end, {
        v3, 
        v4, 
        v5, 
        v7
    });
    return v9;
end;