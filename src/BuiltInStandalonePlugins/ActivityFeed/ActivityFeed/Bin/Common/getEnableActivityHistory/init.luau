if game:GetFastFlag("COLLAB4260ActivityFeed") then
    if not game:GetFastFlag("COLLAB6169UseIXPActivityFeed") then
        return true;
    else
        local l_game_FastString_0 = game:GetFastString("ActivityHistoryIxpLayer");
        if not l_game_FastString_0 or l_game_FastString_0 == "" then
            return true;
        else
            local l_IXPService_0 = game:GetService("IXPService");
            local l_l_IXPService_0_UserLayerLoadingStatus_0 = l_IXPService_0:GetUserLayerLoadingStatus();
            while l_l_IXPService_0_UserLayerLoadingStatus_0 == Enum.IXPLoadingStatus.None or l_l_IXPService_0_UserLayerLoadingStatus_0 == Enum.IXPLoadingStatus.Pending do
                l_IXPService_0.OnUserLayerLoadingStatusChanged:Wait();
                l_l_IXPService_0_UserLayerLoadingStatus_0 = l_IXPService_0:GetUserLayerLoadingStatus();
            end;
            if l_IXPService_0:GetUserStatusForLayer(l_game_FastString_0) == Enum.IXPLoadingStatus.Initialized then
                l_IXPService_0:LogUserLayerExposure(l_game_FastString_0);
                local l_l_IXPService_0_UserLayerVariables_0 = l_IXPService_0:GetUserLayerVariables(l_game_FastString_0);
                if l_l_IXPService_0_UserLayerVariables_0 and not l_l_IXPService_0_UserLayerVariables_0.enabled then
                    return false;
                end;
            end;
            return true;
        end;
    end;
else
    return false;
end;