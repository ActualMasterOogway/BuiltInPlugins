local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Util.Avatar);
local l_InsertService_0 = game:GetService("InsertService");
local v3 = {
    Handle = nil, 
    Loading = false, 
    WaitingToDestroy = false
};
local v4 = nil;
local v5 = nil;
game:DefineFastFlag("DisableGameSettingsAvatarPreview", false);
v3.apply = function(v6) --[[ Line: 18 ]] --[[ Name: apply ]]
    -- upvalues: v3 (copy), v5 (ref)
    if v3.Handle == nil then
        v5(v6);
        return;
    else
        v3.Handle:applyTemplates(v6);
        return;
    end;
end;
v5 = function(v7) --[[ Line: 26 ]]
    -- upvalues: v3 (copy), l_InsertService_0 (copy), v1 (copy), v4 (ref)
    v3.WaitingToDestroy = false;
    if not v3.Loading and v3.Handle == nil then
        v3.Loading = true;
        spawn(function() --[[ Line: 32 ]]
            -- upvalues: l_InsertService_0 (ref), v3 (ref), v1 (ref), v7 (copy), v4 (ref)
            local v8 = nil;
            local v9 = nil;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 35 ]]
                -- upvalues: v8 (ref), l_InsertService_0 (ref), v9 (ref)
                v8 = l_InsertService_0:LoadLocalAsset("rbxasset://avatar/morpherEditorR15.rbxmx");
                v9 = l_InsertService_0:LoadLocalAsset("rbxasset://avatar/morpherEditorR6.rbxmx");
            end);
            if l_status_0 and v8 and v9 then
                v3.Handle = v1.loadWithTemplates(v9, v8, v7);
                if v3.Handle then
                    v4(v3);
                end;
            end;
            if l_result_0 then
                warn(l_result_0);
            end;
            v3.Loading = false;
        end);
    end;
end;
local function _(v12) --[[ Line: 58 ]] --[[ Name: destroyRig ]]
    if v12.Handle ~= nil then
        v12.Handle:destroy();
        v12.Handle = nil;
    end;
end;
local function _(v14) --[[ Line: 65 ]] --[[ Name: destroyRigAfterLoading ]]
    -- upvalues: v3 (copy)
    if v3.Loading and not v3.WaitingToDestroy then
        v3.WaitingToDestroy = true;
        spawn(function() --[[ Line: 68 ]]
            -- upvalues: v3 (ref), v14 (copy)
            while v3.Loading do
                wait();
            end;
            if v3.WaitingToDestroy then
                local l_v14_0 = v14;
                if l_v14_0.Handle ~= nil then
                    l_v14_0.Handle:destroy();
                    l_v14_0.Handle = nil;
                end;
                v3.WaitingToDestroy = false;
            end;
        end);
    end;
end;
v3.destroy = function(v17) --[[ Line: 80 ]] --[[ Name: destroy ]]
    -- upvalues: v3 (copy)
    if v17.Handle ~= nil then
        v17.Handle:destroy();
        v17.Handle = nil;
    end;
    if v3.Loading and not v3.WaitingToDestroy then
        v3.WaitingToDestroy = true;
        spawn(function() --[[ Line: 68 ]]
            -- upvalues: v3 (ref), v17 (copy)
            while v3.Loading do
                wait();
            end;
            if v3.WaitingToDestroy then
                local l_v17_0 = v17;
                if l_v17_0.Handle ~= nil then
                    l_v17_0.Handle:destroy();
                    l_v17_0.Handle = nil;
                end;
                v3.WaitingToDestroy = false;
            end;
        end);
    end;
end;
v4 = function(v19) --[[ Line: 85 ]]
    -- upvalues: v3 (copy)
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if l_CurrentCamera_0 then
        local l_p_0 = (l_CurrentCamera_0.CFrame + l_CurrentCamera_0.CFrame.lookVector * 8).p;
        local v22 = l_p_0 - l_CurrentCamera_0.CFrame.lookVector.Unit;
        v3.Handle:setPosition(CFrame.new(l_p_0, v22));
        return;
    else
        local v23 = CFrame.new((Vector3.new(0, 0, 0, 0)));
        v19.Handle:setPosition(v23);
        return;
    end;
end;
return v3;