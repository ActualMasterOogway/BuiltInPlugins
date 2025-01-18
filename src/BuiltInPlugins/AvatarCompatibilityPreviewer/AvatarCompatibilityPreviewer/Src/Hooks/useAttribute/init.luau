local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
return function(v3, v4) --[[ Line: 7 ]] --[[ Name: useAttribute ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v5, v6 = v2.useState(if v3 == nil then nil else v3:GetAttribute(v4));
    v2.useEffect(function() --[[ Line: 11 ]]
        -- upvalues: v3 (copy), v1 (ref), v6 (copy), v4 (copy)
        if v3 == nil then
            return nil;
        else
            assert(v3 ~= nil, v1.LUAU_ANALYZE_ERROR);
            v6(v3:GetAttribute(v4));
            local v7 = v3:GetAttributeChangedSignal(v4):Connect(function() --[[ Line: 19 ]]
                -- upvalues: v6 (ref), v3 (ref), v4 (ref)
                v6(v3:GetAttribute(v4));
            end);
            return function() --[[ Line: 23 ]]
                -- upvalues: v7 (copy)
                v7:Disconnect();
            end;
        end;
    end, {
        v3, 
        v4
    });
    return v5;
end;