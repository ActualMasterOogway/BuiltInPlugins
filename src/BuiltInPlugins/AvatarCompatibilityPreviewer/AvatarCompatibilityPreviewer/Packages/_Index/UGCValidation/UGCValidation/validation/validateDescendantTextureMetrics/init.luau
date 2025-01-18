local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.Constants);
local v3 = require(l_Parent_0.validation.validateTextureSize);
local v4 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v5 = require(l_Parent_0.util.ParseContentIds);
local v6 = require(l_Parent_0.util.getEditableImageFromContext);
local v7 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
return function(v8, v9) --[[ Line: 21 ]] --[[ Name: validateDescendantTextureMetrics ]]
    -- upvalues: v4 (copy), v5 (copy), v2 (copy), v7 (copy), v6 (copy), v3 (copy)
    local v10 = v4.new();
    local v11 = v5.parse(v8, v2.TEXTURE_CONTENT_ID_FIELDS, v9);
    local v12 = {};
    for _, v14 in v11 do
        local v15 = {
            fullName = v14.instance:GetFullName(), 
            fieldName = v14.fieldName, 
            contentId = v14.instance[v14.fieldName]
        };
        if v7() then
            local v16, v17 = v6(v14.instance, v14.fieldName, v9);
            if not v16 then
                return false, {
                    "Failed to load texture data"
                };
            else
                v15.editableImage = v17;
            end;
        end;
        if not v12[v14.id] then
            v10:updateReasons(v3(v15, nil, v9));
            if v14.id then
                v12[v14.id] = true;
            end;
        end;
    end;
    return v10:getFinalResults();
end;