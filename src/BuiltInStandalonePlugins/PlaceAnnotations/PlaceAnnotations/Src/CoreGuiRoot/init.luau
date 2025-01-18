local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Src.Util.CrossDMCallbacks);
local l_registerPluginStyles_0 = v2.Styling.registerPluginStyles;
local l_registerEditCallbacks_0 = v3.registerEditCallbacks;
local l_ContextServices_0 = v2.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Focus_0 = l_ContextServices_0.Focus;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local v12 = require(l_script_FirstAncestor_0.Src.Contexts.UsernameContext);
local v13 = require(l_script_FirstAncestor_0.Src.Contexts.InputListenerContext);
local v14 = require(l_script_FirstAncestor_0.Src.CoreGuiComponents.AnnotationPlacementManager);
local v15 = require(l_script_FirstAncestor_0.Src.Enums.AnnotationEditingMode);
local l_AnnotationsService_0 = game:GetService("AnnotationsService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v18 = l_ContextServices_0.Localization.new({
    stringResourceTable = l_SourceStrings_0, 
    translationResourceTable = l_LocalizedStrings_0, 
    pluginName = "PlaceAnnotations"
});
return function(v19) --[[ Line: 35 ]] --[[ Name: CoreGuiRoot ]]
    -- upvalues: v1 (copy), l_registerEditCallbacks_0 (copy), l_UserInputService_0 (copy), l_AnnotationsService_0 (copy), v15 (copy), l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), v18 (copy), v12 (copy), v13 (copy), l_Focus_0 (copy), v14 (copy), l_registerPluginStyles_0 (copy)
    local l_Plugin_1 = v19.Plugin;
    local l_l_Plugin_1_Mouse_0 = l_Plugin_1:GetMouse();
    local l_ScreenGui_0 = game.CoreGui:FindFirstChild("PlaceAnnotations"):FindFirstChildOfClass("ScreenGui");
    v1.useEffect(function() --[[ Line: 41 ]]
        -- upvalues: l_registerEditCallbacks_0 (ref), l_Plugin_1 (copy), l_UserInputService_0 (ref), l_AnnotationsService_0 (ref), v15 (ref)
        l_registerEditCallbacks_0(l_Plugin_1);
        local v25 = l_UserInputService_0.InputEnded:Connect(function(v23, _) --[[ Line: 43 ]]
            -- upvalues: l_Plugin_1 (ref)
            if v23.KeyCode == Enum.KeyCode.Escape then
                l_Plugin_1:Deactivate();
            end;
        end);
        local v26 = l_Plugin_1.Deactivation:Connect(function() --[[ Line: 48 ]]
            -- upvalues: l_AnnotationsService_0 (ref), v15 (ref)
            l_AnnotationsService_0.Mode = v15.None;
        end);
        return function() --[[ Line: 51 ]]
            -- upvalues: v25 (copy), v26 (copy)
            v25:Disconnect();
            v26:Disconnect();
        end;
    end, {});
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_l_Plugin_1_Mouse_0), 
        v18, 
        v12.new(), 
        v13.new(l_ScreenGui_0), 
        l_Focus_0.new(l_ScreenGui_0)
    }, {
        AnnotationManager = v1.createElement(v14), 
        StyleLink = v1.createElement("StyleLink", {
            StyleSheet = l_registerPluginStyles_0(l_Plugin_1)
        })
    });
end;