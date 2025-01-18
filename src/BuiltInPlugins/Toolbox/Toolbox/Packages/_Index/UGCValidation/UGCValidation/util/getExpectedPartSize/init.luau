local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.getEditableMeshFromContext);
local v3 = require(l_Parent_0.util.getMeshSize);
local v4 = require(l_Parent_0.util.pcallDeferred);
local v5 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v6 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
return function(v7, v8) --[[ Line: 12 ]]
    -- upvalues: v6 (copy), v5 (copy), v2 (copy), v4 (copy), v3 (copy)
    if not v6() or not v5() or not v8.bypassFlags or not v8.bypassFlags.skipPhysicsDataReset then
        return v7.Size;
    else
        if not v8.partSizes then
            v8.partSizes = {};
        end;
        if v8.partSizes[v7] then
            return v8.partSizes[v7];
        else
            local v9 = {
                fullName = v7:GetFullName(), 
                fieldName = "MeshId", 
                contentId = v7.MeshId, 
                context = v7.Name
            };
            local v10, v11 = v2(v7, "MeshId", v8);
            if not v10 then
                return v7.Size;
            else
                v9.editableMesh = v11;
                if v8.editableMeshes[v7].MeshId.created then
                    return v7.Size;
                else
                    local v12, v13 = v4(function() --[[ Line: 49 ]]
                        -- upvalues: v3 (ref), v9 (copy)
                        return v3(v9);
                    end, v8);
                    if not v12 then
                        return v7.Size;
                    else
                        v8.partSizes[v7] = v13;
                        return v13;
                    end;
                end;
            end;
        end;
    end;
end;