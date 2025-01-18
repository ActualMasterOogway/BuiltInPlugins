local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.util.ParseContentIds);
local v4 = require(l_Parent_0.util.getMeshMinMax);
local function v12(v5, v6, v7) --[[ Line: 18 ]] --[[ Name: formatError ]]
    -- upvalues: v3 (copy)
    local function _(v8) --[[ Line: 19 ]] --[[ Name: getContext ]]
        -- upvalues: v3 (ref)
        return (v8.context and v8.context .. " mesh " or "mesh ") .. v3.tryGetAssetIdFromContentId(v8.contentId);
    end;
    local v10 = (v5.context and v5.context .. " mesh " or "mesh ") .. v3.tryGetAssetIdFromContentId(v5.contentId);
    local v11 = (v6.context and v6.context .. " mesh " or "mesh ") .. v3.tryGetAssetIdFromContentId(v6.contentId);
    return string.format("%s is more than max difference %.2f in size compared to the other mesh %s. You need to edit the model to adjust its size", v10, v7, v11);
end;
return function(v13, v14, v15, v16) --[[ Line: 36 ]] --[[ Name: validateMeshComparison ]]
    -- upvalues: v4 (copy), v2 (copy), v12 (copy)
    local v17, v18, v19, v20 = v4(v13, v16);
    if not v17 then
        return v17, v18;
    else
        local v21, v22, v23, v24 = v4(v14, v16);
        if not v21 then
            return v21, v22;
        elseif v15 < (v19 - v23).Magnitude or v15 < (v20 - v24).Magnitude then
            v2.reportFailure(v2.ErrorType.validateMeshComparison, nil, v16);
            return false, {
                v12(v13, v14, v15)
            };
        else
            return true;
        end;
    end;
end;