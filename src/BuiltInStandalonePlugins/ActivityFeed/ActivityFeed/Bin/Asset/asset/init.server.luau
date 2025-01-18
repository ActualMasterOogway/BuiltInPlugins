require(script.Parent.Parent.Common.defineLuaFlags);
local l_COLLAB6856FixAHPublish_0 = game:GetFastFlag("COLLAB6856FixAHPublish");
if game:GetService("RunService"):IsEdit() then
    local l_PlaceId_0 = game.PlaceId;
    local l_GameId_0 = game.GameId;
    plugin:SetItem("placeid", l_PlaceId_0);
    plugin:SetItem("universeid", l_GameId_0);
    plugin:Invoke("idsupdated");
    game:GetPropertyChangedSignal("PlaceId"):Connect(function() --[[ Line: 15 ]]
        plugin:SetItem("placeid", game.PlaceId);
        plugin:Invoke("idsupdated");
    end);
    game:GetPropertyChangedSignal("GameId"):Connect(function() --[[ Line: 19 ]]
        plugin:SetItem("universeid", game.GameId);
        plugin:Invoke("idsupdated");
    end);
    if l_COLLAB6856FixAHPublish_0 then
        plugin:OnInvoke("publishgame", function() --[[ Line: 25 ]]
            game:GetService("StudioPublishService"):ShowSaveOrPublishPlaceToRoblox(false, false, Enum.StudioCloseMode.None);
        end);
    end;
end;
if not plugin then
    return;
else
    local l_Parent_0 = script.Parent.Parent.Parent;
    local v4 = require(l_Parent_0.Packages.TestLoader);
    v4.launch("ActivityFeed", l_Parent_0.Src);
    if v4.isCli() then
        return;
    else
        return;
    end;
end;