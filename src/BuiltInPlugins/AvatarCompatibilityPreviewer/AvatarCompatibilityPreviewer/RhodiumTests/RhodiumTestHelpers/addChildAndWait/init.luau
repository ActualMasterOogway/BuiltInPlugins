local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Promise);
return function(v2, v3, v4, v5) --[[ Line: 7 ]] --[[ Name: addChildAndWait ]]
    -- upvalues: v1 (copy)
    local v6 = v5 or 1;
    local v7 = nil;
    local v8 = nil;
    v7 = v1.new(function(v9, _) --[[ Line: 17 ]]
        -- upvalues: v8 (ref), v2 (copy), v3 (copy), v6 (copy), v4 (copy)
        local v11 = {};
        v8 = v2.ChildAdded:Connect(function(v12) --[[ Line: 20 ]]
            -- upvalues: v3 (ref), v11 (copy), v6 (ref), v8 (ref), v9 (copy)
            if not v12:IsA(v3) then
                return;
            else
                table.insert(v11, v12);
                if #v11 >= v6 then
                    v8:Disconnect();
                    v9(unpack(v11));
                end;
                return;
            end;
        end);
        task.defer(v4);
    end):timeout(3);
    v7:finally(function() --[[ Line: 36 ]]
        -- upvalues: v8 (ref)
        if v8 then
            v8:Disconnect();
        end;
    end);
    return v7:expect();
end;