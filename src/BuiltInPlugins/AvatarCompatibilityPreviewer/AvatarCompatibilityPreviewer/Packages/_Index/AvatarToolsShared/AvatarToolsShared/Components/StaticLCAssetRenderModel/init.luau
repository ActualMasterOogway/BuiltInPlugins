local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Framework);
local l_UI_0 = v2.UI;
local _ = l_UI_0.Pane;
local l_Util_0 = v2.Util;
local l_Typecheck_0 = l_Util_0.Typecheck;
local _ = l_Util_0.StyleModifier;
local l_AssetRenderModel_0 = l_UI_0.AssetRenderModel;
local v9 = v1.PureComponent:extend("StaticLCAssetRenderModel");
l_Typecheck_0.wrap(v9, script);
v9.defaultProps = {
    FocusDirection = Vector3.new(-0.5, 0.5, -1, 0)
};
v9.cloneModel = function(v10, v11) --[[ Line: 35 ]] --[[ Name: cloneModel ]]
    local _ = v10.props;
    if not v11 then
        return;
    else
        if v10.model then
            v10.model:Destroy();
        end;
        local l_Archivable_0 = v11.Archivable;
        v11.Archivable = true;
        v10.model = v11:Clone();
        v11.Archivable = l_Archivable_0;
        for _, v15 in v10.model:GetDescendants() do
            if v15:IsA("BaseWrap") then
                v15:Destroy();
            end;
        end;
        return;
    end;
end;
v9.init = function(v16, v17) --[[ Line: 58 ]] --[[ Name: init ]]
    v16:cloneModel(v17.Model);
end;
v9.willUpdate = function(v18, v19) --[[ Line: 62 ]] --[[ Name: willUpdate ]]
    if v18.props.Model ~= v19.Model then
        v18:cloneModel(v19.Model);
    end;
end;
v9.render = function(v20) --[[ Line: 68 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_AssetRenderModel_0 (copy)
    local l_FocusDirection_0 = v20.props.FocusDirection;
    return v1.createElement(l_AssetRenderModel_0, {
        Model = v20.model, 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 0, 0, 0), 
        FocusDirection = l_FocusDirection_0, 
        Static = true, 
        DisablePan = true, 
        DisableZoom = true, 
        ShouldClone = false
    });
end;
return v9;