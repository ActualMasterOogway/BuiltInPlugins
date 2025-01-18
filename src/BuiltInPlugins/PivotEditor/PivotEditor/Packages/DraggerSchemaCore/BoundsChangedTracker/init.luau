local _ = script.Parent.Parent.DraggerFramework;
local v1 = {};
v1.__index = v1;
v1.new = function(_, v3) --[[ Line: 16 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v4 = setmetatable({
        _handler = v3, 
        _installed = false, 
        _partToEntry = {}, 
        _attachmentToEntry = {}
    }, v1);
    v4._basisPivotChangedTrampoline = function() --[[ Line: 24 ]]
        -- upvalues: v3 (copy), v4 (copy)
        v3(v4._basisObject);
    end;
    return v4;
end;
local function _(v5) --[[ Line: 31 ]] --[[ Name: hookUpConnections ]]
    v5.CFrameChangedConnection = v5.CFrameChangedSignal:Connect(v5.Trampoline);
    if v5.RootCFrameChangedSignal then
        v5.RootCFrameChangedConnection = v5.RootCFrameChangedSignal:Connect(v5.Trampoline);
    end;
    v5.SizeChangedConnection = v5.SizeChangedSignal:Connect(v5.Trampoline);
end;
local function _(v7) --[[ Line: 39 ]] --[[ Name: disconnectConnections ]]
    v7.CFrameChangedConnection:Disconnect();
    if v7.RootCFrameChangedConnection then
        v7.RootCFrameChangedConnection:Disconnect();
    end;
    v7.SizeChangedConnection:Disconnect();
end;
local function _(v9) --[[ Line: 47 ]] --[[ Name: hookUpAttachmentConnections ]]
    v9.CFrameChangedConnection = v9.CFrameChangedSignal:Connect(v9.Trampoline);
end;
local function _(v11) --[[ Line: 51 ]] --[[ Name: disconnectAttachmentConnections ]]
    v11.CFrameChangedConnection:Disconnect();
end;
v1._hookupBasisConnection = function(v13) --[[ Line: 55 ]] --[[ Name: _hookupBasisConnection ]]
    v13._basisPivotChangedConnection = v13._basisPivotChangedSignal:Connect(v13._basisPivotChangedTrampoline);
end;
v1._disconnectBasisConnection = function(v14) --[[ Line: 59 ]] --[[ Name: _disconnectBasisConnection ]]
    v14._basisPivotChangedConnection:Disconnect();
end;
v1.install = function(v15) --[[ Line: 63 ]] --[[ Name: install ]]
    assert(not v15._installed);
    v15._installed = true;
    for _, v17 in pairs(v15._partToEntry) do
        v17.CFrameChangedConnection = v17.CFrameChangedSignal:Connect(v17.Trampoline);
        if v17.RootCFrameChangedSignal then
            v17.RootCFrameChangedConnection = v17.RootCFrameChangedSignal:Connect(v17.Trampoline);
        end;
        v17.SizeChangedConnection = v17.SizeChangedSignal:Connect(v17.Trampoline);
    end;
    for _, v19 in pairs(v15._attachmentToEntry) do
        v19.CFrameChangedConnection = v19.CFrameChangedSignal:Connect(v19.Trampoline);
    end;
    if v15._basisObject then
        v15:_hookupBasisConnection();
    end;
end;
v1.uninstall = function(v20) --[[ Line: 77 ]] --[[ Name: uninstall ]]
    assert(v20._installed);
    v20._installed = false;
    for _, v22 in pairs(v20._partToEntry) do
        v22.CFrameChangedConnection:Disconnect();
        if v22.RootCFrameChangedConnection then
            v22.RootCFrameChangedConnection:Disconnect();
        end;
        v22.SizeChangedConnection:Disconnect();
    end;
    for _, v24 in pairs(v20._attachmentToEntry) do
        v24.CFrameChangedConnection:Disconnect();
    end;
    if v20._basisObject then
        v20:_disconnectBasisConnection();
    end;
end;
v1.setSelection = function(v25, v26) --[[ Line: 91 ]] --[[ Name: setSelection ]]
    v25:_setAttachments(v26:getAllAttachments());
    v25:_setParts(v26:getObjectsToTransform());
    v25:_setBasisObject(v26:getBasisObject());
end;
v1.setParts = function(v27, v28) --[[ Line: 98 ]] --[[ Name: setParts ]]
    v27:_setParts(v28);
end;
v1._setBasisObject = function(v29, v30) --[[ Line: 102 ]] --[[ Name: _setBasisObject ]]
    if v29._basisObject ~= v30 then
        if v29._installed and v29._basisObject then
            v29:_disconnectBasisConnection();
        end;
        v29._basisObject = v30;
        if v30 then
            if v30:IsA("BasePart") then
                v29._basisPivotChangedSignal = v30:GetPropertyChangedSignal("PivotOffset");
            elseif v30:IsA("Model") then
                if v30.PrimaryPart then
                    v29._basisPivotChangedSignal = v30.PrimaryPart:GetPropertyChangedSignal("PivotOffset");
                else
                    v29._basisPivotChangedSignal = v30:GetPropertyChangedSignal("WorldPivot");
                end;
            else
                v29._basisPivotChangedSignal = nil;
            end;
            if v29._installed then
                v29:_hookupBasisConnection();
            end;
        end;
    end;
end;
v1._setAttachments = function(v31, v32) --[[ Line: 127 ]] --[[ Name: _setAttachments ]]
    local v33 = {};
    for _, v35 in ipairs(v32) do
        local v36 = v31._attachmentToEntry[v35];
        v31._attachmentToEntry[v35] = nil;
        if not v36 then
            v36 = {
                CFrameChangedSignal = v35:GetPropertyChangedSignal("CFrame"), 
                Trampoline = function() --[[ Line: 135 ]] --[[ Name: Trampoline ]]
                    -- upvalues: v31 (copy), v35 (copy)
                    v31._handler(v35);
                end
            };
            if v31._installed then
                local l_v36_0 = v36;
                l_v36_0.CFrameChangedConnection = l_v36_0.CFrameChangedSignal:Connect(l_v36_0.Trampoline);
            end;
        end;
        v33[v35] = v36;
    end;
    if v31._installed then
        for v38, v39 in pairs(v31._attachmentToEntry) do
            if not v33[v38] then
                v39.CFrameChangedConnection:Disconnect();
            end;
        end;
    end;
    v31._attachmentToEntry = v33;
end;
v1._setParts = function(v40, v41) --[[ Line: 155 ]] --[[ Name: _setParts ]]
    local v42 = {};
    for v43, v44 in ipairs(v41) do
        if v43 <= 1024 then
            local v45 = v40._partToEntry[v44];
            v40._partToEntry[v44] = nil;
            if not v45 then
                local l_v44_RootPart_0 = v44:GetRootPart();
                local v47 = nil;
                if l_v44_RootPart_0 and l_v44_RootPart_0 ~= v44 then
                    v47 = l_v44_RootPart_0:GetPropertyChangedSignal("CFrame");
                end;
                v45 = {
                    CFrameChangedSignal = v44:GetPropertyChangedSignal("CFrame"), 
                    RootCFrameChangedSignal = v47, 
                    SizeChangedSignal = v44:GetPropertyChangedSignal("Size"), 
                    Trampoline = function() --[[ Line: 180 ]] --[[ Name: Trampoline ]]
                        -- upvalues: v40 (copy), v44 (copy)
                        v40._handler(v44);
                    end
                };
                if v40._installed then
                    local l_v45_0 = v45;
                    l_v45_0.CFrameChangedConnection = l_v45_0.CFrameChangedSignal:Connect(l_v45_0.Trampoline);
                    if l_v45_0.RootCFrameChangedSignal then
                        l_v45_0.RootCFrameChangedConnection = l_v45_0.RootCFrameChangedSignal:Connect(l_v45_0.Trampoline);
                    end;
                    l_v45_0.SizeChangedConnection = l_v45_0.SizeChangedSignal:Connect(l_v45_0.Trampoline);
                end;
            end;
            assert(not v42[v44]);
            v42[v44] = v45;
        else
            break;
        end;
    end;
    if v40._installed then
        for v49, v50 in pairs(v40._partToEntry) do
            if not v42[v49] then
                v50.CFrameChangedConnection:Disconnect();
                if v50.RootCFrameChangedConnection then
                    v50.RootCFrameChangedConnection:Disconnect();
                end;
                v50.SizeChangedConnection:Disconnect();
            end;
        end;
    end;
    v40._partToEntry = v42;
end;
return v1;