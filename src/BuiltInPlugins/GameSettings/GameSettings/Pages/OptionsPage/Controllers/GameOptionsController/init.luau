local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_isTeamCreateEnabled_0 = require(l_Parent_0.Src.Util.GameSettingsUtilities).isTeamCreateEnabled;
local v2 = {};
v2.__index = v2;
v2.new = function(v3) --[[ Line: 7 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    return (setmetatable({
        __networking = v3
    }, v2));
end;
v2.universesShutdownV2POST = function(v4, v5) --[[ Line: 15 ]] --[[ Name: universesShutdownV2POST ]]
    return v4.__networking:post("develop", "/v2/universes/" .. v5 .. "/shutdown", {
        Body = {}
    });
end;
v2.voiceUniverseSettingsPOST = function(v6, v7, v8) --[[ Line: 28 ]] --[[ Name: voiceUniverseSettingsPOST ]]
    return v6.__networking:post("voice", "/v1/settings/universe/" .. v7, {
        Body = {
            optIn = v8
        }
    });
end;
v2.voiceUniverseSettingsGET = function(v9, v10) --[[ Line: 38 ]] --[[ Name: voiceUniverseSettingsGET ]]
    return v9.__networking:get("voice", "/v1/settings/universe/" .. v10);
end;
v2.getScriptCollaborationEnabledOnServer = function(_, v12) --[[ Line: 43 ]] --[[ Name: getScriptCollaborationEnabledOnServer ]]
    -- upvalues: l_isTeamCreateEnabled_0 (copy)
    if not l_isTeamCreateEnabled_0() then
        return false;
    else
        return v12:GetService("VersionControlService").ScriptCollabEnabled;
    end;
end;
v2.getScriptCollaborationEnabled = function(_, v14) --[[ Line: 53 ]] --[[ Name: getScriptCollaborationEnabled ]]
    return v14:GetService("StudioData").EnableScriptCollabByDefaultOnLoad;
end;
v2.setScriptCollaborationEnabled = function(_, v16, v17) --[[ Line: 59 ]] --[[ Name: setScriptCollaborationEnabled ]]
    v16:GetService("StudioData").EnableScriptCollabByDefaultOnLoad = v17;
end;
v2.shutdownAllServers = function(v18, v19) --[[ Line: 65 ]] --[[ Name: shutdownAllServers ]]
    v18:universesShutdownV2POST(v19):await();
end;
v2.getVoiceChatEnabled = function(v20, v21) --[[ Line: 69 ]] --[[ Name: getVoiceChatEnabled ]]
    return v20:voiceUniverseSettingsGET(v21):await().responseBody.isUniverseEnabledForVoice;
end;
v2.setVoiceChatEnabled = function(v22, v23, v24) --[[ Line: 74 ]] --[[ Name: setVoiceChatEnabled ]]
    v22:voiceUniverseSettingsPOST(v23, v24):await();
end;
v2.getIsTeamCreateEnabled = function(_) --[[ Line: 78 ]] --[[ Name: getIsTeamCreateEnabled ]]
    -- upvalues: l_isTeamCreateEnabled_0 (copy)
    return l_isTeamCreateEnabled_0();
end;
return v2;