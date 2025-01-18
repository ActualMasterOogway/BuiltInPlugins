local l_Selection_0 = game:GetService("Selection");
local l_RobloxPluginGuiService_0 = game:GetService("RobloxPluginGuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v3 = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v4 = require(l_script_FirstAncestor_0.Src.Thunks.Exporting.SaveAnimation);
local v5 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v6 = require(l_script_FirstAncestor_0.Src.Util.Constants);
return function(v7, v8) --[[ Line: 15 ]]
    -- upvalues: v4 (copy), v3 (copy), l_Selection_0 (copy), v5 (copy), v6 (copy), l_RobloxPluginGuiService_0 (copy)
    return function(v9) --[[ Line: 16 ]]
        -- upvalues: v4 (ref), v8 (copy), v3 (ref), l_Selection_0 (ref), v7 (copy), v5 (ref), v6 (ref), l_RobloxPluginGuiService_0 (ref)
        local v10 = v9:getState();
        local l_AnimationData_0 = v10.AnimationData;
        local l_IsLegacyAnimSaves_0 = v10.Status.IsLegacyAnimSaves;
        local l_RootInstance_0 = v10.Status.RootInstance;
        if not l_AnimationData_0 or not l_RootInstance_0 then
            return;
        else
            local l_Name_0 = l_AnimationData_0.Metadata.Name;
            v9:dispatch(v4(l_Name_0, v8));
            local v15, v16 = v3.getAnimSavesFolder(l_RootInstance_0);
            if l_IsLegacyAnimSaves_0 then
                v15 = v16;
            end;
            local v17 = v15 and v15:FindFirstChild(l_Name_0);
            if v15 and v17 then
                local v18 = nil;
                do
                    local l_v18_0 = v18;
                    l_v18_0 = l_Selection_0.SelectionChanged:Connect(function(_) --[[ Line: 35 ]]
                        -- upvalues: l_v18_0 (ref), v7 (ref)
                        l_v18_0:Disconnect();
                        v7:get():SaveSelectedToRoblox();
                    end);
                    local v21 = false;
                    local v22 = nil;
                    v21 = v5.hasFacsData(l_AnimationData_0);
                    v22 = if v5.isChannelAnimation(l_AnimationData_0) then v6.ANIMATION_TYPE.CurveAnimation else v6.ANIMATION_TYPE.KeyframeSequence;
                    local l_FirstChild_0 = l_RobloxPluginGuiService_0:FindFirstChild("AnimationClipEditor"):FindFirstChild(v6.ANIMATION_UPLOAD_SUCCESS_EVENT_NAME);
                    local v24 = nil;
                    v24 = l_FirstChild_0.Event:Connect(function(v25, v26) --[[ Line: 53 ]]
                        -- upvalues: v8 (ref), v21 (ref), v22 (ref), l_AnimationData_0 (copy), v17 (copy), v24 (ref)
                        v8:report("onExportAnimation", v21, v22, v25, if l_AnimationData_0.Metadata then l_AnimationData_0.Metadata.Guid else nil);
                        if v26 then
                            v17:Destroy();
                        end;
                        v24:Disconnect();
                    end);
                    l_Selection_0:Set({
                        v17
                    });
                end;
            end;
            return;
        end;
    end;
end;