local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_deepCopy_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.deepCopy;
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v4 = require(l_Util_0.SaveInterface);
local l_AnimationTagging_0 = require(l_Util_0.PublishTagging).AnimationTagging;
local l_AnimationConversion_0 = l_Util_0.AnimationConversion;
local l_AssetType_0 = require(l_AnimationConversion_0.constants).AssetType;
local v8 = require(l_Util_0.ScriptHistory.revertScripts);
local v9 = require(l_Util_0.ScriptConversionProgressTracker);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v11 = require(l_Actions_0.SetAnimations);
return function(v12) --[[ Line: 23 ]]
    -- upvalues: l_deepCopy_0 (copy), l_AssetType_0 (copy), v4 (copy), l_AnimationTagging_0 (copy), v2 (copy), v9 (copy), v8 (copy), v11 (copy)
    return function(v13) --[[ Line: 24 ]]
        -- upvalues: l_deepCopy_0 (ref), l_AssetType_0 (ref), v4 (ref), l_AnimationTagging_0 (ref), v12 (copy), v2 (ref), v9 (ref), v8 (ref), v11 (ref)
        local v14 = v13:getState();
        local l_animations_0 = v14.AnimationConversion.animations;
        local v16 = l_deepCopy_0(l_animations_0);
        local v17 = {};
        for v18 in v14.AnimationConversion.selection do
            local v19 = {};
            local v20 = v16[v18];
            if next(v20.oldRefs) then
                for v21, v22 in v20.oldRefs do
                    if v22:IsA(l_AssetType_0.LocalAsset) then
                        local v23 = v4.getR6KeyframeSequence(v21);
                        v21:ClearAllChildren();
                        for _, v25 in v23:GetChildren() do
                            v25:Clone().Parent = v21;
                        end;
                        table.insert(v19, v21);
                        l_AnimationTagging_0:addTag(v21);
                    elseif v22:IsA(l_AssetType_0.AnimationInstance) then
                        v21.AnimationId = v22.url;
                        table.insert(v19, v21);
                        l_AnimationTagging_0:addTag(v21);
                    elseif v22:IsA(l_AssetType_0.AssetIdString) then
                        v17[v12:findScriptGUID(v21.scriptInstance)] = true;
                    end;
                end;
                v20:addRefs(v19);
            end;
        end;
        if next(v17) then
            local v26 = v2.Dictionary.keys(v17);
            local v27 = v9.new("Revert", #v26, v13);
            v8(v26, v12, function() --[[ Line: 65 ]]
                -- upvalues: v27 (copy)
                v27:updateProgress();
            end);
            v27:clearProgressBar();
        end;
        v13:dispatch(v11(v16));
    end;
end;