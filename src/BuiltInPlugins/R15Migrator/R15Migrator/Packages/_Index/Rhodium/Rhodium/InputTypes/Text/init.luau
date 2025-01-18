local v0 = require(script.Parent.Parent.VirtualInputUtils);
local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
return {
    sendText = function(v2) --[[ Line: 7 ]] --[[ Name: sendText ]]
        -- upvalues: l_VirtualInputManager_0 (copy), v0 (copy)
        l_VirtualInputManager_0:sendTextInputCharacterEvent(v2, v0.getCurrentWindow());
    end
};