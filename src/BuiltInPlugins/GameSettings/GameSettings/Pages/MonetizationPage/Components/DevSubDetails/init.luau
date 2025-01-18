local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v3 = require(l_Parent_1.Src.Util.FileUtils);
local v4 = require(l_Parent_1.Src.Util.DEPRECATED_Constants);
local v5 = require(l_Parent_1.Src.Util.DeepMergeTables);
local v6 = require(l_Parent_1.Packages.Cryo);
local v7 = require(l_Parent_1.Packages.RoactRodux);
local v8 = require(l_Parent_1.Packages.Roact);
local v9 = require(l_Parent_1.Src.Components.UploadableIcon.UploadableIconWidget);
local v10 = require(l_Parent_1.Src.Components.Dialog.WarningDialog);
local v11 = require(l_Parent_1.Src.ContextServices.Dialog);
local v12 = require(script.Parent.DevSubListItemText);
local v13 = require(l_Parent_1.Src.Actions.AddChange);
local v14 = require(l_Parent_0.Thunks.AddDevSubKeyChange);
local v15 = require(l_Parent_0.Thunks.DevSubModeration);
local v16 = require(l_Parent_1.Packages.Framework);
local l_ContextServices_0 = v16.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v16.UI;
local l_Button_0 = l_UI_0.Button;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_Separator_0 = l_UI_0.Separator;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_TextInput_0 = l_UI_0.TextInput;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local l_Util_0 = v16.Util;
local l_GetTextSize_0 = l_Util_0.GetTextSize;
local l_FitFrameOnAxis_0 = l_Util_0.FitFrame.FitFrameOnAxis;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local v32 = v8.Component:extend("DeveloperSubscriptionDetails");
local v33 = game:DefineFastInt("DeveloperSubscriptionsMaxRobuxPrice", 2000);
v32.init = function(v34) --[[ Line: 57 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v10 (copy)
    v34.state = {
        isNameDirty = false
    };
    v34.CheckName = function() --[[ Line: 62 ]] --[[ Name: CheckName ]]
        -- upvalues: v34 (copy)
        if not v34.state.isNameDirty then
            return;
        else
            v34.props.ModerateDevSub(v34.props.DeveloperSubscription);
            return;
        end;
    end;
    v34.onKeyChanged = function(v35, v36) --[[ Line: 70 ]] --[[ Name: onKeyChanged ]]
        -- upvalues: v34 (copy)
        local l_DeveloperSubscription_0 = v34.props.DeveloperSubscription;
        v34.props.SetDevSubKey(l_DeveloperSubscription_0.Key, v35, v36);
        l_DeveloperSubscription_0[v35] = v36;
        v34.props.OnDeveloperSubscriptionChanged(l_DeveloperSubscription_0);
    end;
    v34.onNameChanged = function(v38) --[[ Line: 77 ]] --[[ Name: onNameChanged ]]
        -- upvalues: v34 (copy)
        v34.onKeyChanged("Name", v38);
        if not v34.state.isNameDirty then
            v34:setState({
                isNameDirty = true
            });
        end;
    end;
    v34.onNameFocusChanged = function(_) --[[ Line: 85 ]] --[[ Name: onNameFocusChanged ]]
        -- upvalues: v34 (copy)
        v34.CheckName();
    end;
    v34.onPriceChanged = function(v40) --[[ Line: 89 ]] --[[ Name: onPriceChanged ]]
        -- upvalues: v34 (copy)
        v34.onKeyChanged("Price", v40);
    end;
    v34.onImageChanged = function(v41) --[[ Line: 93 ]] --[[ Name: onImageChanged ]]
        -- upvalues: v34 (copy)
        v34.onKeyChanged("Image", v41);
    end;
    v34.onPrepaidChanged = function(v42) --[[ Line: 97 ]] --[[ Name: onPrepaidChanged ]]
        -- upvalues: v34 (copy)
        v34.onKeyChanged("Prepaid", v42);
    end;
    v34.onBackButtonActivated = function() --[[ Line: 101 ]] --[[ Name: onBackButtonActivated ]]
        -- upvalues: v34 (copy)
        v34.props.OnEditFinished(false);
    end;
    v34.setImage = function() --[[ Line: 105 ]] --[[ Name: setImage ]]
        -- upvalues: v34 (copy), v3 (ref)
        local l_Localization_0 = v34.props.Localization;
        local v44 = v3.PromptForGameIcon(v34, l_Localization_0);
        if v44 then
            v34.onImageChanged(v44);
        end;
    end;
    v34.onDeleteClicked = function() --[[ Line: 114 ]] --[[ Name: onDeleteClicked ]]
        -- upvalues: v34 (copy), v10 (ref)
        if v34.props.DeveloperSubscription.IsNew then
            v34.props.OnDevSubDeleted(v34.props.DeveloperSubscription);
            v34.onBackButtonActivated();
            return;
        else
            local l_Localization_1 = v34.props.Localization;
            local l_Dialog_0 = v34.props.Dialog;
            local v47 = {
                Title = l_Localization_1:getText("General", "DevSubsDeleteTitle"), 
                Header = l_Localization_1:getText("General", "DevSubsDeleteHeader"), 
                Description = l_Localization_1:getText("General", "DevSubsDeleteDescription"), 
                Buttons = {
                    l_Localization_1:getText("General", "ButtonCancel"), 
                    l_Localization_1:getText("General", "DevSubsDeleteConfirm")
                }
            };
            if l_Dialog_0.showDialog(v10, v47):await() then
                v34.props.OnDevSubDeleted(v34.props.DeveloperSubscription);
            end;
            return;
        end;
    end;
end;
v32.render = function(v48) --[[ Line: 140 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v33 (copy), l_GetTextSize_0 (copy), v8 (copy), l_FitFrameOnAxis_0 (copy), l_HoverArea_0 (copy), l_Separator_0 (copy), v6 (copy), v4 (copy), l_Button_0 (copy), l_TitledFrame_0 (copy), v12 (copy), l_StudioService_0 (copy), l_TextInput_0 (copy), v9 (copy), l_Image_0 (copy), l_SelectInput_0 (copy), l_Pane_0 (copy)
    local l_DeveloperSubscription_1 = v48.props.DeveloperSubscription;
    local l_ModeratedDevSub_0 = v48.props.ModeratedDevSub;
    local l_DevSubErrors_0 = v48.props.DevSubErrors;
    local l_Stylizer_0 = v48.props.Stylizer;
    local l_Localization_2 = v48.props.Localization;
    local v54 = l_DeveloperSubscription_1.IsNew or l_DeveloperSubscription_1.Active;
    local l_IsNew_0 = l_DeveloperSubscription_1.IsNew;
    local v56 = l_LayoutOrderIterator_0.new();
    local v57 = nil;
    local v58 = nil;
    local v59 = nil;
    if v54 then
        if l_DevSubErrors_0.Name then
            if l_DevSubErrors_0.Name.Empty then
                v57 = l_Localization_2:getText("General", "ErrorNameEmpty");
            elseif l_DevSubErrors_0.Name.Moderated and l_ModeratedDevSub_0 then
                v57 = l_Localization_2:getText("General", "ErrorDevSubFiltered", {
                    filteredText = l_ModeratedDevSub_0.filteredName
                });
            end;
        end;
        if l_DeveloperSubscription_1.IsNew and l_DevSubErrors_0.Price then
            if l_DevSubErrors_0.Price.NotANumber then
                v58 = l_Localization_2:getText("General", "ErrorDevSubInvalidPrice");
            elseif v33 and l_DevSubErrors_0.Price.AboveMaxRobuxAmount then
                v58 = l_Localization_2:getText("General", "ErrorDevSubMaxPrice", {
                    maxRobuxAmount = v33
                });
            end;
        end;
        if l_DevSubErrors_0.Image then
            v59 = l_Localization_2:getText("General", "ErrorImageRequired");
        end;
    end;
    local v60 = {
        {
            Id = 6, 
            Label = l_Localization_2:getText("General", "DevSubsDuration6Months")
        }, 
        {
            Id = 12, 
            Label = l_Localization_2:getText("General", "DevSubsDuration12Months")
        }
    };
    local v61 = l_GetTextSize_0(l_DeveloperSubscription_1.Id, l_Stylizer_0.fontStyle.Normal.TextSize, l_Stylizer_0.fontStyle.Normal.Font);
    local l_TextSize_0 = l_Stylizer_0.fontStyle.Normal.TextSize;
    local v64 = {
        HeaderFrame = v8.createElement(l_FitFrameOnAxis_0, {
            LayoutOrder = v56:getNextOrder(), 
            BackgroundTransparency = 1, 
            axis = l_FitFrameOnAxis_0.Axis.Vertical, 
            minimumSize = UDim2.new(1, 0, 0, 0), 
            contentPadding = UDim.new(0, l_Stylizer_0.settingsPage.headerPadding)
        }, {
            BackButton = v8.createElement("ImageButton", {
                Size = UDim2.new(0, l_Stylizer_0.backButton.size, 0, l_Stylizer_0.backButton.size), 
                LayoutOrder = 0, 
                Image = l_Stylizer_0.backButton.image, 
                BackgroundTransparency = 1, 
                [v8.Event.Activated] = function() --[[ Line: 208 ]]
                    -- upvalues: v48 (copy)
                    v48.onBackButtonActivated();
                end
            }, {
                v8.createElement(l_HoverArea_0, {
                    Cursor = "PointingHand"
                })
            }), 
            v8.createElement(l_Separator_0, {
                LayoutOrder = 1
            }), 
            Header = v8.createElement("TextLabel", v6.Dictionary.join(l_Stylizer_0.fontStyle.Title, {
                Size = UDim2.new(1, 0, 0, v4.HEADER_HEIGHT), 
                Text = l_DeveloperSubscription_1.IsNew and l_Localization_2:getText("General", "DevSubsNewHeader") or l_Localization_2:getText("General", "DevSubsEditHeader"), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                LayoutOrder = 2
            }), {
                Padding = v8.createElement("UIPadding", {
                    PaddingRight = UDim.new(0, 12)
                }), 
                Layout = v8.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom
                }), 
                Button = v8.createElement(l_Button_0, {
                    Text = l_Localization_2:getText("General", "DevSubsDeleteAction"), 
                    OnClick = v48.onDeleteClicked, 
                    Style = "Round"
                })
            })
        }), 
        IdFrame = not l_IsNew_0 and v8.createElement(l_TitledFrame_0, {
            LayoutOrder = v56:getNextOrder(), 
            Title = l_Localization_2:getText("General", "DevSubsId")
        }, {
            Layout = v8.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            Text = v8.createElement(v12, {
                Text = l_DeveloperSubscription_1.Id, 
                Size = UDim2.new(0, v61.X, 0.5, 0), 
                Alignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 1
            }), 
            Button = v8.createElement("ImageButton", {
                BackgroundTransparency = 1, 
                Image = l_Stylizer_0.copyButton.image, 
                ImageColor3 = l_Stylizer_0.copyButton.imageColor, 
                Size = UDim2.new(0, 16, 0, 16), 
                SizeConstraint = Enum.SizeConstraint.RelativeYY, 
                LayoutOrder = 2, 
                [v8.Event.Activated] = function() --[[ Line: 274 ]]
                    -- upvalues: l_StudioService_0 (ref), l_DeveloperSubscription_1 (copy)
                    l_StudioService_0:CopyToClipboard(l_DeveloperSubscription_1.Id);
                end
            })
        }), 
        NameFrame = v8.createElement(l_TitledFrame_0, {
            LayoutOrder = v56:getNextOrder(), 
            Title = l_Localization_2:getText("General", "DevSubsName")
        }, {
            TextBox = v8.createElement(l_TextInput_0, {
                Disabled = not v54, 
                ErrorText = v57, 
                MaxLength = 32, 
                OnTextChanged = v48.onNameChanged, 
                OnFocusLost = v48.onNameFocusChanged, 
                Text = l_DeveloperSubscription_1.Name or ""
            })
        }), 
        Image = v54 and v8.createElement(v9, {
            Title = l_Localization_2:getText("General", "DevSubsImage"), 
            Enabled = true, 
            Icon = l_DeveloperSubscription_1.Image, 
            LayoutOrder = v56:getNextOrder(), 
            TutorialEnabled = false, 
            ErrorMessage = v59, 
            AddIcon = v48.setImage
        }) or v8.createElement(l_TitledFrame_0, {
            LayoutOrder = v56:getNextOrder(), 
            Title = l_Localization_2:getText("General", "DevSubsImage")
        }, {
            Image = v8.createElement("ImageLabel", {
                Image = l_DeveloperSubscription_1.Image, 
                Size = UDim2.new(0, 150, 0, 150)
            })
        }), 
        PriceFrame = v8.createElement(l_TitledFrame_0, {
            LayoutOrder = v56:getNextOrder(), 
            Title = l_Localization_2:getText("General", "DevSubsPrice")
        }, {
            Input = v8.createElement(l_TextInput_0, {
                Disabled = not l_DeveloperSubscription_1.IsNew, 
                ErrorText = v58, 
                MaxLength = 50000, 
                OnTextChanged = v48.onPriceChanged, 
                Text = tostring(l_DeveloperSubscription_1.Price), 
                Size = UDim2.new(0, 200, 0, 32), 
                LeadingComponent = l_Image_0, 
                LeadingComponentProps = {
                    Size = UDim2.new(0, l_TextSize_0, 0, l_TextSize_0), 
                    Image = l_Stylizer_0.robuxFeeBase.icon.image, 
                    ImageColor3 = Color3.fromRGB(25, 25, 25)
                }
            })
        }), 
        PrepaidFrame = v8.createElement(l_TitledFrame_0, {
            LayoutOrder = v56:getNextOrder(), 
            Title = l_Localization_2:getText("General", "DevSubsDuration")
        }, {
            Selector = v8.createElement(l_SelectInput_0, {
                Items = v60, 
                Enabled = l_DeveloperSubscription_1.Prepaid ~= nil, 
                SelectedId = l_DeveloperSubscription_1.Prepaid, 
                OnItemActivated = function(v63) --[[ Line: 341 ]] --[[ Name: OnItemActivated ]]
                    -- upvalues: v48 (copy)
                    v48.onPrepaidChanged(v63.Id);
                end
            })
        }), 
        EarningFrame = not l_IsNew_0 and v8.createElement(l_TitledFrame_0, {
            LayoutOrder = v56:getNextOrder(), 
            Title = l_Localization_2:getText("General", "DevSubsPendingEarning")
        }, {
            Text = v8.createElement(v12, {
                Text = tostring(l_DeveloperSubscription_1.PendingEarning), 
                Size = UDim2.new(1, 0, 0.5, 0), 
                Alignment = Enum.TextXAlignment.Left
            })
        })
    };
    return v8.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        LayoutOrder = v48.props.LayoutOrder or 1, 
        Layout = Enum.FillDirection.Vertical, 
        Spacing = UDim.new(0, v4.ELEMENT_PADDING)
    }, v64);
end;
v32 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Dialog = v11
})(v32);
local v65 = require(l_Parent_1.Src.Networking.settingFromState);
return v7.connect(function(v66, _) --[[ Line: 375 ]]
    -- upvalues: v65 (copy), v5 (copy)
    local l_Errors_0 = v66.Settings.Errors;
    local v69 = (v66.Settings.Current or {}).DeveloperSubscriptions or {};
    local v70 = (v66.Settings.Changed or {}).DeveloperSubscriptions or {};
    local function _(v71) --[[ Line: 384 ]]
        -- upvalues: v65 (ref), v66 (copy)
        return v65(v66.Settings, v71);
    end;
    local v73 = v5.Merge(v69, v70) or {};
    local v74 = v65(v66.Settings, "editedSubscriptionKey");
    local v75 = l_Errors_0.DeveloperSubscriptions or {};
    return {
        DeveloperSubscription = v73[v74], 
        ModeratedDevSubs = v66.DevSubModeration or {}, 
        DevSubErrors = v75[v74] or {}
    };
end, function(v76) --[[ Line: 397 ]]
    -- upvalues: v13 (copy), v14 (copy), v15 (copy)
    return {
        OnEditFinished = function() --[[ Line: 399 ]] --[[ Name: OnEditFinished ]]
            -- upvalues: v76 (copy), v13 (ref)
            v76(v13("isEditingSubscription", false));
            v76(v13("editedSubscriptionKey", nil));
        end, 
        OnDevSubDeleted = function(v77) --[[ Line: 405 ]] --[[ Name: OnDevSubDeleted ]]
            -- upvalues: v76 (copy), v14 (ref)
            if not v77.IsNew then
                v76(v14(v77.Key, "Active", false));
            end;
        end, 
        ModerateDevSub = function(v78) --[[ Line: 411 ]] --[[ Name: ModerateDevSub ]]
            -- upvalues: v76 (copy), v15 (ref)
            v76(v15(v78));
        end
    };
end)(v32);