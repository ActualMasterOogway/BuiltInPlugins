local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.flags.getFFlagUGCValidateDynamicHeadMoodClient);
local v2 = require(l_Parent_0.flags.getFFlagUGCValidateDynamicHeadMoodRCC);
local v3 = require(l_Parent_0.flags.getFFlagValidateFacialBounds);
local v4 = require(l_Parent_0.Analytics);
local v5 = require(l_Parent_0.validation.validateSingleInstance);
local v6 = require(l_Parent_0.validation.validateMeshPartBodyPart);
local v7 = require(l_Parent_0.validation.validateDynamicHeadData);
local v8 = require(l_Parent_0.validation.validateDynamicHeadMood);
local _ = require(l_Parent_0.util.Types);
local v10 = require(l_Parent_0.util.createDynamicHeadMeshPartSchema);
return function(v11) --[[ Line: 19 ]] --[[ Name: validateDynamicHeadMeshPartFormat ]]
    -- upvalues: v5 (copy), v6 (copy), v10 (copy), v3 (copy), v2 (copy), v1 (copy), v8 (copy), v4 (copy), v7 (copy)
    assert(v11.instances ~= nil, "instances required in validationContext for validateDynamicHeadMeshPartFormat");
    local l_instances_0 = v11.instances;
    local l_isServer_0 = v11.isServer;
    local v14 = if v11.bypassFlags then v11.bypassFlags.skipSnapshot else false;
    local v15, v16 = v5(l_instances_0, v11);
    if not v15 then
        return v15, v16;
    else
        local v17 = l_instances_0[1];
        local v18, v19 = v6(v17, v10(v11), v11);
        v15 = v18;
        v16 = v19;
        if not v15 then
            return false, v16;
        else
            if not v3() and (l_isServer_0 and v2() or not l_isServer_0 and v1()) and not v14 then
                v18 = tick();
                local v20;
                v19, v20 = v8(v17, l_isServer_0 ~= nil and l_isServer_0);
                v15 = v19;
                v16 = v20;
                v4.recordScriptTime("validateDynamicHeadMood", v18, v11);
                if not v15 then
                    return false, v16;
                end;
            end;
            return v7(v17, v11);
        end;
    end;
end;