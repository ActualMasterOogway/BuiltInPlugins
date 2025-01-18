local l_StudioService_0 = game:GetService("StudioService");
return function(v1) --[[ Line: 3 ]]
    -- upvalues: l_StudioService_0 (copy)
    return {
        manageCollaboratorsPressed = function(v2) --[[ Line: 5 ]] --[[ Name: manageCollaboratorsPressed ]]
            -- upvalues: v1 (copy), l_StudioService_0 (ref)
            local v3 = {
                actionName = v2, 
                studioSid = v1:GetSessionId(), 
                clientId = v1:GetClientId(), 
                placeId = game.PlaceId, 
                userId = l_StudioService_0:GetUserId()
            };
            v1:SendEventDeferred("studio", "SocialPresence", "StudioSocialPresenceAction", v3);
        end
    };
end;