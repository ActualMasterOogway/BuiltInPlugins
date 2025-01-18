local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Constants);
local v2 = require(l_Parent_0.flags.getFFlagUGCValidateTraversalOptimizations);
return {
    isBodyPart = function(v3) --[[ Line: 10 ]] --[[ Name: isBodyPart ]]
        -- upvalues: v1 (copy)
        return v1.ASSET_TYPE_INFO[v3] and v1.ASSET_TYPE_INFO[v3].isBodyPart;
    end, 
    getBodyPartAssets = function() --[[ Line: 14 ]] --[[ Name: getBodyPartAssets ]]
        -- upvalues: v1 (copy)
        local v4 = {};
        for v5, v6 in v1.ASSET_TYPE_INFO do
            if v6.isBodyPart then
                table.insert(v4, v5);
            end;
        end;
        return v4;
    end, 
    getRigAttachmentToParent = function(v7, v8) --[[ Line: 25 ]] --[[ Name: getRigAttachmentToParent ]]
        -- upvalues: v2 (copy), v1 (copy)
        if v2() and not v7 then
            v7 = v1.UGC_BODY_PART_NAMES_TO_ASSET_TYPE[v8];
        end;
        if v7 then
            local v9 = v1.ASSET_TYPE_INFO[v7];
            if not v9.isBodyPart then
                return "";
            else
                return v9.subParts[v8].rigAttachmentToParent.name;
            end;
        else
            if not v2() then
                for _, v11 in v1.ASSET_TYPE_INFO do
                    if v11.isBodyPart then
                        local v12 = v11.subParts[v8];
                        if v12 then
                            return v12.rigAttachmentToParent.name;
                        end;
                    end;
                end;
            end;
            return "";
        end;
    end, 
    getAttachments = function(v13, v14) --[[ Line: 54 ]] --[[ Name: getAttachments ]]
        -- upvalues: v2 (copy), v1 (copy)
        if v2() and not v13 then
            v13 = v1.UGC_BODY_PART_NAMES_TO_ASSET_TYPE[v14];
        end;
        local v15 = nil;
        if v13 then
            local v16 = v1.ASSET_TYPE_INFO[v13];
            if not v16.isBodyPart then
                return {};
            else
                v15 = v16.subParts[v14];
            end;
        elseif not v2() then
            for _, v18 in v1.ASSET_TYPE_INFO do
                if v18.isBodyPart then
                    v15 = v18.subParts[v14];
                    if v15 then
                        break;
                    end;
                end;
            end;
        end;
        local v19 = {};
        if v15 then
            table.insert(v19, v15.rigAttachmentToParent.name);
            for v20 in v15.otherAttachments do
                table.insert(v19, v20);
            end;
        end;
        return v19;
    end, 
    calculateFullBodyBounds = function(v21) --[[ Line: 91 ]] --[[ Name: calculateFullBodyBounds ]]
        -- upvalues: v1 (copy)
        local v22 = nil;
        local v23 = nil;
        local v24 = nil;
        local l_minSize_0 = v1.ASSET_TYPE_INFO[Enum.AssetType.DynamicHead].bounds[v21].minSize;
        local l_minSize_1 = v1.ASSET_TYPE_INFO[Enum.AssetType.Torso].bounds[v21].minSize;
        local l_minSize_2 = v1.ASSET_TYPE_INFO[Enum.AssetType.LeftArm].bounds[v21].minSize;
        local l_minSize_3 = v1.ASSET_TYPE_INFO[Enum.AssetType.RightArm].bounds[v21].minSize;
        local l_minSize_4 = v1.ASSET_TYPE_INFO[Enum.AssetType.LeftLeg].bounds[v21].minSize;
        local l_minSize_5 = v1.ASSET_TYPE_INFO[Enum.AssetType.RightLeg].bounds[v21].minSize;
        v22 = math.max(l_minSize_1.x + l_minSize_2.x + l_minSize_3.x, l_minSize_4.x + l_minSize_5.x, l_minSize_0.x);
        v23 = math.max(l_minSize_4.y, l_minSize_5.y) + l_minSize_1.y + l_minSize_0.y;
        v24 = math.max(l_minSize_1.z, l_minSize_2.z, l_minSize_3.z, l_minSize_0.z, l_minSize_4.z, l_minSize_5.z);
        l_minSize_0 = nil;
        l_minSize_1 = nil;
        l_minSize_2 = nil;
        l_minSize_3 = v1.ASSET_TYPE_INFO[Enum.AssetType.DynamicHead].bounds[v21].maxSize;
        l_minSize_4 = v1.ASSET_TYPE_INFO[Enum.AssetType.Torso].bounds[v21].maxSize;
        l_minSize_5 = v1.ASSET_TYPE_INFO[Enum.AssetType.LeftArm].bounds[v21].maxSize;
        local l_maxSize_0 = v1.ASSET_TYPE_INFO[Enum.AssetType.RightArm].bounds[v21].maxSize;
        local l_maxSize_1 = v1.ASSET_TYPE_INFO[Enum.AssetType.LeftLeg].bounds[v21].maxSize;
        local l_maxSize_2 = v1.ASSET_TYPE_INFO[Enum.AssetType.RightLeg].bounds[v21].maxSize;
        l_minSize_0 = math.max(l_minSize_4.x + l_minSize_5.x + l_maxSize_0.x, l_maxSize_1.x + l_maxSize_2.x, l_minSize_3.x);
        l_minSize_1 = math.max(l_maxSize_1.y, l_maxSize_2.y) + l_minSize_4.y + l_minSize_3.y;
        l_minSize_2 = math.max(l_minSize_4.z, l_minSize_5.z, l_maxSize_0.z, l_minSize_3.z, l_maxSize_1.z, l_maxSize_2.z);
        return Vector3.new(v22, v23, v24), (Vector3.new(l_minSize_0, l_minSize_1, l_minSize_2));
    end
};