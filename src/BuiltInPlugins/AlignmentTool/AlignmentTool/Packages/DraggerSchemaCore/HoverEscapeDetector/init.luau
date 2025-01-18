local _ = script.Parent.Parent.DraggerFramework;
local v1 = {};
v1.__index = v1;
v1.new = function(_, v3, v4) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v5 = nil;
    local v6 = false;
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    l_BindableEvent_0.Event:Connect(function() --[[ Line: 22 ]]
        -- upvalues: v6 (ref)
        v6 = true;
    end);
    l_BindableEvent_0:Fire();
    v5 = not v6;
    l_BindableEvent_0:Destroy();
    local v8 = setmetatable({
        _destroyed = false
    }, v1);
    v8._hoverInstanceEscapedConnection = v3.AncestryChanged:Connect(function(v9, _) --[[ Line: 32 ]]
        -- upvalues: v5 (ref), v8 (copy), v4 (copy)
        if not v5 then
            v9:GetPropertyChangedSignal("Parent"):Wait();
        end;
        if not v8._destroyed then
            v4();
        end;
    end);
    v8._hoverInstanceContentsChangedConnection = v3.DescendantRemoving:Connect(function(v11) --[[ Line: 49 ]]
        -- upvalues: v8 (copy), v4 (copy)
        if v11:IsA("BasePart") or v11:IsA("Attachment") then
            v11:GetPropertyChangedSignal("Parent"):Wait();
            if not v8._destroyed then
                v4();
            end;
        end;
    end);
    return v8;
end;
v1.destroy = function(v12) --[[ Line: 65 ]] --[[ Name: destroy ]]
    assert(not v12._destroyed);
    v12._destroyed = true;
    v12._hoverInstanceEscapedConnection:Disconnect();
    v12._hoverInstanceContentsChangedConnection:Disconnect();
end;
return v1;