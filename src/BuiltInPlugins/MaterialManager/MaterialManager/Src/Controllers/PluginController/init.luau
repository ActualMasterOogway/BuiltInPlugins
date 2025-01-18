local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Framework);
local l_Flags_0 = l_Parent_0.Src.Flags;
local v4 = require(l_Flags_0.getFFlagMaterialActionAsTool);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v6 = require(l_Actions_0.DEPRECATED_SetMaterialAsTool);
local v7 = require(l_Actions_0.SetMaterialBrowserLayout);
local v8 = require(l_Actions_0.SetMaterialTileSize);
local v9 = require(l_Actions_0.SetViewType);
local v10 = require(l_Parent_0.Src.Controllers.GeneralServiceController);
local l_Util_0 = l_Parent_0.Src.Util;
local v12 = require(l_Util_0.DEPRECATED_SetHighlight);
local l_ContextItem_0 = v2.ContextServices.ContextItem;
local v14 = if v4() then nil else "rbxasset://SystemCursors/Arrow";
local v15 = if v4() then nil else "rbxasset://textures/FillCursor.png";
local v16 = l_ContextItem_0:extend("PluginController");
v16.new = function(v17, v18, v19, v20, v21) --[[ Line: 26 ]] --[[ Name: new ]]
    -- upvalues: v16 (copy)
    local v22 = setmetatable({
        _plugin = v17, 
        _store = v18, 
        _mouse = v19, 
        _generalServiceController = v20, 
        _mock = v21
    }, v16);
    v22._mouseMoveConnection = nil;
    v22._mouseClickedConnection = nil;
    v22._deactivationConnection = nil;
    return v22;
end;
v16.mock = function() --[[ Line: 43 ]] --[[ Name: mock ]]
    -- upvalues: v16 (copy), v10 (copy)
    return v16.new(nil, nil, v10.mock(), true);
end;
v16.initialize = function(v23) --[[ Line: 47 ]] --[[ Name: initialize ]]
    -- upvalues: v7 (copy), v8 (copy), v9 (copy)
    if v23._mock then
        return;
    else
        local l_Setting_0 = v23._plugin:GetSetting("MaterialBrowserLayout");
        local l_Setting_1 = v23._plugin:GetSetting("MaterialTileSize");
        local l_Setting_2 = v23._plugin:GetSetting("ViewType");
        if l_Setting_0 then
            v23._store:dispatch(v7(l_Setting_0));
        end;
        if l_Setting_1 then
            v23._store:dispatch(v8(l_Setting_1));
        end;
        if l_Setting_2 then
            v23._store:dispatch(v9(l_Setting_2));
        end;
        return;
    end;
end;
v16.setMaterialTileSize = function(v27, v28) --[[ Line: 69 ]] --[[ Name: setMaterialTileSize ]]
    if v27._mock then
        return;
    else
        v27._plugin:SetSetting("MaterialTileSize", v28);
        return;
    end;
end;
v16.setViewType = function(v29, v30) --[[ Line: 77 ]] --[[ Name: setViewType ]]
    if v29._mock then
        return;
    else
        v29._plugin:SetSetting("ViewType", v30);
        return;
    end;
end;
v16.setMaterialBrowserLayout = function(v31, v32) --[[ Line: 85 ]] --[[ Name: setMaterialBrowserLayout ]]
    if v31._mock then
        return;
    else
        v31._plugin:SetSetting("MaterialBrowserLayout", v32);
        return;
    end;
end;
v16.DEPRECATED_toggleMaterialAsTool = function(v33) --[[ Line: 93 ]] --[[ Name: DEPRECATED_toggleMaterialAsTool ]]
    -- upvalues: v6 (copy), v4 (copy), v15 (copy), v12 (copy), v14 (copy)
    if v33._mock then
        return;
    else
        v33._plugin:Activate(true);
        v33._store:dispatch(v6(true));
        local v34 = nil;
        v33._mouseMoveConnection = v33._mouse.Move:Connect(function() --[[ Line: 102 ]]
            -- upvalues: v33 (copy), v4 (ref), v15 (ref), v34 (ref), v12 (ref), v14 (ref)
            if v33._store:getState().MaterialBrowserReducer.Material then
                v33._mouse.Icon = if v4() then nil else v15;
                v34 = v12(v34, v33._mouse.Target);
                return;
            else
                v33._mouse.Icon = if v4() then nil else v14;
                return;
            end;
        end);
        v33._mouseClickedConnection = v33._mouse.Button1Down:Connect(function() --[[ Line: 111 ]]
            -- upvalues: v33 (copy), v4 (ref), v15 (ref)
            local l_Material_0 = v33._store:getState().MaterialBrowserReducer.Material;
            if l_Material_0 then
                v33._mouse.Icon = if v4() then nil else v15;
                v33._generalServiceController:ApplyToBasePart(v33._mouse.Target, l_Material_0.Material, if l_Material_0.MaterialVariant then l_Material_0.MaterialVariant.Name else nil);
            end;
        end);
        v33._deactivationConnection = v33._plugin.Deactivation:Connect(function() --[[ Line: 123 ]]
            -- upvalues: v33 (copy), v6 (ref), v34 (ref), v4 (ref), v14 (ref)
            v33._store:dispatch(v6(false));
            if v34 then
                v34:Destroy();
            end;
            v33._mouse.Icon = if v4() then nil else v14;
            if v33._mouseMoveConnection then
                v33._mouseMoveConnection:Disconnect();
                v33._mouseMoveConnection = nil;
            end;
            if v33._mouseClickedConnection then
                v33._mouseClickedConnection:Disconnect();
                v33._mouseClickedConnection = nil;
            end;
            if v33._deactivationConnection then
                v33._deactivationConnection:Disconnect();
                v33._deactivationConnection = nil;
            end;
        end);
        return;
    end;
end;
v16.DEPRECATED_untoggleMaterialAsTool = function(v36) --[[ Line: 147 ]] --[[ Name: DEPRECATED_untoggleMaterialAsTool ]]
    if v36._mock then
        return;
    else
        v36._plugin:Deactivate();
        return;
    end;
end;
v16.destroy = function(v37) --[[ Line: 155 ]] --[[ Name: destroy ]]
    if v37._mock then
        return;
    else
        if v37._mouseMoveConnection then
            v37._mouseMoveConnection:Disconnect();
        end;
        if v37._mouseClickedConnection then
            v37._mouseClickedConnection:Disconnect();
        end;
        if v37._deactivationConnection then
            v37._deactivationConnection:Disconnect();
        end;
        return;
    end;
end;
return v16;