local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Components.AssetPalettes);
local v2 = require(l_script_FirstAncestor_0.Src.Components.AvatarScreenContext);
local v3 = require(l_script_FirstAncestor_0.Src.Components.Sizing.AvatarSizingHint);
local v4 = require(l_script_FirstAncestor_0.Src.Components.Catalog);
local v5 = require(l_script_FirstAncestor_0.Src.Resources.CatalogItems);
local v6 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v7 = require(l_script_FirstAncestor_0.Src.Components.ContextStack);
local v8 = require(l_script_FirstAncestor_0.Src.Components.ContextStack_DEPRECATED);
local v9 = require(script.ContextualSurveyDialogButton);
local v10 = require(l_script_FirstAncestor_0.Src.Util.DEPRECATED_AvatarScreenContext);
local v11 = require(l_script_FirstAncestor_0.Packages.Dash);
local v12 = require(l_script_FirstAncestor_0.Src.Components.DisambiguationMenuContext);
local v13 = require(l_script_FirstAncestor_0.Src.Components.EditingTools);
local v14 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
local v15 = require(l_script_FirstAncestor_0.Packages.Framework);
local v16 = require(l_script_FirstAncestor_0.Src.Components.PrimaryDummyPreview);
local v17 = require(l_script_FirstAncestor_0.Packages.React);
local v18 = require(l_script_FirstAncestor_0.Src.Components.ResizeNotice.ResizeNotice);
local v19 = require(l_script_FirstAncestor_0.Src.Util.SimpleSerializedStateContext);
local v20 = require(l_script_FirstAncestor_0.Src.Components.StageSelector);
local v21 = require(script.Stages);
local v22 = require(l_script_FirstAncestor_0.Src.Components.TabBar);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v25 = require(l_script_FirstAncestor_0.Src.Components.UGCValidationNotice);
local v26 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetup);
local v27 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerCheckFaceItems);
local v28 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerEditingTools);
local v29 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerPickTabsMenu);
local v30 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerSkinToneAlphaDetection);
local v31 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerTestWithAssets);
local v32 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
local v33 = require(l_script_FirstAncestor_0.Src.Util.getPaletteFromKey);
local v34 = require(l_script_FirstAncestor_0.Src.Hooks.useAccessoryWelding);
local v35 = require(l_script_FirstAncestor_0.Src.Hooks.useBodyPartsFromBase);
local v36 = require(l_script_FirstAncestor_0.Src.Hooks.useClothingFromInstances);
local v37 = require(l_script_FirstAncestor_0.Src.Hooks.useCopyPropertyChanges);
local v38 = require(l_script_FirstAncestor_0.Src.Hooks.useDummyFromHumanoidDescription);
local v39 = require(l_script_FirstAncestor_0.Src.Hooks.useIncrementedState);
local v40 = require(l_script_FirstAncestor_0.Src.Hooks.useInitialImportController);
local v41 = require(l_script_FirstAncestor_0.Src.Hooks.useMoveAccessoriesAlongsideAttachments);
local v42 = require(l_script_FirstAncestor_0.Src.Hooks.usePreviewHumanoidDescription);
local v43 = require(l_script_FirstAncestor_0.Src.Hooks.useTrackNewChildrenController);
local v44 = require(l_script_FirstAncestor_0.Src.Hooks.useUntexturedController);
local l_Pane_0 = v15.UI.Pane;
local l_LayoutOrderIterator_0 = v15.Util.LayoutOrderIterator;
local l_Signal_0 = v15.Util.Signal;
local l_Stylizer_0 = v15.ContextServices.Stylizer;
local function _(v49) --[[ Line: 61 ]] --[[ Name: firstPaletteName ]]
    -- upvalues: v5 (copy)
    return v5[v49][1].Key;
end;
local function v52(v51) --[[ Line: 67 ]] --[[ Name: WorldModelMonitor ]]
    -- upvalues: v40 (copy), v43 (copy), v28 (copy), v37 (copy)
    v40(v51.WorldModel);
    v43(v51.WorldModel);
    if v28() then
        v37(v51.WorldModel, v51.Dummy, v51.UpdateHumanoidDescription);
    end;
end;
return function(v53) --[[ Line: 86 ]] --[[ Name: AvatarScreen ]]
    -- upvalues: l_Stylizer_0 (copy), v17 (copy), v14 (copy), v19 (copy), v21 (copy), v5 (copy), v11 (copy), v33 (copy), v27 (copy), v42 (copy), v38 (copy), v35 (copy), v36 (copy), v44 (copy), v34 (copy), v28 (copy), v41 (copy), l_Signal_0 (copy), v6 (copy), v39 (copy), l_LayoutOrderIterator_0 (copy), l_Pane_0 (copy), v20 (copy), v31 (copy), v22 (copy), v1 (copy), v29 (copy), v4 (copy), v16 (copy), v32 (copy), v18 (copy), v3 (copy), v25 (copy), v26 (copy), v9 (copy), v52 (copy), v13 (copy), v30 (copy), v7 (copy), v2 (copy), v12 (copy), v10 (copy), v8 (copy)
    local v54 = l_Stylizer_0:use("AvatarScreen");
    local v55 = l_Stylizer_0:use("StageSelector");
    local v56 = v17.useContext(v14);
    local v57 = v17.useContext(v19);
    local v58 = v21[v57.stage];
    local l_WorldModel_0 = v53.Avatar.WorldModel;
    local v60, v61 = v17.useState(v58.tabs[1]);
    assert(v60 ~= nil, "Current stage didn't have a tab");
    local v62, v63 = v17.useState(v5[v60][1].Key);
    local v65 = v11.find(v5[v60], function(v64) --[[ Line: 102 ]]
        -- upvalues: v62 (copy)
        return v64.Key == v62;
    end);
    v17.useEffect(function() --[[ Line: 106 ]]
        -- upvalues: v58 (copy), v60 (copy), v61 (copy), v63 (copy), v5 (ref)
        if table.find(v58.tabs, v60) ~= nil then
            return;
        else
            local v66 = v58.tabs[1];
            v61(v66);
            v63(v5[v66][1].Key);
            return;
        end;
    end, {
        v58
    });
    local v72 = v17.useCallback(function(v67) --[[ Line: 119 ]]
        -- upvalues: v33 (ref), v27 (ref), v58 (copy), v63 (copy), v61 (copy), v21 (ref), v57 (copy)
        local _, v69 = v33(v67, if v27() then v58.tabs else nil);
        assert(v69 ~= nil, "Selecting palette that doesn't exist");
        v63(v67);
        v61(v69);
        if v27() and table.find(v58.tabs, v69) ~= nil then
            return;
        else
            for v70, v71 in v21 do
                if table.find(v71.tabs, v69) ~= nil then
                    v57.setStage(v70);
                    return;
                end;
            end;
            error((("Invalid stage for %* (in %*)"):format(v67, v69)));
            return;
        end;
    end, {
        v57.setStage, 
        if v27() then v58.tabs else nil
    });
    local v73, v74 = v17.useState({});
    local v75, v76 = v17.useState(0);
    local v77 = v42(v53.Avatar, {
        v75
    });
    local v78 = v38(v53.Avatar, v77);
    v35(v78, l_WorldModel_0);
    v36(v78);
    v44(v78, v57.isTextured);
    v34(v78);
    if v28() then
        v41(v78);
    end;
    local v79 = v17.useRef(l_Signal_0.new());
    assert(v79.current ~= nil, v6.LUAU_ANALYZE_ERROR);
    local v80 = v17.useCallback(function() --[[ Line: 176 ]]
        -- upvalues: v79 (copy)
        v79.current:Fire();
    end, {});
    local v81 = v39();
    local v82 = l_LayoutOrderIterator_0.new();
    local v85 = {
        AvatarScreen = v17.createElement(l_Pane_0, {}, {
            StageSelect = v17.createElement(v20, {
                SelectedStage = v57.stage, 
                SetStage = v57.setStage, 
                Avatar = v53.Avatar, 
                PreviewDummy = if v31() then v78 else nil
            }), 
            Contents = v17.createElement(l_Pane_0, {
                Position = UDim2.fromOffset(v55.Width, 0), 
                Size = UDim2.new(1, -v55.Width, 1, 0)
            }, {
                Tabs = v17.createElement(l_Pane_0, {
                    Position = UDim2.fromOffset(0, v54.Tabs.VerticalOffset), 
                    Size = UDim2.new(1, 0, 0, v54.Tabs.Height), 
                    Layout = Enum.FillDirection.Vertical
                }, {
                    TabBar = v17.createElement(v22, {
                        LayoutOrder = v82:getNextOrder(), 
                        Tabs = v58.tabs, 
                        SelectedTab = v60, 
                        SetSelectedTab = function(v83) --[[ Line: 207 ]] --[[ Name: SetSelectedTab ]]
                            -- upvalues: v61 (copy), v63 (copy), v5 (ref)
                            v61(v83);
                            v63(v5[v83][1].Key);
                        end
                    }), 
                    AssetPalettes = v17.createElement(v1, {
                        LayoutOrder = if v29() then v82:getNextOrder() else nil, 
                        SelectedTab = v60, 
                        SelectedPalette = v62, 
                        SetSelectedPalette = v63, 
                        ScrollingFrameProps = if v29() then nil else {
                            LayoutOrder = v82:getNextOrder()
                        }
                    })
                }), 
                Contents = v17.createElement(l_Pane_0, {
                    AnchorPoint = Vector2.new(0, 1), 
                    Position = UDim2.fromScale(0, 1), 
                    Size = UDim2.new(1, 0, 1, -v54.Tabs.Height)
                }, {
                    CatalogContainer = v65 and v17.createElement(l_Pane_0, {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundColor3 = v54.AssetPalettes.BackgroundColor, 
                        Size = UDim2.new(0, v54.AssetPalettes.Width, 1, 0)
                    }, {
                        CatalogContainer = v17.createElement(l_Pane_0, {
                            Size = UDim2.new(1, -v54.AssetPalettes.SeparatorWidth, 1, 0)
                        }, {
                            Catalog = v17.createElement(v4, {
                                Palette = v65
                            })
                        }), 
                        Separator = v17.createElement(l_Pane_0, {
                            AnchorPoint = Vector2.new(1, 0), 
                            BackgroundColor3 = v54.AssetPalettes.SeparatorColor, 
                            Position = UDim2.fromScale(1, 0), 
                            Size = UDim2.new(0, v54.AssetPalettes.SeparatorWidth, 1, 0)
                        })
                    }), 
                    Preview = v17.createElement(l_Pane_0, {
                        AnchorPoint = Vector2.new(1, 0), 
                        Position = UDim2.fromScale(1, 0), 
                        Size = UDim2.new(1, if v65 then -v54.AssetPalettes.Width else 0, 1, 0)
                    }, {
                        DummyPreview = v17.createElement(v16, {
                            Dummy = v78, 
                            Avatar = v53.Avatar, 
                            RevertToDefault = function() --[[ Line: 266 ]] --[[ Name: RevertToDefault ]]
                                -- upvalues: l_WorldModel_0 (copy), v56 (copy)
                                if l_WorldModel_0 == nil then
                                    return;
                                else
                                    v56.removeAllEquippedItems();
                                    return;
                                end;
                            end, 
                            ResetCameraSignal = v79.current
                        }), 
                        ResizeNotification = if v32() then v17.createElement(v18, {
                            Avatar = v53.Avatar
                        }) else nil, 
                        AvatarSizingHint = if v32() and v53.IsSelected then v17.createElement(v3, {
                            Avatar = v53.Avatar
                        }) else nil, 
                        UGCValidationNotice = v17.createElement(v25, {
                            Avatar = v53.Avatar
                        }), 
                        ChedkRender = if v57.stage == "CheckBody" then v17.createElement(v21.CheckBody.render, {
                            Avatar = v53.Avatar, 
                            Dummy = v78, 
                            SelectedTab = v60
                        }) else if v57.stage == "CheckFace" then v17.createElement(v21.CheckFace.render, {
                            Avatar = v53.Avatar, 
                            Dummy = v78, 
                            SelectedTab = v60
                        }) else error((("Unknown stage %*"):format(v57.stage))), 
                        ContextualSurveyDialogButton = v26() and v17.createElement(v9, {
                            Avatar = v53.Avatar
                        })
                    })
                })
            })
        }), 
        InitialImport = v17.createElement(v52, {
            WorldModel = l_WorldModel_0, 
            Dummy = v78, 
            UpdateHumanoidDescription = function() --[[ Line: 322 ]] --[[ Name: UpdateHumanoidDescription ]]
                -- upvalues: v76 (copy)
                v76(function(v84) --[[ Line: 323 ]]
                    return v84 + 1;
                end);
            end
        }), 
        [v6.EDITING_TOOLS_GUI_NAMES.EditingToolbar] = v28() and v17.createElement(v13, {
            worldModel = l_WorldModel_0
        })
    };
    if v30() then
        return v17.createElement(v7, {
            providers = {
                v17.createElement(v2.Provider, {
                    openPalette = v72, 
                    resetCamera = v80, 
                    stage = v58, 
                    selectedAvatar = l_WorldModel_0
                }), 
                v17.createElement(v12.Provider)
            }
        }, v85);
    elseif v26() then
        return v17.createElement(v7, {
            providers = {
                v17.createElement(v10.Provider, {
                    openPalette = 3, 
                    value = {
                        openPalette = v72, 
                        focusedAttachments = if v28() then v73 else nil, 
                        setFocusedAttachments = if v28() then v74 else nil, 
                        dummyPreviewLocked = v81.amount > 0, 
                        incrementDummyPreviewLock = v81.increment, 
                        decrementDummyPreviewLock = v81.decrement, 
                        resetCamera = v80, 
                        stage = v58
                    }
                }), 
                v17.createElement(v12.Provider)
            }
        }, v85);
    else
        return v17.createElement(v8, {
            providers = {
                {
                    provider = v10.Provider, 
                    value = {
                        openPalette = v72, 
                        resetCamera = v80, 
                        stage = v58, 
                        dummyPreviewLocked = v81.amount > 0, 
                        incrementDummyPreviewLock = v81.increment, 
                        decrementDummyPreviewLock = v81.decrement
                    }
                }, 
                {
                    provider = v12.Provider
                }
            }
        }, v85);
    end;
end;