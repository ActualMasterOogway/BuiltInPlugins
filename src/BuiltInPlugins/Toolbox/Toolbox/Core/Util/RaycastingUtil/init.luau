local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Core.Util.findParentModelWithSourceAssetID);
return {
    raycastObjectsInSphere = function(v2) --[[ Line: 7 ]]
        -- upvalues: v1 (copy)
        if not v2 then
            return {};
        else
            local v3 = {};
            local v4 = 0;
            for v5 = 1, 256 do
                local v6 = math.acos(1 - (2 * v5 - 1) / 256);
                local v7 = 3.8832220774509327 * v5;
                local v8 = Vector3.new(math.sin(v6) * math.cos(v7), math.sin(v6) * math.sin(v7), (math.cos(v6)));
                local v9 = Ray.new(v2.CFrame.Position, v8 * 500);
                local v10 = workspace:Raycast(v9.Origin, v9.Direction * 500);
                if v10 and v10.Instance then
                    local v11 = v1(v10.Instance);
                    if v11 then
                        local l_SourceAssetId_0 = v11.SourceAssetId;
                        if l_SourceAssetId_0 and l_SourceAssetId_0 ~= -1 and not v3[l_SourceAssetId_0] then
                            v4 = v4 + 1;
                            v3[l_SourceAssetId_0] = v10.Distance;
                            if v4 >= 10 then
                                break;
                            end;
                        end;
                    end;
                end;
            end;
            return v3;
        end;
    end, 
    raycastObjectsVisibleInViewport = function(v13) --[[ Line: 54 ]]
        -- upvalues: v1 (copy)
        if not v13 then
            return {};
        else
            local l_ViewportSize_0 = v13.ViewportSize;
            local v15 = {};
            local v16 = 0;
            local v17 = 0;
            local v18 = 1;
            local v19 = 0;
            local v20 = 0;
            local v21 = 1;
            local v22 = 0;
            for _ = 1, 256 do
                local v24 = Vector2.new((v17 + 0.5 + 7) * (l_ViewportSize_0.X / 16), (v19 + 0.5 + 7) * (l_ViewportSize_0.Y / 16));
                local v25 = v13:ScreenPointToRay(v24.X, v24.Y);
                local v26 = workspace:Raycast(v25.Origin, v25.Direction * 500);
                if v26 and v26.Instance then
                    local v27 = v1(v26.Instance);
                    if v27 then
                        local l_SourceAssetId_1 = v27.SourceAssetId;
                        if l_SourceAssetId_1 and l_SourceAssetId_1 ~= -1 and not v15[l_SourceAssetId_1] then
                            v16 = v16 + 1;
                            v15[l_SourceAssetId_1] = v26.Distance;
                            if v16 >= 10 then
                                break;
                            end;
                        end;
                    end;
                end;
                v17 = v17 + v18;
                v19 = v19 + v20;
                v22 = v22 + 1;
                if v22 == v21 then
                    v22 = 0;
                    local l_v18_0 = v18;
                    v18 = -v20;
                    v20 = l_v18_0;
                    if v20 == 0 then
                        v21 = v21 + 1;
                    end;
                end;
            end;
            return v15;
        end;
    end
};