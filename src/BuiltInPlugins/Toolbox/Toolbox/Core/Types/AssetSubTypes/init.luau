local l_Packages_0 = script:FindFirstAncestor("Toolbox").Packages;
local _ = require(l_Packages_0.Framework);
local v2 = require(l_Packages_0.Dash);
return {
    Invalid = "Invalid", 
    Ad = "Ad", 
    MaterialPack = "MaterialPack", 
    Package = "Package", 
    contains = function(v3, v4) --[[ Line: 17 ]] --[[ Name: contains ]]
        -- upvalues: v2 (copy)
        if v3 == nil then
            return false;
        else
            return v2.find(v3, function(v5) --[[ Line: 21 ]]
                -- upvalues: v4 (copy)
                return v5 == v4;
            end) == v4;
        end;
    end
};