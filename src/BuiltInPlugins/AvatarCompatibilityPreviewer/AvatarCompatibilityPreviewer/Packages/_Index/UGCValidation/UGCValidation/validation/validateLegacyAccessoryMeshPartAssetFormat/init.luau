local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.createLegacyAccessoryMeshPartAssetFormatSchema);
local v3 = require(l_Parent_0.validation.validateSingleInstance);
local v4 = require(l_Parent_0.validation.validateInstanceTree);
local v5 = require(l_Parent_0.validation.validateLegacyAccessoryMeshPartAssetFormatMatch);
local v6 = require(l_Parent_0.validation.validateAccessoryName);
local v7 = require(l_Parent_0.flags.getFFlagUGCValidationNameCheck);
return function(v8, v9) --[[ Line: 15 ]] --[[ Name: validateLegacyAccessoryMeshPartAssetFormat ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy), v7 (copy), v6 (copy), v5 (copy)
    local l_instances_0 = v9.instances;
    local l_isServer_0 = v9.isServer;
    local v12 = nil;
    local v13 = nil;
    local v14, v15 = v3(l_instances_0, v9);
    v12 = v14;
    v13 = v15;
    if not v12 then
        return false, v13;
    else
        v14 = l_instances_0[1];
        local l_Attachment_0 = v8:FindFirstChild("Handle"):FindFirstChildOfClass("Attachment");
        local v17 = v2(l_Attachment_0.Name);
        local v18, v19 = v4(v17, v14, v9);
        v12 = v18;
        v13 = v19;
        if not v12 then
            return false, v13;
        else
            if v7() and l_isServer_0 then
                v18, v19 = v6(v14, v9);
                v12 = v18;
                v13 = v19;
                if not v12 then
                    return false, v13;
                end;
            end;
            v18, v19 = v5(v14, v8, v9);
            v12 = v18;
            v13 = v19;
            if not v12 then
                return false, v13;
            else
                return true;
            end;
        end;
    end;
end;