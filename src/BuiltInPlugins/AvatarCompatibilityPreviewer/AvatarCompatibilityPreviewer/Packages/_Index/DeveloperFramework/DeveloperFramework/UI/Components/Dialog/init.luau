local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local l_Typecheck_0 = require(l_Parent_0.Util).Typecheck;
local v7 = require(l_Parent_0.UI.Components.createPluginWidget)("Dialog", function(v3) --[[ Line: 29 ]]
    -- upvalues: l_HttpService_0 (copy)
    local v4 = v3.Plugin:get();
    local v5 = {
        Title = v3.Title, 
        Size = v3.Size, 
        MinSize = v3.MinSize, 
        Resizable = v3.Resizable, 
        Modal = v3.Modal
    };
    local l_v4_QWidgetPluginGui_0 = v4:CreateQWidgetPluginGui(v3.Title .. l_HttpService_0:GenerateGUID(), v5);
    l_v4_QWidgetPluginGui_0.Name = v3.Title;
    if v3.ZIndexBehavior then
        l_v4_QWidgetPluginGui_0.ZIndexBehavior = v3.ZIndexBehavior;
    end;
    return l_v4_QWidgetPluginGui_0;
end);
l_Typecheck_0.wrap(v7, script);
return v7;