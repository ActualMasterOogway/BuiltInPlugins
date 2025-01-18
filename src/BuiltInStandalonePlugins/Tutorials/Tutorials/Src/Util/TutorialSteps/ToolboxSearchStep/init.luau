local v0 = require(script.Parent.TutorialStep).extend("ToolboxSearch");
v0.bind = function(v1) --[[ Line: 4 ]] --[[ Name: bind ]]
    local l_toolboxConnection_0 = v1.tutorial.toolboxConnection;
    l_toolboxConnection_0:ensureEventExists("SearchRequested");
    v1.connection = l_toolboxConnection_0:Connect("SearchRequested", function() --[[ Line: 7 ]]
        -- upvalues: v1 (copy)
        v1:complete();
    end);
end;
v0.unbind = function(v3) --[[ Line: 12 ]] --[[ Name: unbind ]]
    v3.connection:Disconnect();
end;
return v0;