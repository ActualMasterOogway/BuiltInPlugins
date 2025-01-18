local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.Fields.FieldTypes);
return function(v2, v3) --[[ Line: 7 ]] --[[ Name: createPropertyWatcher ]]
    return function(v4, v5) --[[ Line: 8 ]]
        -- upvalues: v2 (copy), v3 (copy)
        if not v4:IsA(v2) then
            return nil, function() --[[ Line: 10 ]]

            end;
        else
            local v6 = v4:GetPropertyChangedSignal(v3):Connect(function() --[[ Line: 13 ]]
                -- upvalues: v5 (copy), v4 (copy), v3 (ref)
                v5(v4[v3]);
            end);
            return v4[v3], function() --[[ Line: 17 ]]
                -- upvalues: v6 (copy)
                v6:Disconnect();
            end;
        end;
    end;
end;