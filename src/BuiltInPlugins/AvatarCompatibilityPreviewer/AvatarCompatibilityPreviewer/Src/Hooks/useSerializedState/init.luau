local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Hooks.DEPRECATED_useSerializedEffect);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugAvatarPreviewerAvoidSerialization);
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerBetterUseSerializedState);
local function v13(v7, v8, v9, v10) --[[ Line: 16 ]] --[[ Name: DEPRECATED_useSerializedState ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v11, v12 = v1.useState(v9);
    v2(v7, v8, v11, v12, v10);
    return v11, v12;
end;
return function(v14, v15, v16, v17) --[[ Line: 33 ]] --[[ Name: useSerializedState ]]
    -- upvalues: v6 (copy), v13 (copy), v3 (copy), v1 (copy), v5 (copy)
    if not v6() then
        return v13(v14, v15, v16, v17);
    else
        local v18 = v3.ATTRIBUTE_PREFIX .. v15;
        local v20 = v1.useMemo(function() --[[ Line: 45 ]]
            -- upvalues: v5 (ref), v14 (copy), v18 (copy), v16 (copy), v17 (copy)
            local v19 = if v5() then nil else v14:GetAttribute(v18);
            if v19 == nil then
                return v16;
            elseif v17 then
                return (v17.deserialize(v19));
            else
                return v19;
            end;
        end, {
            v14, 
            v18, 
            v17
        });
        local v21, v22 = v1.useState(nil);
        if v21 ~= nil and v21.root ~= v14 and v21.key ~= v15 then
            warn((("%* didn't match"):format(v15)));
        end;
        local v23 = if v21 ~= nil and v21.root == v14 and v21.key == v15 then v21.value else v20;
        local v26 = v1.useCallback(function(v24) --[[ Line: 68 ]]
            -- upvalues: v22 (copy), v15 (copy), v14 (copy), v20 (copy)
            v22(function(v25) --[[ Line: 69 ]]
                -- upvalues: v15 (ref), v14 (ref), v24 (copy), v20 (ref)
                return {
                    key = v15, 
                    root = v14, 
                    value = if typeof(v24) == "function" then v24(if v25 == nil then v20 else v25.value) else v24
                };
            end);
        end, {
            v14, 
            v15, 
            v20
        });
        v1.useEffect(function() --[[ Line: 80 ]]
            -- upvalues: v14 (copy), v18 (copy), v17 (copy), v23 (copy)
            v14:SetAttribute(v18, if v17 then v17.serialize(v23) else v23);
        end, {
            v18, 
            v23, 
            v17, 
            v14
        });
        return v23, v26;
    end;
end;