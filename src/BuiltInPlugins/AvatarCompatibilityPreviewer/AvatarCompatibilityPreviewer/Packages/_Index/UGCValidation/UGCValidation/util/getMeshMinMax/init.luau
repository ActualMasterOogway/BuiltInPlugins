local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.pcallDeferred);
local v4 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v5 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v6 = require(l_Parent_0.util.calculateMinMax);
local function v17(v7, v8, v9) --[[ Line: 20 ]] --[[ Name: getVerts ]]
    -- upvalues: v5 (copy), v4 (copy), v3 (copy), l_UGCValidationService_0 (copy)
    local v10 = nil;
    local v11 = nil;
    if v5() and v4() then
        local v12, v13 = v3(function() --[[ Line: 27 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v7 (copy)
            return l_UGCValidationService_0:GetEditableMeshVerts(v7.editableMesh);
        end, v9);
        v10 = v12;
        v11 = v13;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 31 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v7 (copy)
            return l_UGCValidationService_0:GetMeshVerts(v7.contentId);
        end);
        v10 = l_status_0;
        v11 = l_result_0;
    end;
    if not v10 then
        local v16 = "Failed to read mesh: " .. v7.fullName;
        if v8 then
            error(v16);
        end;
        return false, {
            v16
        };
    else
        return true, nil, v11;
    end;
end;
local function v27(v18, v19) --[[ Line: 49 ]] --[[ Name: getBoundsInfo ]]
    -- upvalues: v6 (copy)
    local v20 = nil;
    local v21 = nil;
    for _, v23 in pairs(v18) do
        local v24 = if v19 then v23 * v19 else v23;
        local v25, v26 = v6(v20, v21, v24, v24);
        v20 = v25;
        v21 = v26;
    end;
    return v20, v21;
end;
return function(v28, v29) --[[ Line: 60 ]] --[[ Name: getMeshMinMax ]]
    -- upvalues: v17 (copy), v27 (copy)
    local l_isServer_0 = v29.isServer;
    local v31, v32, v33 = v17(v28, l_isServer_0, v29);
    if not v31 then
        return v31, v32;
    elseif not v33 or #v33 == 0 then
        return false, {
            "Mesh: " .. v28.fullName .. " contains no verts"
        };
    else
        local v34, v35 = v27(v33, v28.scale);
        return true, nil, v34, v35;
    end;
end;