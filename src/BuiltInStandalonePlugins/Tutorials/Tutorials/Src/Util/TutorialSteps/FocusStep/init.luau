local v0 = require(script.Parent.TutorialStep).extend("Focus");
v0.showComplete = true;
v0.bind = function(v1) --[[ Line: 6 ]] --[[ Name: bind ]]
    v1.connection = v1.tutorial.dataModel:GetService("Workspace").CurrentCamera.Changed:Connect(function() --[[ Line: 11 ]]
        -- upvalues: v1 (copy)
        v1:complete();
    end);
end;
v0.unbind = function(v2) --[[ Line: 16 ]] --[[ Name: unbind ]]
    v2.connection:Disconnect();
end;
return v0;