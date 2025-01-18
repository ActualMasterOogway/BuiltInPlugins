local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Util.CharacterHashUtils);
local v2 = require(l_script_FirstAncestor_0.Src.Util.DataModelUtils);
local v3 = require(l_script_FirstAncestor_0.Src.Hooks.DEPRECATED_useTransformedSelectedInstance);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Maid);
local v5 = require(l_script_FirstAncestor_0.Packages.React);
local v6 = require(l_script_FirstAncestor_0.Src.Util.SelectionWrapper);
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
local v8 = require(l_script_FirstAncestor_0.Src.Util.isAvatar);
local v9 = require(l_script_FirstAncestor_0.Src.Hooks.useEventConnection);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function v12() --[[ Line: 16 ]] --[[ Name: DEPRECATED_useSelectedAvatar ]]
    -- upvalues: v7 (copy), v3 (copy), v8 (copy)
    assert(not v7(), "getFFlagAvatarPreviewerUseAnyModel() is enabled");
    return v3(function(v11) --[[ Line: 19 ]]
        -- upvalues: v8 (ref)
        if not v8(v11) then
            return nil;
        else
            return {
                WorldModel = v11, 
                ProportionalScale = 1, 
                WorldModelScale = 1, 
                LatestWorldModelHash = ""
            };
        end;
    end);
end;
local v13 = table.freeze({});
return function() --[[ Line: 41 ]] --[[ Name: useSelectedAvatar ]]
    -- upvalues: v7 (copy), v12 (copy), v6 (copy), v5 (copy), v8 (copy), v9 (copy), v13 (copy), v1 (copy), v4 (copy), v2 (copy)
    if not v7() then
        return v12();
    else
        local v14 = v6:use():get();
        local v15 = v5.useCallback(function() --[[ Line: 48 ]]
            -- upvalues: v14 (copy)
            return v14:Get();
        end, {
            v14
        });
        local v18 = v5.useCallback(function() --[[ Line: 52 ]]
            -- upvalues: v14 (copy), v8 (ref)
            local v16 = v14:Get();
            if #v16 == 0 then
                return nil;
            else
                local v17 = v16[1];
                if not v8(v17) then
                    return nil;
                else
                    return v17;
                end;
            end;
        end, {
            v14
        });
        local v19, v20 = v5.useState(v18);
        local v21, v22 = v5.useState(v15);
        v9(v14.SelectionChanged, function() --[[ Line: 70 ]]
            -- upvalues: v20 (copy), v18 (copy), v22 (copy), v15 (copy)
            v20(function(v23) --[[ Line: 71 ]]
                -- upvalues: v18 (ref)
                return v18() or v23;
            end);
            v22(v15());
        end, {
            v18, 
            v15, 
            v14
        });
        local v29 = v5.useCallback(function(v24) --[[ Line: 77 ]]
            -- upvalues: v19 (copy), v13 (ref), v8 (ref), v1 (ref)
            if v19 == nil then
                return v13;
            elseif not v8(v19) then
                return v13;
            else
                local v25 = v1.computeHashSerializeContext({
                    v19
                }, {
                    ignoreUniformScaleChanges = true, 
                    ignoreAccessories = true
                });
                local v26 = {
                    originalDummy = v19, 
                    relativeScale = v25.relativeScale, 
                    hash = v1.hashCharacter(v19, v25)
                };
                for v27, v28 in v26 do
                    if v24[v27] ~= v28 then
                        return v26;
                    end;
                end;
                return v24;
            end;
        end, {
            v19
        });
        local v30, v31 = v5.useState(function() --[[ Line: 107 ]]
            -- upvalues: v29 (copy), v13 (ref)
            return v29(v13);
        end);
        v5.useEffect(function() --[[ Line: 112 ]]
            -- upvalues: v19 (copy), v31 (copy), v29 (copy), v4 (ref), v2 (ref)
            if v19 == nil then
                v31(v29);
                return;
            else
                local v32 = v4.new();
                v32:giveTask(v2.throttleDeferWatchForChanges(v19, function() --[[ Line: 120 ]]
                    -- upvalues: v31 (ref), v29 (ref)
                    v31(v29);
                end));
                v32:giveTask(v19.AncestryChanged:Connect(function() --[[ Line: 124 ]]
                    -- upvalues: v31 (ref), v29 (ref)
                    v31(v29);
                end));
                v31(v29);
                return function() --[[ Line: 130 ]]
                    -- upvalues: v32 (copy)
                    v32:destroy();
                end;
            end;
        end, {
            v19, 
            v29
        });
        return v5.useMemo(function() --[[ Line: 135 ]]
            -- upvalues: v30 (copy)
            if v30.originalDummy == nil then
                return nil;
            else
                return {
                    WorldModel = v30.originalDummy, 
                    ProportionalScale = v30.relativeScale, 
                    WorldModelScale = v30.originalDummy:GetScale(), 
                    LatestWorldModelHash = v30.hash
                };
            end;
        end, {
            v30.originalDummy, 
            v30.hash, 
            v30.relativeScale
        }), (v5.useMemo(function() --[[ Line: 149 ]]
            -- upvalues: v21 (copy), v30 (copy)
            if v21 == nil then
                return false;
            else
                local l_originalDummy_0 = v30.originalDummy;
                for _, v35 in v21 do
                    if v35 == l_originalDummy_0 then
                        return true;
                    end;
                end;
                return false;
            end;
        end, {
            v21, 
            v30.originalDummy
        }));
    end;
end;