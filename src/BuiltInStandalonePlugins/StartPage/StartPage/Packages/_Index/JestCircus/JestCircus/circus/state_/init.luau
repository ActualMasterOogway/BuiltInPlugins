local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.JestTypes);
local l_STATE_SYM_0 = require(script.Parent.types).STATE_SYM;
return {
    ROOT_DESCRIBE_BLOCK_NAME = "ROOT_DESCRIBE_BLOCK", 
    getState = function() --[[ Line: 23 ]] --[[ Name: getState ]]
        -- upvalues: l_STATE_SYM_0 (copy)
        return _G[l_STATE_SYM_0];
    end
};