local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(script.Parent.TutorialStep).extend("Avatar");
v1.showComplete = true;
v1.bind = function(v2) --[[ Line: 8 ]] --[[ Name: bind ]]
    -- upvalues: l_Parent_0 (copy)
    v2.connection = l_Parent_0:OnInvoke("ChangeHumanoidState", function(v3) --[[ Line: 9 ]]
        -- upvalues: v2 (copy)
        if v3 == v2.data.state then
            v2:complete();
        end;
    end);
end;
v1.unbind = function(v4) --[[ Line: 16 ]] --[[ Name: unbind ]]
    v4.connection:Disconnect();
end;
return v1;