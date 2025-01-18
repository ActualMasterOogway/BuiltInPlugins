local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
return function(v4, v5) --[[ Line: 8 ]] --[[ Name: useNote ]]
    -- upvalues: l_useState_0 (copy), l_useEffect_0 (copy)
    local v6 = v4:getTool();
    local v7, v8 = l_useState_0(v6:note());
    l_useEffect_0(function() --[[ Line: 12 ]]
        -- upvalues: v4 (copy), v8 (copy), v5 (copy), v6 (copy)
        local v10 = v4.OnToolChanged:Connect(function(v9) --[[ Line: 13 ]]
            -- upvalues: v8 (ref)
            v8(v9:note());
        end);
        if not v5 then
            return function() --[[ Line: 18 ]]
                -- upvalues: v10 (copy)
                v10:Disconnect();
            end;
        else
            local v11 = v6.OnNoteChanged:Connect(function() --[[ Line: 23 ]]
                -- upvalues: v8 (ref), v6 (ref)
                v8(v6:note());
            end);
            return function() --[[ Line: 27 ]]
                -- upvalues: v10 (copy), v11 (copy)
                v10:Disconnect();
                v11:Disconnect();
            end;
        end;
    end, {
        v6, 
        v5
    });
    l_useEffect_0(function() --[[ Line: 33 ]]
        -- upvalues: v8 (copy), v5 (copy), v6 (copy)
        v8(if v5 then v6:note() else nil);
    end, {
        v5
    });
    return v7;
end;