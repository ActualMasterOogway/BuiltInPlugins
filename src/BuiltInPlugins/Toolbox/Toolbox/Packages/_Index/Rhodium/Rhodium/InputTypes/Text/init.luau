local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Rhodium");
local v2 = require(l_script_FirstAncestor_0.VirtualInputUtils);
return {
    sendText = function(v3) --[[ Line: 9 ]] --[[ Name: sendText ]]
        -- upvalues: v2 (copy), l_VirtualInputManager_0 (copy)
        local v4 = v2.getCurrentWindow();
        l_VirtualInputManager_0:SendTextInputCharacterEvent(v3, v4);
    end
};