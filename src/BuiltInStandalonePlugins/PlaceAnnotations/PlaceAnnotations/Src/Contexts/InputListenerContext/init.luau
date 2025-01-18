local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.ContextItem:extend("MouseListenerContext");
local l_BindableEvent_0 = Instance.new("BindableEvent");
v1.new = function() --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: l_BindableEvent_0 (copy), v1 (copy)
    local v3 = {
        Listener = Instance.new("Frame"), 
        FocusedElement = nil, 
        FocusedElementChangedSignal = l_BindableEvent_0.Event
    };
    v3.Listener.Size = UDim2.fromScale(1, 1);
    v3.Listener.BackgroundTransparency = 1;
    setmetatable(v3, v1);
    return v3;
end;
v1.setFocus = function(v4, v5) --[[ Line: 31 ]] --[[ Name: setFocus ]]
    if v4.Listener.Parent ~= v5 then
        v4.Listener.Parent = v5;
    end;
end;
v1.SetFocusedElement = function(v6, v7) --[[ Line: 37 ]] --[[ Name: SetFocusedElement ]]
    -- upvalues: l_BindableEvent_0 (copy)
    v6.FocusedElement = v7;
    l_BindableEvent_0:Fire();
end;
v1.GetFocusedElement = function(v8) --[[ Line: 42 ]] --[[ Name: GetFocusedElement ]]
    return v8.FocusedElement;
end;
return v1;