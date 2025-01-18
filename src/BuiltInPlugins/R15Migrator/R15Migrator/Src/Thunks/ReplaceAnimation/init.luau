local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_deepCopy_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.deepCopy;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local l_AnimationTagging_0 = require(l_Util_0.PublishTagging).AnimationTagging;
local v5 = require(l_Util_0.ScriptReplacement);
local l_AnimationConversion_0 = l_Util_0.AnimationConversion;
local v7 = require(l_AnimationConversion_0.AnimationConversionManager);
local l_AssetType_0 = require(l_AnimationConversion_0.constants).AssetType;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v10 = require(l_Actions_0.SetAnimation);
local function v23(v11, v12, v13, v14) --[[ Line: 20 ]] --[[ Name: replaceScriptAnimations ]]
    -- upvalues: v7 (copy), v5 (copy)
    local v15 = nil;
    for v16, v17 in v11 do
        local v18 = v13:findScriptGUID(v16);
        if v15 == nil then
            v15 = v18;
        end;
        for _, v20 in v17 do
            local v21 = v12[v18];
            local v22 = v7.getConvertedAnimationAssetInfo(v20.info);
            if v22.id then
                v5.replaceWithSuggestion(v18, v20.ref.range, v13, v22.url, v21, v14);
            end;
        end;
        if v18 ~= v15 then
            v13:closeScriptIfOpen(v18);
        end;
    end;
    if v15 then
        v13:closeScriptIfOpen(v15);
    end;
end;
return function(v24, v25, v26) --[[ Line: 57 ]] --[[ Name: replaceAnimation ]]
    -- upvalues: l_ChangeHistoryService_0 (copy), v7 (copy), l_deepCopy_0 (copy), l_AssetType_0 (copy), l_AnimationTagging_0 (copy), v10 (copy), v23 (copy)
    return function(v27) --[[ Line: 58 ]]
        -- upvalues: l_ChangeHistoryService_0 (ref), v24 (copy), v7 (ref), l_deepCopy_0 (ref), l_AssetType_0 (ref), l_AnimationTagging_0 (ref), v10 (ref), v23 (ref), v25 (copy), v26 (copy)
        local v28 = v27:getState();
        local l_animations_0 = v28.AnimationConversion.animations;
        local l_diagnostics_0 = v28.ScriptConversion.diagnostics;
        l_ChangeHistoryService_0:SetWaypoint("preReplace");
        local v31 = {};
        for _, v33 in v24 do
            local v34 = v7.getConvertedAnimationAssetInfo(v33);
            if not v34.id then
                return;
            elseif not v33:IsA(v34._type) then
                return;
            elseif next(l_animations_0[v33.id].refs) then
                local v35 = l_deepCopy_0(l_animations_0[v33.id]);
                local v36 = v7.getConvertedKeyframeSequence(v33);
                local v37 = {};
                local v38 = 0;
                for v39, v40 in v35.refs do
                    if v40:IsA(l_AssetType_0.LocalAsset) then
                        v39:ClearAllChildren();
                        for _, v42 in v36:GetChildren() do
                            v42:Clone().Parent = v39;
                        end;
                        table.insert(v37, v39);
                        l_AnimationTagging_0:removeTag(v39);
                    elseif v40:IsA(l_AssetType_0.AnimationInstance) then
                        v39.AnimationId = v34.url;
                        table.insert(v37, v39);
                        l_AnimationTagging_0:removeTag(v39);
                    elseif v40:IsA(l_AssetType_0.AssetIdString) then
                        local l_scriptInstance_0 = v39.scriptInstance;
                        if v31[l_scriptInstance_0] then
                            table.insert(v31[l_scriptInstance_0], {
                                ref = v39, 
                                info = v33
                            });
                        else
                            v31[l_scriptInstance_0] = {
                                {
                                    ref = v39, 
                                    info = v33
                                }
                            };
                        end;
                    end;
                    v38 = v38 + 1;
                end;
                if v38 == #v37 then
                    v35:complete();
                else
                    v35:removeRefs(v37);
                end;
                v27:dispatch(v10(v33.id, v35));
            end;
        end;
        v23(v31, l_diagnostics_0, v25, v26);
        l_ChangeHistoryService_0:SetWaypoint("postReplace");
    end;
end;