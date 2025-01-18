local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local l_TextService_0 = game:GetService("TextService");
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local v5 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_StyleModifier_0 = v4.Util.StyleModifier;
local l_UI_0 = v4.UI;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Image_0 = l_UI_0.Image;
local l_omit_0 = v5.omit;
local l_join_0 = v5.join;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v20 = require(script.Parent.PropertyView);
local v21 = require(l_script_FirstAncestor_0.Src.Components.Properties.PropertyStatus);
local v22 = require(l_script_FirstAncestor_0.Src.Utility.createCalloutComponents);
local v23 = require(l_script_FirstAncestor_0.Src.Utility.Status.filterStatusesForProp);
local v24 = require(l_script_FirstAncestor_0.Src.Utility.Status.getHighestSeverityStatus);
local v25 = require(l_script_FirstAncestor_0.Src.Utility.Status.GetLocalizedStatusMessage);
local v26 = require(l_script_FirstAncestor_0.Src.Utility.getPropertiesForInstance);
local v27 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagUnlinkImporterAndAvatarPreview);
local v28 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportQueuedSessionRefactor);
local v29 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportUploadWidgetCleanup);
local v30 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportFixStatusesNotUpdating);
local v31 = v2.PureComponent:extend("PropertyListView");
v31.init = function(v32) --[[ Line: 57 ]] --[[ Name: init ]]
    v32:setState({
        expanded = {
            FileGeneral = true, 
            ObjectGeneral = true
        }, 
        absoluteHorizontalSize = 0
    });
    v32.statuses = v32.props.Instance:GetStatuses();
    v32.onContentResize = function(v33) --[[ Line: 66 ]]
        -- upvalues: v32 (copy)
        v32:setState({
            absoluteHorizontalSize = v33.x
        });
    end;
    v32.refreshForStatusCompatibility = function() --[[ Line: 71 ]]
        -- upvalues: v32 (copy)
        v32:setState({});
    end;
end;
v31.willUpdate = function(v34, v35, _) --[[ Line: 77 ]] --[[ Name: willUpdate ]]
    -- upvalues: v30 (copy)
    if v30() then
        v34.statuses = v35.Instance:GetStatuses();
        return;
    else
        v34.statuses = v34.props.Instance:GetStatuses();
        return;
    end;
end;
local function v45(v37, v38, v39) --[[ Line: 86 ]] --[[ Name: createSectionStatuses ]]
    -- upvalues: v25 (copy), v2 (copy), l_TextLabel_0 (copy)
    local v40 = {};
    for _, v42 in v37 do
        if not v39.Status or v39.Status.Level ~= "Error" then
            v39.Status = v42;
            v39.IsSectionStatus = true;
        end;
        local v43 = if v42.Level == "Error" then v38.style.ErrorStatus else v38.style.WarningStatus;
        local v44 = v25(v38.localization, v42.Type, v42.Level, v42.Context);
        table.insert(v40, v2.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = #v40, 
            Size = UDim2.fromOffset(v38.absoluteXSize - v38.style.Sizes.StatusMessagePadding, 0), 
            Style = v43, 
            Text = v44, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left
        }));
    end;
    return v40;
end;
local function v50(v46, v47, v48) --[[ Line: 121 ]] --[[ Name: createPropertyViewComponent ]]
    -- upvalues: v2 (copy), v20 (copy)
    local l_status_0 = v46.status;
    if l_status_0 and (not v47.Status or v47.Status.Level ~= "Error" and l_status_0.Level == "Error") then
        v47.Status = l_status_0;
        v47.IsSectionStatus = false;
    end;
    return v2.createElement(v20, {
        Instance = v46.importData, 
        LayoutOrder = v46.layoutOrder, 
        Localization = v46.localization, 
        Status = l_status_0, 
        PropertyMetadata = v46.propertyMetadata, 
        OnInteract = v48
    });
end;
local function _(v51, v52) --[[ Line: 144 ]] --[[ Name: getHeaderStatusFitWidth ]]
    -- upvalues: l_TextService_0 (copy)
    local l_Size_0 = v52.Arrow.Size;
    local l_Spacing_0 = v52.Spacing;
    local v55 = l_Size_0.X.Offset + l_Spacing_0;
    if v51 then
        local l_Text_0 = v52.Text;
        v55 = v55 + (l_TextService_0:GetTextSize(v51, l_Text_0.TextSize, l_Text_0.Font, Vector2.new()).X + l_Spacing_0);
    end;
    return v55;
end;
v31.createHeader = function(v58, v59, v60, v61, v62) --[[ Line: 158 ]] --[[ Name: createHeader ]]
    -- upvalues: l_omit_0 (copy), l_TextService_0 (copy), l_join_0 (copy), v2 (copy), v27 (copy), v22 (copy), l_Pane_0 (copy), l_Image_0 (copy), l_StyleModifier_0 (copy), l_TextLabel_0 (copy)
    local l_PropertySectionHeader_0 = v58.props.Stylizer.PropertySectionHeader;
    local v64 = l_omit_0(l_PropertySectionHeader_0, {
        "Arrow", 
        "Text"
    });
    local v65 = v58.props.Localization:getText("Sections", v59.Section);
    local v66 = nil;
    if v61 then
        local l_Size_1 = l_PropertySectionHeader_0.Arrow.Size;
        local l_Spacing_1 = l_PropertySectionHeader_0.Spacing;
        local v69 = l_Size_1.X.Offset + l_Spacing_1;
        if v65 then
            local l_Text_1 = l_PropertySectionHeader_0.Text;
            v69 = v69 + (l_TextService_0:GetTextSize(v65, l_Text_1.TextSize, l_Text_1.Font, Vector2.new()).X + l_Spacing_1);
        end;
        l_Size_1 = UDim2.new(1, -v69, 1, 0);
        l_Spacing_1 = l_join_0(v62, {
            LayoutOrder = 3, 
            Size = l_Size_1
        });
        v66 = v2.createElement(v61, l_Spacing_1);
    end;
    local v71 = {};
    if not v27() and v59.Callouts and not v60 then
        v71 = v22(v59.Callouts, v59.Section, v58.props.AssetImportSession);
    end;
    return v2.createElement(l_Pane_0, {
        HorizontalAlignment = l_PropertySectionHeader_0.HorizontalAlignment, 
        LayoutOrder = 1, 
        Layout = Enum.FillDirection.Horizontal, 
        OnClick = function() --[[ Line: 188 ]] --[[ Name: OnClick ]]
            -- upvalues: v58 (copy), l_join_0 (ref), v59 (copy), v60 (copy)
            v58:setState({
                expanded = l_join_0(v58.state.expanded, {
                    [v59.Section] = not v60
                })
            });
        end, 
        Padding = l_PropertySectionHeader_0.Padding, 
        Size = l_PropertySectionHeader_0.Size, 
        Style = v64, 
        Spacing = l_PropertySectionHeader_0.Spacing, 
        VerticalAlignment = l_PropertySectionHeader_0.VerticalAlignment
    }, {
        Image = v2.createElement(l_Image_0, {
            LayoutOrder = 1, 
            Style = l_PropertySectionHeader_0.Arrow, 
            StyleModifier = v60 and l_StyleModifier_0.Selected or nil
        }), 
        Title = v2.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 2, 
            Style = l_PropertySectionHeader_0.Text, 
            Text = v65, 
            TextWrapped = true
        }, v71), 
        HeaderStatus = v66
    });
end;
v31.buildSection = function(v72, v73, v74) --[[ Line: 217 ]] --[[ Name: buildSection ]]
    -- upvalues: v45 (copy), v23 (copy), v24 (copy), v50 (copy), v21 (copy), v2 (copy), l_ExpandablePane_0 (copy), l_join_0 (copy)
    local l_props_0 = v72.props;
    local v76 = {
        Status = nil, 
        IsSectionStatus = false
    };
    local v77 = {
        absoluteXSize = v72.state.absoluteHorizontalSize, 
        style = l_props_0.Stylizer, 
        localization = l_props_0.Localization
    };
    local v78 = v45(v23(v74.Section, v72.statuses), v77, v76);
    local v79 = {};
    for v80, v81 in pairs(v74.Properties) do
        if not v81.ShouldHide or not v81.ShouldHide(l_props_0.Instance, l_props_0.AssetImportSession) then
            local v82 = v23(v81.Name, v72.statuses);
            local v83 = v24(v82);
            local v84 = {
                importData = l_props_0.Instance, 
                layoutOrder = v80 + #v78, 
                propertyMetadata = v81, 
                localization = l_props_0.Localization, 
                status = v83
            };
            table.insert(v79, v50(v84, v76, v72.refreshForStatusCompatibility));
        end;
    end;
    if #v78 == 0 and #v79 == 0 then
        return nil;
    else
        local v85 = v72.state.expanded[v74.Section];
        local v86 = false;
        if v76.Status ~= nil then
            v86 = not v85 or v76.IsSectionStatus;
        end;
        local v87 = if v86 then v21 else nil;
        local v88 = if v86 then {
            StatusLevel = v76.Status.Level, 
            StatusMessage = v76.Status.Type, 
            StatusContext = v76.Status.Context, 
            Position = UDim2.new(1, 0, 0, 0)
        } else nil;
        return v2.createElement(l_ExpandablePane_0, {
            Expanded = v85, 
            OnExpandedChanged = function() --[[ Line: 276 ]] --[[ Name: OnExpandedChanged ]]
                -- upvalues: v72 (copy), l_join_0 (ref), v74 (copy), v85 (copy)
                v72:setState({
                    expanded = l_join_0(v72.state.expanded, {
                        [v74.Section] = not v85
                    })
                });
            end, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v73, 
            Style = "ImportTree", 
            Text = l_props_0.Localization:getText("Sections", v74.Section), 
            HeaderOverride = v72:createHeader(v74, v85, v87, v88)
        }, l_join_0(v79, v78));
    end;
end;
v31.render = function(v89) --[[ Line: 291 ]] --[[ Name: render ]]
    -- upvalues: v26 (copy), v2 (copy), l_ScrollingFrame_0 (copy)
    local l_props_1 = v89.props;
    if not l_props_1.Instance then
        return nil;
    else
        local v91 = {};
        for v92, v93 in pairs(v26(l_props_1.Instance)) do
            v91[v92] = v89:buildSection(v92, v93);
        end;
        return v2.createElement(l_ScrollingFrame_0, {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            CanvasSize = UDim2.fromScale(1, 0), 
            Layout = Enum.FillDirection.Vertical, 
            OnCanvasResize = v89.onContentResize, 
            Position = UDim2.fromScale(0, 0), 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            Size = UDim2.fromScale(1, 1)
        }, v91);
    end;
end;
v31 = l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v31);
return v3.connect(function(v94) --[[ Line: 320 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v28 (copy), v29 (copy)
    return {
        CurrentPreset = if not v28() then v94.Preview.currentPreset else nil, 
        SettingsChanged = if not v29() then v94.Preview.settingsChanged else nil, 
        AssetImportSession = v94.Preview.assetImportSession
    };
end)(v31);