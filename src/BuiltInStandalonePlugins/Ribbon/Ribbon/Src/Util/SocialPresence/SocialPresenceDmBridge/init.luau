local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_CrossPluginCommunication_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.CrossPluginCommunication;
local v3 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagAddUsernameToRibbonAvatars)();
return {
    initAssetDm = function(v4) --[[ Line: 12 ]] --[[ Name: initAssetDm ]]
        -- upvalues: v3 (copy), l_CrossPluginCommunication_0 (copy)
        local l_CollaboratorsService_0 = game:GetService("CollaboratorsService");
        local function v10() --[[ Line: 14 ]]
            -- upvalues: l_CollaboratorsService_0 (copy), v3 (ref), v4 (copy)
            local l_l_CollaboratorsService_0_CollaboratorsList_0 = l_CollaboratorsService_0:GetCollaboratorsList();
            local v7 = {};
            for v8, v9 in ipairs(l_l_CollaboratorsService_0_CollaboratorsList_0) do
                v7[v8] = {
                    UserId = v9.UserId, 
                    CollaboratorColor3 = v9.CollaboratorColor3, 
                    Username = if v3 then v9.Username else nil, 
                    IsIdle = v9.IsIdle
                };
            end;
            v4:Invoke("UpdateCollaborators", v7);
        end;
        l_CollaboratorsService_0.CollaboratorInstanceCreatedSignal:Connect(v10);
        l_CollaboratorsService_0.CollaboratorInstanceDestroyedSignal:Connect(v10);
        l_CollaboratorsService_0.CollaboratorIdleUpdate:Connect(v10);
        v4:OnInvoke("RequestAssetCollaborators", function() --[[ Line: 31 ]]
            -- upvalues: v10 (copy)
            v10();
        end);
        v4:OnInvoke("OpenManageCollaborators", function() --[[ Line: 34 ]]
            -- upvalues: l_CrossPluginCommunication_0 (ref)
            l_CrossPluginCommunication_0.new("ManageCollaborators"):Fire("ToggleManageCollaborators");
        end);
        v4:OnInvoke("ToggleSocialPresenceWidget", function() --[[ Line: 38 ]]
            -- upvalues: l_CrossPluginCommunication_0 (ref)
            l_CrossPluginCommunication_0.new("SocialPresence"):Fire("ToggleSocialPresenceWidget");
        end);
        v10();
    end, 
    requestAssetCollaborators = function(v11) --[[ Line: 46 ]] --[[ Name: requestAssetCollaborators ]]
        v11:Invoke("RequestAssetCollaborators");
    end, 
    openManageCollaborators = function(v12) --[[ Line: 49 ]] --[[ Name: openManageCollaborators ]]
        return v12:Invoke("OpenManageCollaborators");
    end, 
    toggleSocialPresenceWidget = function(v13) --[[ Line: 52 ]] --[[ Name: toggleSocialPresenceWidget ]]
        return v13:Invoke("ToggleSocialPresenceWidget");
    end, 
    connectOnUpdateCollaborators = function(v14, v15) --[[ Line: 56 ]] --[[ Name: connectOnUpdateCollaborators ]]
        return v14:OnInvoke("UpdateCollaborators", v15);
    end, 
    connectOnDmChange = function(v16, v17) --[[ Line: 59 ]] --[[ Name: connectOnDmChange ]]
        return v16:OnInvoke("DmChanged", v17);
    end
};