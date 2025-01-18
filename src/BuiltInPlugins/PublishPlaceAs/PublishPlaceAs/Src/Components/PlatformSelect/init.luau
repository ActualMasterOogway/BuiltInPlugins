local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_Parent_0.Src.Components.CheckBoxSet);
local _ = require(l_Parent_0.Src.Components.ListDialog);
local v7 = v1.PureComponent:extend("PlatformSelect");
local _ = v2.SharedFlags;
local l_RemoveNoDevicesError_0 = game:GetFastFlag("RemoveNoDevicesError");
v7.render = function(v10) --[[ Line: 31 ]] --[[ Name: render ]]
    -- upvalues: l_RemoveNoDevicesError_0 (copy), v1 (copy), v5 (copy)
    local l_props_0 = v10.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v14 = l_props_0.LayoutOrder or 0;
    local v15 = if l_RemoveNoDevicesError_0 then nil else l_props_0.DevicesError;
    local l_DeviceSelected_0 = l_props_0.DeviceSelected;
    local l_Devices_0 = l_props_0.Devices;
    return v1.createElement(v5, {
        Title = l_Localization_0:getText("PageTitle", "Devices"), 
        LayoutOrder = v14, 
        Boxes = {
            {
                Id = "Computer", 
                Title = l_Localization_0:getText("Devices", "Computer"), 
                Selected = l_Devices_0.Computer
            }, 
            {
                Id = "Phone", 
                Title = l_Localization_0:getText("Devices", "Phone"), 
                Selected = l_Devices_0.Phone
            }, 
            {
                Id = "Tablet", 
                Title = l_Localization_0:getText("Devices", "Tablet"), 
                Selected = l_Devices_0.Tablet
            }, 
            {
                Id = "Console", 
                Title = l_Localization_0:getText("Devices", "Console"), 
                Selected = l_Devices_0.Console
            }, 
            {
                Id = "VR", 
                Title = l_Localization_0:getText("Devices", "VR"), 
                Selected = l_Devices_0.VR
            }
        }, 
        ErrorMessage = if l_RemoveNoDevicesError_0 then nil else v15 and l_Localization_0:getText("Error", "NoDevices") or nil, 
        EntryClicked = function(v18) --[[ Line: 75 ]] --[[ Name: EntryClicked ]]
            -- upvalues: l_DeviceSelected_0 (copy)
            l_DeviceSelected_0(v18.Id, not v18.Selected);
        end, 
        AbsoluteMaxHeight = l_Stylizer_0.checkboxset.maxHeight, 
        UseGridLayout = true
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v7));