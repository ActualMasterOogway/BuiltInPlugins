local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Framework).ContextServices.ContextItem:extend("StudioServiceWrapper");
local v4 = {
    GetUserId = function(_) --[[ Line: 15 ]] --[[ Name: GetUserId ]]
        return 1;
    end
};
local function _(v5) --[[ Line: 19 ]] --[[ Name: newStudioServiceWrapper ]]
    -- upvalues: v2 (copy)
    local v6 = {};
    setmetatable(v6, v2);
    v6._service = v5;
    return v6;
end;
v2.new = function() --[[ Line: 29 ]] --[[ Name: new ]]
    -- upvalues: l_StudioService_0 (copy), v2 (copy)
    local l_l_StudioService_0_0 = l_StudioService_0;
    local v9 = {};
    setmetatable(v9, v2);
    v9._service = l_l_StudioService_0_0;
    return v9;
end;
v2.get = function(v10) --[[ Line: 33 ]] --[[ Name: get ]]
    return v10._service;
end;
v2.mock = function(_) --[[ Line: 37 ]] --[[ Name: mock ]]
    -- upvalues: v4 (copy), v2 (copy)
    local l_v4_0 = v4;
    local v13 = {};
    setmetatable(v13, v2);
    v13._service = l_v4_0;
    return v13;
end;
return v2;