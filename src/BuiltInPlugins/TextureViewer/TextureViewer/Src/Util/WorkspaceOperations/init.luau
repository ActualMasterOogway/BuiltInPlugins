local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(script.Parent.Stats);
local v3 = require(l_Parent_0.Src.Flags.getFFlagZoomToExtentsApi);
local l_Util_0 = l_Parent_0.Src.Util;
local v5 = require(l_Util_0.Utils);
local v6 = require(l_Util_0.Constants);
local v7 = require(l_Parent_0.Packages.TestLoader);
v0.fetchAllTexturesFromWorkspace = function() --[[ Line: 15 ]] --[[ Name: fetchAllTexturesFromWorkspace ]]
    -- upvalues: v7 (copy), v2 (copy), v6 (copy), v5 (copy)
    if v7.isCli() then
        return {};
    else
        local v8 = {};
        local v9 = {};
        local v10 = v2.fetchTextureSizes();
        for _, v12 in pairs(game.Workspace:GetDescendants()) do
            local l_ClassName_0 = v12.ClassName;
            local v14 = v6.INSTANCE_PROPERTIES_TO_PARSE[l_ClassName_0];
            if v14 then
                for _, v16 in ipairs(v14) do
                    local v17 = v12[v16];
                    if v17 and #v17 > 0 then
                        if v8[v17] == nil then
                            v8[v17] = 1;
                            v9[v17] = {
                                v12
                            };
                        else
                            v8[v17] = v8[v17] + 1;
                            table.insert(v9[v17], v12);
                        end;
                    end;
                end;
            end;
        end;
        local v18 = {};
        for v19, v20 in pairs(v8) do
            local v21 = nil;
            local v22 = nil;
            if string.match(v19, "%d") == nil then
                v22 = v19;
                v21 = v22;
            else
                v22 = v5.parseIdFromTextureAlias(v19);
                v21 = "rbxassetid://" .. v22;
            end;
            table.insert(v18, {
                Texture = v21, 
                Id = v22, 
                Size = v10[v22] and v10[v22] or 0, 
                Count = v20, 
                Instances = v9[v19], 
                ZoomedInstanceIndex = 0
            });
        end;
        table.sort(v18, function(v23, v24) --[[ Line: 67 ]]
            if v23.Size == v24.Size then
                if v23.Count == v24.Count then
                    return v23.Id > v24.Id;
                else
                    return v23.Count > v24.Count;
                end;
            else
                return v23.Size > v24.Size;
            end;
        end);
        return v18;
    end;
end;
v0.replaceAllTexturesWithId = function(v25, v26) --[[ Line: 87 ]] --[[ Name: replaceAllTexturesWithId ]]
    -- upvalues: v6 (copy), v5 (copy)
    for _, v28 in pairs(game.Workspace:GetDescendants()) do
        local l_ClassName_1 = v28.ClassName;
        local v30 = v6.INSTANCE_PROPERTIES_TO_PARSE[l_ClassName_1];
        if v30 then
            for _, v32 in ipairs(v30) do
                local v33 = v28[v32];
                if v5.doesTextureAliasContainId(v33) and v5.parseIdFromTextureAlias(v33) == v25 then
                    v28[v32] = v26;
                elseif v33 == v25 then
                    v28[v32] = v26;
                end;
            end;
        end;
    end;
end;
local function _(v34, v35) --[[ Line: 105 ]] --[[ Name: getCameraOffset ]]
    local l_ViewportSize_0 = v35.ViewportSize;
    local v37 = math.min(1, l_ViewportSize_0.X / l_ViewportSize_0.Y);
    local v38 = math.atan(math.tan((math.rad(v35.FieldOfView / 2))) * v37);
    return v34.Magnitude / 2 / math.sin(v38);
end;
v0.zoomToExtentsAndSelectInstance = function(v40, v41) --[[ Line: 115 ]] --[[ Name: zoomToExtentsAndSelectInstance ]]
    -- upvalues: v3 (copy)
    local v42 = nil;
    local v43 = nil;
    local l_status_0, _ = pcall(function() --[[ Line: 119 ]]
        -- upvalues: v41 (copy), v42 (ref), v43 (ref)
        local l_v41_0 = v41;
        if not l_v41_0:IsA("BasePart") then
            l_v41_0 = l_v41_0:FindFirstAncestorWhichIsA("BasePart");
        end;
        v42 = l_v41_0:IsA("Model") and l_v41_0:GetModelCFrame() or l_v41_0.CFrame;
        v43 = l_v41_0:IsA("Model") and l_v41_0:GetExtentsSize() or l_v41_0.Size;
    end);
    if not l_status_0 then
        return nil;
    else
        if v3() then
            v40:zoomToExtents(v42, v43);
        else
            v40.CameraType = Enum.CameraType.Fixed;
            local l_v43_0 = v43;
            local l_ViewportSize_1 = v40.ViewportSize;
            local v49 = math.min(1, l_ViewportSize_1.X / l_ViewportSize_1.Y);
            local v50 = math.atan(math.tan((math.rad(v40.FieldOfView / 2))) * v49);
            local v51 = l_v43_0.Magnitude / 2 / math.sin(v50);
            l_v43_0 = v40.CFrame;
            v40.CFrame = l_v43_0 - l_v43_0.p + v42.p - l_v43_0.LookVector * v51;
            v40.Focus = v42;
        end;
        return true;
    end;
end;
return v0;