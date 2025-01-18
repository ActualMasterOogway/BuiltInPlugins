local v0 = require(script.Parent.Parent.VirtualInputUtils);
local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
return {
    sendText = function(v2) --[[ Line: 8 ]] --[[ Name: sendText ]]
        -- upvalues: v0 (copy), l_VirtualInputManager_0 (copy)
        local v3 = v0.getCurrentWindow();
        l_VirtualInputManager_0:SendTextInputCharacterEvent(v2, v3);
    end
};