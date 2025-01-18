local v0 = require(script.Parent.TutorialStep).extend("ToolboxInsert");
v0.showComplete = true;
v0.bind = function(v1) --[[ Line: 6 ]] --[[ Name: bind ]]
    local l_toolboxConnection_0 = v1.tutorial.toolboxConnection;
    l_toolboxConnection_0:ensureEventExists("AssetInserted");
    v1.connection = l_toolboxConnection_0:Connect("AssetInserted", function() --[[ Line: 9 ]]
        -- upvalues: v1 (copy)
        v1:complete();
    end);
end;
v0.unbind = function(v3) --[[ Line: 14 ]] --[[ Name: unbind ]]
    v3.connection:Disconnect();
end;
return v0;