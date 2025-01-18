local v0 = require(script.Parent.TutorialStep).extend("Insert");
v0.showComplete = true;
v0.bind = function(v1) --[[ Line: 7 ]] --[[ Name: bind ]]
    v1.connection = v1.tutorial.dataModel:GetService("Workspace").ChildAdded:Connect(function(v2) --[[ Line: 10 ]]
        -- upvalues: v1 (copy)
        if v2:IsA(v1.data.className) then
            if v1.data.properties then
                for v3, v4 in v1.data.properties do
                    if v2[v3] ~= v4 then
                        return;
                    end;
                end;
            end;
            if v1.data.instanceId then
                v1.tutorial.instances[v1.data.instanceId] = v2;
            end;
            v1:complete();
        end;
    end);
end;
v0.unbind = function(v5) --[[ Line: 27 ]] --[[ Name: unbind ]]
    v5.connection:Disconnect();
end;
return v0;