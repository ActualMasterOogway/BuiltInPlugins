return function() --[[ Line: 4 ]]
    return function(v0, v1) --[[ Line: 5 ]]
        local l_gameId_0 = v0:getState().Metadata.gameId;
        v1.gameOptionsController:shutdownAllServers(l_gameId_0);
    end;
end;