local v0 = require(script.Parent.MockMaterialGenerationSession);
local v1 = {};
v1.__index = v1;
v1.new = function() --[[ Line: 8 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    return (setmetatable({}, v1));
end;
v1.StartSession = function(_) --[[ Line: 12 ]] --[[ Name: StartSession ]]
    -- upvalues: v0 (copy)
    return v0.new();
end;
v1.GetAccountingBalanceAsync = function(_) --[[ Line: 16 ]] --[[ Name: GetAccountingBalanceAsync ]]
    return 100;
end;
v1.RefillAccountingBalanceAsync = function(_) --[[ Line: 20 ]] --[[ Name: RefillAccountingBalanceAsync ]]
    return 100;
end;
v1.Destroy = function(_) --[[ Line: 24 ]] --[[ Name: Destroy ]]

end;
return v1;