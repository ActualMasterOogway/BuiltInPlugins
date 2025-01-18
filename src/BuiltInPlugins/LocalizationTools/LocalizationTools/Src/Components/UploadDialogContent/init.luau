local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_Button_0 = l_UI_0.Button;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v9 = v1.PureComponent:extend("UploadDialogContent");
local function v11(v10) --[[ Line: 20 ]] --[[ Name: Line ]]
    -- upvalues: v1 (copy), l_TextLabel_0 (copy)
    return v1.createElement(l_TextLabel_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Text = v10.Text, 
        TextColor = v10.Color, 
        LayoutOrder = v10.LayoutOrder
    });
end;
local function v16(v12) --[[ Line: 29 ]] --[[ Name: StringContentLine ]]
    -- upvalues: v1 (copy), v11 (copy)
    local v13 = true;
    if v12.Content ~= "" then
        v13 = true;
        if v12.Content ~= nil then
            v13 = v12.Content == 0;
        end;
    end;
    local v14 = v13 and v12.ColorB or v12.ColorA;
    local v15 = string.format("%s %s", v12.PreText, v13 and "none" or tostring(v12.Content));
    return v1.createElement(v11, {
        Text = v15, 
        Color = v14, 
        LayoutOrder = v12.LayoutOrder
    });
end;
local function v19(v17) --[[ Line: 40 ]] --[[ Name: UnsupportedLocalesLine ]]
    -- upvalues: v1 (copy), v11 (copy)
    if v17.Content ~= nil and v17.Content ~= "" then
        local v18 = string.format("%s %s", v17.PreText, v17.Content);
        return v1.createElement(v11, {
            Text = v18, 
            Color = v17.Color, 
            LayoutOrder = v17.LayoutOrder
        });
    else
        return nil;
    end;
end;
local function v23(v20) --[[ Line: 53 ]] --[[ Name: NumberLine ]]
    -- upvalues: v1 (copy), v11 (copy)
    local v21 = v20.Count > 0 and v20.EnabledColor or v20.DisabledColor;
    local v22 = string.format("%s %d", v20.PreText, v20.Count);
    return v1.createElement(v11, {
        Text = v22, 
        Color = v21, 
        LayoutOrder = v20.LayoutOrder
    });
end;
v9.render = function(v24) --[[ Line: 64 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v11 (copy), v16 (copy), v19 (copy), v23 (copy), l_Button_0 (copy), l_HoverArea_0 (copy)
    local l_props_0 = v24.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_CancelCallback_0 = l_props_0.CancelCallback;
    local l_OkCallback_0 = l_props_0.OkCallback;
    local l_totalRows_0 = l_props_0.PatchInfo.totalRows;
    local l_totalTranslations_0 = l_props_0.PatchInfo.totalTranslations;
    local l_supportedLocales_0 = l_props_0.PatchInfo.supportedLocales;
    local l_unsupportedLocales_0 = l_props_0.PatchInfo.unsupportedLocales;
    local l_numAddedEntries_0 = l_props_0.PatchInfo.numAddedEntries;
    local l_numAddedTranslations_0 = l_props_0.PatchInfo.numAddedTranslations;
    local l_numChangedTranslations_0 = l_props_0.PatchInfo.numChangedTranslations;
    local l_includeDeletes_0 = l_props_0.PatchInfo.includeDeletes;
    local l_numRemovedEntries_0 = l_props_0.PatchInfo.numRemovedEntries;
    local l_numRemovedTranslations_0 = l_props_0.PatchInfo.numRemovedTranslations;
    local l_newLanguages_0 = l_props_0.PatchInfo.newLanguages;
    local v41 = nil;
    v41 = if l_numAddedTranslations_0 + l_numChangedTranslations_0 + l_numRemovedTranslations_0 + l_numAddedEntries_0 + l_numRemovedEntries_0 == 0 then l_Localization_0:getText("UploadDialogContent", "PatchEmptyMessage") else l_Localization_0:getText("UploadDialogContent", "UploadPatchMessage");
    local l_createElement_0 = v1.createElement;
    local v43 = "Frame";
    local v44 = {
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_Stylizer_0.MainBackground, 
        Size = UDim2.new(1, 0, 1, 0)
    };
    local v45 = {
        Padding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_Stylizer_0.Padding), 
            PaddingRight = UDim.new(0, l_Stylizer_0.Padding), 
            PaddingTop = UDim.new(0, l_Stylizer_0.Padding)
        }), 
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local l_createElement_1 = v1.createElement;
    local v47 = "Frame";
    local v48 = {
        BackgroundTransparency = 1, 
        LayoutOrder = 1, 
        Size = UDim2.new(1, 0, 0, l_Stylizer_0.PatchInfoFrameHeight)
    };
    local v49 = {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        TableContentTitle = v1.createElement(v11, {
            Color = l_Stylizer_0.BrightText, 
            LayoutOrder = 1, 
            Text = l_Localization_0:getText("UploadDialogContent", "PatchContainsLabel")
        }), 
        TableContentFrame = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.TableContentsFrameHeight)
        }, {
            Layout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Padding = v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_Stylizer_0.TableContentPaddingLeft), 
                PaddingTop = UDim.new(0, l_Stylizer_0.TableContentPaddingTop)
            }), 
            TotalRowsLine = v1.createElement(v16, {
                PreText = l_Localization_0:getText("UploadDialogContent", "PatchTotalRowsLabel"), 
                Content = l_totalRows_0, 
                ColorA = l_Stylizer_0.BrightText, 
                ColorB = l_Stylizer_0.ErrorText, 
                LayoutOrder = 1
            }), 
            TranslationsLine = v1.createElement(v16, {
                PreText = l_Localization_0:getText("UploadDialogContent", "PatchTotalTranslationsLabel"), 
                Content = l_totalTranslations_0, 
                ColorA = l_Stylizer_0.BrightText, 
                ColorB = l_Stylizer_0.ErrorText, 
                LayoutOrder = 2
            }), 
            SupportedLocales = v1.createElement(v16, {
                PreText = l_Localization_0:getText("UploadDialogContent", "PatchLanguagesLabel"), 
                Content = l_supportedLocales_0, 
                ColorA = l_Stylizer_0.BrightText, 
                ColorB = l_Stylizer_0.DimmedText, 
                LayoutOrder = 3
            }), 
            UnsupportedLocales = v1.createElement(v19, {
                PreText = l_Localization_0:getText("UploadDialogContent", "PatchInvalidLanguagesLabel"), 
                Content = l_unsupportedLocales_0, 
                Color = l_Stylizer_0.WarningText, 
                LayoutOrder = 4
            })
        }), 
        ThisPatchWillTitle = v1.createElement(v11, {
            Text = l_Localization_0:getText("UploadDialogContent", "PatchWillLabel"), 
            Color = l_Stylizer_0.BrightText, 
            LayoutOrder = 3
        })
    };
    local l_createElement_2 = v1.createElement;
    local v51 = "Frame";
    local v52 = {
        BackgroundTransparency = 1, 
        LayoutOrder = 4, 
        Size = UDim2.new(1, 0, 0, l_Stylizer_0.ThisPatchWIllFrameHeight)
    };
    local v53 = {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Padding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_Stylizer_0.TableContentPaddingLeft), 
            PaddingTop = UDim.new(0, l_Stylizer_0.TableContentPaddingTop)
        }), 
        AddEntriesLine = v1.createElement(v23, {
            PreText = l_Localization_0:getText("UploadDialogContent", "AddEntriesPreText"), 
            Count = l_numAddedEntries_0, 
            EnabledColor = l_Stylizer_0.BrightText, 
            DisabledColor = l_Stylizer_0.DimmedText, 
            LayoutOrder = 1
        }), 
        AddTranslationsLine = v1.createElement(v23, {
            PreText = l_Localization_0:getText("UploadDialogContent", "AddTranslationsPretext"), 
            Count = l_numAddedTranslations_0, 
            EnabledColor = l_Stylizer_0.BrightText, 
            DisabledColor = l_Stylizer_0.DimmedText, 
            LayoutOrder = 2
        }), 
        ChangeLine = v1.createElement(v23, {
            PreText = l_Localization_0:getText("UploadDialogContent", "ChangeTranslationsPretext"), 
            Count = l_numChangedTranslations_0, 
            EnabledColor = l_Stylizer_0.BrightText, 
            DisabledColor = l_Stylizer_0.DimmedText, 
            LayoutOrder = 3
        }), 
        DeleteEntriesLine = l_includeDeletes_0 and v1.createElement(v23, {
            PreText = l_Localization_0:getText("UploadDialogContent", "DeleteEntriesPretext"), 
            Count = l_numRemovedEntries_0, 
            EnabledColor = l_Stylizer_0.BrightText, 
            DisabledColor = l_Stylizer_0.DimmedText, 
            LayoutOrder = 4
        }), 
        DeleteTranslationsLine = l_includeDeletes_0 and v1.createElement(v23, {
            PreText = l_Localization_0:getText("UploadDialogContent", "DeleteTranslationsPretext"), 
            Count = l_numRemovedTranslations_0, 
            EnabledColor = l_Stylizer_0.BrightText, 
            DisabledColor = l_Stylizer_0.DimmedText, 
            LayoutOrder = 5
        })
    };
    local v54 = false;
    if l_newLanguages_0 ~= nil then
        v54 = false;
        if l_newLanguages_0 ~= "" then
            v54 = v1.createElement(v11, {
                Text = string.format("%s %s", l_Localization_0:getText("UploadDialogContent", "AddLanguagesPretext"), l_newLanguages_0), 
                Color = l_Stylizer_0.BrightText, 
                LayoutOrder = 6
            });
        end;
    end;
    v53.AddLanguagesLine = v54;
    v49.ThisPatchWillFrame = l_createElement_2(v51, v52, v53);
    v49.Message = v1.createElement(v11, {
        Color = l_Stylizer_0.BrightText, 
        LayoutOrder = 5, 
        Text = v41
    });
    v45.InfoFrame = l_createElement_1(v47, v48, v49);
    v45.ButtonFrame = v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = 2, 
        Size = UDim2.new(1, 0, 0, l_Stylizer_0.ButtonFrameHeight)
    }, {
        Cancel = v1.createElement(l_Button_0, {
            LayoutOrder = 1, 
            OnClick = l_CancelCallback_0, 
            Position = UDim2.new(0.5, -l_Stylizer_0.ButtonWidth - l_Stylizer_0.Padding, 0, 0), 
            Size = UDim2.new(0, l_Stylizer_0.ButtonWidth, 0, l_Stylizer_0.ButtonHeight), 
            Style = "TextButton", 
            Text = l_Localization_0:getText("UploadDialogContent", "CancelButton")
        }, {
            v1.createElement(l_HoverArea_0, {
                Cursor = "PointingHand"
            })
        }), 
        Confirm = v1.createElement(l_Button_0, {
            LayoutOrder = 2, 
            OnClick = l_OkCallback_0, 
            Position = UDim2.new(0.5, l_Stylizer_0.Padding, 0, 0), 
            Size = UDim2.new(0, l_Stylizer_0.ButtonWidth, 0, l_Stylizer_0.ButtonHeight), 
            Style = "PrimeTextButton", 
            Text = l_Localization_0:getText("UploadDialogContent", "ConfirmButton")
        }, {
            v1.createElement(l_HoverArea_0, {
                Cursor = "PointingHand"
            })
        })
    });
    return l_createElement_0(v43, v44, v45);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v9));