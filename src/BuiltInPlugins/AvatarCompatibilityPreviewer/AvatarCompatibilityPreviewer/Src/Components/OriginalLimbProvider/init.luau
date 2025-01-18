local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.OriginalLimbContext);
return function(v3) --[[ Line: 7 ]] --[[ Name: OriginalLimbProvider ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4 = v1.useRef({});
    assert(v4.current ~= nil, "Luau");
    v1.useEffect(function() --[[ Line: 13 ]]
        -- upvalues: v4 (copy)
        return function() --[[ Line: 14 ]]
            -- upvalues: v4 (ref)
            for _, v6 in v4.current do
                v6:Disconnect();
            end;
            table.clear(v4.current);
        end;
    end, {});
    local v9 = v1.useMemo(function() --[[ Line: 23 ]]
        -- upvalues: v4 (copy)
        return {
            isLimbOriginal = function(v7) --[[ Line: 25 ]] --[[ Name: isLimbOriginal ]]
                -- upvalues: v4 (ref)
                return v4.current[v7] ~= nil;
            end, 
            markLimbAsOriginal = function(v8) --[[ Line: 29 ]] --[[ Name: markLimbAsOriginal ]]
                -- upvalues: v4 (ref)
                v4.current[v8] = v8.Destroying:Connect(function() --[[ Line: 30 ]]
                    -- upvalues: v4 (ref), v8 (copy)
                    v4.current[v8]:Disconnect();
                    v4.current[v8] = nil;
                end);
            end
        };
    end, {});
    return v1.createElement(v2.Provider, {
        value = v9
    }, v3.children);
end;