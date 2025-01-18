local v0 = require(script.Parent.TutorialStep).extend("Rotate");
v0.showComplete = true;
v0.bind = function(v1) --[[ Line: 7 ]] --[[ Name: bind ]]
    local v2 = v1.tutorial.instances[v1.data.instanceId];
    if v2 then
        local l_LookVector_0 = v2.CFrame.LookVector;
        v1.connection = v2:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ Line: 11 ]]
            -- upvalues: l_LookVector_0 (copy), v2 (copy), v1 (copy)
            if l_LookVector_0 == v2.CFrame.LookVector then
                return;
            else
                if v1.data.distance then
                    local l_rotation_0 = v1.data.rotation;
                    local v5 = CFrame.Angles(math.rad(l_rotation_0.X), math.rad(l_rotation_0.Y), (math.rad(l_rotation_0.Z)));
                    if math.deg((math.acos((v2.CFrame.LookVector:Dot(v5.LookVector))))) < v1.data.distance then
                        v1:complete();
                        return;
                    end;
                else
                    v1:complete();
                end;
                return;
            end;
        end);
    end;
end;
v0.unbind = function(v6) --[[ Line: 30 ]] --[[ Name: unbind ]]
    if v6.connection then
        v6.connection:Disconnect();
    end;
end;
return v0;