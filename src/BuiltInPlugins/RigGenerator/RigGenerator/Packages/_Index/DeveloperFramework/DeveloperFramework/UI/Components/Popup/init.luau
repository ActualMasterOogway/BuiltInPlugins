local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local l_Typecheck_0 = require(l_Parent_0.Util).Typecheck;
local v3 = require(l_Parent_0.UI.Components.createPluginWidget);
local v4 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkAddPopupPassesThroughMouseEventsProp);
local v9 = v3("Popup", function(v5) --[[ Line: 37 ]]
    -- upvalues: v4 (copy), l_HttpService_0 (copy)
    local v6 = v5.Plugin:get();
    local v7 = {
        Title = v5.Title, 
        Size = v5.Size, 
        MinSize = v5.MinSize, 
        Resizable = v5.Resizable, 
        Modal = v5.Modal, 
        Popup = {
            Target = v5.PopupTarget, 
            ActionId = v5.PopupActionId, 
            PassesThroughMouseEvents = if v4() then v5.PassesThroughMouseEvents else nil, 
            SelfAnchorPoint = v5.PopupSelfAnchorPoint, 
            TargetAnchorPoint = v5.PopupTargetAnchorPoint
        }
    };
    local l_v6_QWidgetPluginGui_0 = v6:CreateQWidgetPluginGui(v5.Title .. l_HttpService_0:GenerateGUID(), v7);
    l_v6_QWidgetPluginGui_0.Name = v5.Title;
    if v5.ZIndexBehavior then
        l_v6_QWidgetPluginGui_0.ZIndexBehavior = v5.ZIndexBehavior;
    end;
    return l_v6_QWidgetPluginGui_0;
end);
l_Typecheck_0.wrap(v9, script);
return v9;