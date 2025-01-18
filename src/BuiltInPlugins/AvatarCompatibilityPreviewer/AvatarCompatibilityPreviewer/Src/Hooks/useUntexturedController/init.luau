local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local function v6(v3) --[[ Line: 7 ]] --[[ Name: untexture ]]
    if v3:IsA("MeshPart") then
        local l_TextureID_0 = v3.TextureID;
        v3.TextureID = "";
        return function() --[[ Line: 14 ]]
            -- upvalues: v3 (copy), l_TextureID_0 (copy)
            v3.TextureID = l_TextureID_0;
        end;
    elseif v3:IsA("SurfaceAppearance") then
        local l_ColorMap_0 = v3.ColorMap;
        v3.ColorMap = "";
        return function() --[[ Line: 23 ]]
            -- upvalues: v3 (copy), l_ColorMap_0 (copy)
            v3.ColorMap = l_ColorMap_0;
        end;
    else
        return nil;
    end;
end;
return function(v7, v8) --[[ Line: 31 ]] --[[ Name: useUntexturedController ]]
    -- upvalues: v1 (copy), v2 (copy), v6 (copy)
    v1.useEffect(function() --[[ Line: 32 ]]
        -- upvalues: v7 (copy), v2 (ref), v8 (copy), v6 (ref)
        if v7 == nil then
            return nil;
        else
            assert(v7 ~= nil, v2.LUAU_ANALYZE_ERROR);
            if v8 then
                return nil;
            else
                local v9 = {};
                for _, v11 in v7:GetDescendants() do
                    v9[v11] = v6(v11);
                end;
                local v13 = v7.DescendantAdded:Connect(function(v12) --[[ Line: 48 ]]
                    -- upvalues: v9 (copy), v6 (ref)
                    v9[v12] = v6(v12);
                end);
                local v15 = v7.DescendantRemoving:Connect(function(v14) --[[ Line: 52 ]]
                    -- upvalues: v9 (copy)
                    v9[v14] = nil;
                end);
                return function() --[[ Line: 56 ]]
                    -- upvalues: v13 (copy), v15 (copy), v9 (copy)
                    v13:Disconnect();
                    v15:Disconnect();
                    for _, v17 in v9 do
                        v17();
                    end;
                end;
            end;
        end;
    end, {
        v8, 
        v7
    });
end;