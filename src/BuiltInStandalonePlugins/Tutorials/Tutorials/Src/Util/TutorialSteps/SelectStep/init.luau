local v0 = require(script.Parent.TutorialStep).extend("Select");
v0.showComplete = true;
v0.bind = function(v1) --[[ Line: 7 ]] --[[ Name: bind ]]
    local l_Selection_0 = v1.tutorial.dataModel:GetService("Selection");
    v1.connection = l_Selection_0.SelectionChanged:Connect(function() --[[ Line: 10 ]]
        -- upvalues: l_Selection_0 (copy), v1 (copy)
        for _, v4 in ipairs(l_Selection_0:Get()) do
            if v4.Name == v1.data.path then
                v1:complete();
            end;
        end;
    end);
end;
v0.unbind = function(v5) --[[ Line: 19 ]] --[[ Name: unbind ]]
    v5.connection:Disconnect();
end;
return v0;