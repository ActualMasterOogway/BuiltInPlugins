local l_EnablePseudolocalizationInPlayerEmulator2_0 = game:GetFastFlag("EnablePseudolocalizationInPlayerEmulator2");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Src.ContextServices.NetworkingContext);
local l_Pane_0 = v4.UI.Pane;
local v9 = require(l_Parent_0.Src.Networking.Requests.GetPolicySettings);
local v10 = require(l_Parent_0.Src.Thunks.UpdatePolicyBooleanItem);
local v11 = require(l_Parent_0.Src.Thunks.UpdatePolicyListItem);
local v12 = require(l_Parent_0.Src.Thunks.UpdatePolicyListItemModuleExpanded);
local v13 = require(l_Parent_0.Src.Components.ToggleItemModule);
local v14 = require(l_Parent_0.Src.Components.ListItemsModule);
local v15 = v2.PureComponent:extend("PolicySection");
v15.didMount = function(v16) --[[ Line: 46 ]] --[[ Name: didMount ]]
    local v17 = v16.props.Networking:get();
    local v18 = v16.props.Plugin:get();
    v16.props.loadAllPolicyItems(v17, v18);
end;
v15.render = function(v19) --[[ Line: 52 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v13 (copy), v14 (copy), l_Pane_0 (copy), l_EnablePseudolocalizationInPlayerEmulator2_0 (copy)
    local l_props_0 = v19.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_mainSwitchEnabled_0 = l_props_0.mainSwitchEnabled;
    local l_allPolicies_0 = l_props_0.allPolicies;
    local l_allPolicySortedKeys_0 = l_props_0.allPolicySortedKeys;
    local l_policySettingStatus_0 = l_props_0.policySettingStatus;
    local l_updateToggleItem_0 = l_props_0.updateToggleItem;
    local l_updateListItem_0 = l_props_0.updateListItem;
    local l_policyListItemsModuleExpanded_0 = l_props_0.policyListItemsModuleExpanded;
    local l_updatePolicySettingListItemModuleExpanded_0 = l_props_0.updatePolicySettingListItemModuleExpanded;
    if not l_props_0.customPoliciesEnabled then
        return nil;
    else
        local v31 = {};
        local v32 = {};
        for _, v34 in ipairs(l_allPolicySortedKeys_0) do
            if type(l_allPolicies_0[v34]) == "boolean" then
                local v35 = l_policySettingStatus_0[v34];
                v31["Toggle" .. v34] = v2.createElement(v13, {
                    Key = v34, 
                    IsOn = v35, 
                    Enabled = l_mainSwitchEnabled_0, 
                    ToggleCallback = l_updateToggleItem_0
                });
            elseif type(l_allPolicies_0[v34]) == "table" then
                v32["List" .. v34] = v2.createElement(v14, {
                    LabelText = v34, 
                    Enabled = l_mainSwitchEnabled_0, 
                    Items = l_allPolicies_0[v34], 
                    ListItemsCheckBoxCallback = l_updateListItem_0, 
                    ListStatus = l_policySettingStatus_0[v34], 
                    ListItemsModuleExpansionCallback = l_updatePolicySettingListItemModuleExpanded_0, 
                    Expanded = l_policyListItemsModuleExpanded_0
                });
            end;
        end;
        return v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = l_LayoutOrder_0
        }, {
            ToggleElementsFrame = v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Spacing = if l_EnablePseudolocalizationInPlayerEmulator2_0 then l_Stylizer_0.HORIZONTAL_LISTLAYOUT_PADDING else nil, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = 1
            }, v31), 
            ListElementsFrame = v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Spacing = if l_EnablePseudolocalizationInPlayerEmulator2_0 then l_Stylizer_0.HORIZONTAL_LISTLAYOUT_PADDING else nil, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = 2
            }, v32)
        });
    end;
end;
v15 = l_withContext_0({
    Networking = v7, 
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = if l_EnablePseudolocalizationInPlayerEmulator2_0 then l_ContextServices_0.Stylizer else nil
})(v15);
return v3.connect(function(v36, _) --[[ Line: 133 ]] --[[ Name: mapStateToProps ]]
    if game:GetFastFlag("PlayerEmulatorDropdownOpenedStateTrackingEnabled") then
        return {
            mainSwitchEnabled = v36.MainSwitch.mainSwitchEnabled, 
            customPoliciesEnabled = v36.CustomPolicySwitch.customPoliciesEnabled, 
            allPolicies = v36.Policies.allPolicies, 
            allPolicySortedKeys = v36.Policies.allPolicySortedKeys, 
            policySettingStatus = v36.Policies.policySettingStatus, 
            policyListItemsModuleExpanded = v36.Policies.policyListItemsModuleExpanded
        };
    else
        return {
            mainSwitchEnabled = v36.MainSwitch.mainSwitchEnabled, 
            customPoliciesEnabled = v36.CustomPolicySwitch.customPoliciesEnabled, 
            allPolicies = v36.Policies.allPolicies, 
            allPolicySortedKeys = v36.Policies.allPolicySortedKeys, 
            policySettingStatus = v36.Policies.policySettingStatus
        };
    end;
end, function(v38) --[[ Line: 154 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v9 (copy), v10 (copy), v11 (copy), v12 (copy)
    return {
        loadAllPolicyItems = function(v39, v40) --[[ Line: 156 ]] --[[ Name: loadAllPolicyItems ]]
            -- upvalues: v38 (copy), v9 (ref)
            v38(v9(v39, v40));
        end, 
        updateToggleItem = function(v41, v42, v43) --[[ Line: 159 ]] --[[ Name: updateToggleItem ]]
            -- upvalues: v38 (copy), v10 (ref)
            v38(v10(v41, v42, v43));
        end, 
        updateListItem = function(v44, v45, v46) --[[ Line: 162 ]] --[[ Name: updateListItem ]]
            -- upvalues: v38 (copy), v11 (ref)
            v38(v11(v44, v45, v46));
        end, 
        updatePolicySettingListItemModuleExpanded = function(v47) --[[ Line: 165 ]] --[[ Name: updatePolicySettingListItemModuleExpanded ]]
            -- upvalues: v38 (copy), v12 (ref)
            v38(v12(v47));
        end
    };
end)(v15);