local _ = require(script.Parent.ReactInternalTypes);
local l_getStackByFiberInDevAndProd_0 = require(script.Parent.ReactFiberComponentStack).getStackByFiberInDevAndProd;
return {
    createCapturedValue = function(v2, v3) --[[ Line: 25 ]]
        -- upvalues: l_getStackByFiberInDevAndProd_0 (copy)
        return {
            value = v2, 
            source = v3, 
            stack = l_getStackByFiberInDevAndProd_0(v3)
        };
    end
};