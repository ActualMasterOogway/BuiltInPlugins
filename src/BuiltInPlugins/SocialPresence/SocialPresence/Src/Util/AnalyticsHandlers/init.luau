local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local l_StudioService_0 = game:GetService("StudioService");
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v1 (copy), l_StudioService_0 (copy)
    local function v6(v4) --[[ Line: 7 ]] --[[ Name: sendEvent ]]
        -- upvalues: v1 (ref), v3 (copy), l_StudioService_0 (ref)
        if game:GetFastFlag("COLLAB5863Telemetry") then
            local v5 = v4 or {};
            v5 = v1.Dictionary.join({
                studioSid = v3:GetSessionId(), 
                clientId = v3:GetClientId(), 
                placeId = game.PlaceId, 
                userId = l_StudioService_0:GetUserId()
            }, v5);
            v3:SendEventDeferred("studio", "SocialPresence", "StudioSocialPresenceAction", v5);
        end;
    end;
    return {
        panelToggled = function(_, v8) --[[ Line: 21 ]] --[[ Name: panelToggled ]]
            -- upvalues: v6 (copy)
            v6({
                actionName = v8 and "panelEnabled" or "panelDisabled"
            });
        end, 
        highlightsToggled = function(_, v10) --[[ Line: 25 ]] --[[ Name: highlightsToggled ]]
            -- upvalues: v6 (copy)
            v6({
                actionName = v10 and "highlightsEnabled" or "highlightsDisabled"
            });
        end, 
        jumpToCollaboratorPressed = function(v11) --[[ Line: 29 ]] --[[ Name: jumpToCollaboratorPressed ]]
            -- upvalues: v6 (copy)
            v6({
                actionName = v11
            });
        end, 
        manageCollaboratorsPressed = function(v12) --[[ Line: 33 ]] --[[ Name: manageCollaboratorsPressed ]]
            -- upvalues: v6 (copy)
            v6({
                actionName = v12
            });
        end
    };
end;