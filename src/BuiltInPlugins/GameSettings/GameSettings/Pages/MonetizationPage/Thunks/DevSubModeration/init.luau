local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.AddChange);
local v2 = require(script.Parent.AddDevSubKeyError);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v4, v5) --[[ Line: 7 ]]
        -- upvalues: v3 (copy), v1 (ref), v2 (ref)
        local l_Key_0 = v3.Key;
        local l_devSubsController_0 = v5.devSubsController;
        local v8 = {
            [l_Key_0] = {
                isAcceptable = true, 
                filteredName = nil
            }
        };
        v4:dispatch(v1("DevSubModeration", v8));
        local v9, v10 = l_devSubsController_0:getFilteredDevSub(v3);
        local v11 = {
            [l_Key_0] = {
                isAcceptable = v9, 
                filteredName = v10
            }
        };
        v4:dispatch(v1("DevSubModeration", v11));
        if not v9 then
            v4:dispatch(v2(l_Key_0, "Name", {
                Moderated = "Name has been moderated"
            }));
        end;
    end;
end;