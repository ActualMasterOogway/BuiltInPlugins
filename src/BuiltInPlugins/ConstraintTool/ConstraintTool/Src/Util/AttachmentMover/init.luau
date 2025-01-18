local l_RunService_0 = game:GetService("RunService");
local v1 = {};
v1.__index = v1;
v1.new = function() --[[ Line: 10 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    return (setmetatable({}, v1));
end;
v1._anchorIfNeedBe = function(v2, v3) --[[ Line: 14 ]] --[[ Name: _anchorIfNeedBe ]]
    v2._cachedAnchoredState = v3.Anchored;
    if v3 and not v3:IsGrounded() then
        v3.Anchored = true;
    end;
end;
v1.setDragged = function(v4, v5) --[[ Line: 21 ]] --[[ Name: setDragged ]]
    -- upvalues: l_RunService_0 (copy)
    local v6 = l_RunService_0:IsRunning();
    v4._attachmentsAndParents = {};
    v4._attachment = v5;
    v4._parent = v5:FindFirstAncestorWhichIsA("BasePart");
    if v6 then
        v4:_anchorIfNeedBe(v4._parent);
    end;
end;
v1.moveTo = function(v7, v8, v9) --[[ Line: 31 ]] --[[ Name: moveTo ]]
    -- upvalues: l_RunService_0 (copy)
    if v7._attachment then
        if v9 ~= v7._parent then
            if l_RunService_0:IsRunning() then
                if v7._parent and v7._parent.Anchored then
                    v7._parent.Anchored = v7._cachedAnchoredState;
                end;
                v7:_anchorIfNeedBe(v9);
            end;
            v7._attachment.Parent = v9;
            v7._parent = v9;
        end;
        v7._attachment.WorldCFrame = v8;
    end;
end;
v1.commit = function(v10) --[[ Line: 48 ]] --[[ Name: commit ]]
    -- upvalues: l_RunService_0 (copy)
    if l_RunService_0:IsRunning() and v10._parent and v10._parent.Anchored then
        v10._parent.Anchored = v10._cachedAnchoredState;
    end;
    local l_Attachment_0 = Instance.new("Attachment");
    l_Attachment_0.CFrame = v10._attachment.Parent:ToObjectSpace(v10._attachment.WorldCFrame);
    l_Attachment_0.Parent = v10._attachment.Parent;
    v10._cachedAnchoredState = false;
    return l_Attachment_0;
end;
return v1;