local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework).ContextServices.ContextItem:extend("CalloutController");
v1.new = function(v2) --[[ Line: 10 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v3 = {
        _calloutService = v2 or game:GetService("CalloutService")
    };
    assert(v3._calloutService, "CalloutController requires a CalloutService");
    return (setmetatable(v3, v1));
end;
v1.destroy = function(v4) --[[ Line: 19 ]] --[[ Name: destroy ]]
    v4._calloutService = nil;
end;
v1.defineCallout = function(v5, v6, v7, v8, v9) --[[ Line: 23 ]] --[[ Name: defineCallout ]]
    v5._calloutService:DefineCallout(v6, v7, v8, v9);
end;
v1.attachCallout = function(v10, v11, v12, v13) --[[ Line: 27 ]] --[[ Name: attachCallout ]]
    v10._calloutService:AttachCallout(v11, v12, v13);
end;
v1.detachCalloutsByDefinitionId = function(v14, v15) --[[ Line: 31 ]] --[[ Name: detachCalloutsByDefinitionId ]]
    v14._calloutService:DetachCalloutsByDefinitionId(v15);
end;
return v1;