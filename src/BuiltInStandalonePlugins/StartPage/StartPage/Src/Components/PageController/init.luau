local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageNetworkCache)();
local v2 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageQuickLoad)();
local v3 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageAddingRecentsPage)();
local v4 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageFixTutorialPopupBackground)();
local v5 = require(l_script_FirstAncestor_0.Packages.React);
local l_useEffect_0 = v5.useEffect;
local l_useState_0 = v5.useState;
local l_join_0 = require(l_script_FirstAncestor_0.Packages.Dash).join;
local v9 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_counter_0 = v9.Util.counter;
local l_useDialog_0 = v9.UI.Hooks.useDialog;
local v12 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.TelemetryContext);
local v13 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.StartPageTelemetryEvent);
local v14 = require(l_script_FirstAncestor_0.Src.Util.AgeRestrictedDialog);
local v15 = require(l_script_FirstAncestor_0.Src.Util.VerifyAgeDialog);
local v16 = require(l_script_FirstAncestor_0.Src.Components.PageMenu);
local v17 = require(l_script_FirstAncestor_0.Src.Components.Pages);
local v18 = require(l_script_FirstAncestor_0.Src.Components.TutorialPopup);
local v19 = require(l_script_FirstAncestor_0.Src.Components.Shimmer);
local v20 = v3 and 0 or -1;
local v21 = v17[1];
local v22 = v17[2 + v20];
local v23 = v17[3 + v20];
local v24 = v17[4 + v20];
local v25 = require(l_script_FirstAncestor_0.Src.Util.TempUrls);
local v26 = require(l_script_FirstAncestor_0.Src.Util.Dialogs);
local l_StartPageManager_0 = require(l_script_FirstAncestor_0.Src.Util.Services).StartPageManager;
local v28 = v2 and 292 or 282;
return function() --[[ Line: 56 ]] --[[ Name: PageController ]]
    -- upvalues: v12 (copy), l_useState_0 (copy), v22 (copy), v1 (copy), l_useEffect_0 (copy), l_join_0 (copy), l_StartPageManager_0 (copy), l_useDialog_0 (copy), v15 (copy), v14 (copy), l_counter_0 (copy), v4 (copy), v5 (copy), v26 (copy), v28 (copy), v16 (copy), v17 (copy), v13 (copy), v19 (copy), v23 (copy), v24 (copy), v3 (copy), v21 (copy), v18 (copy), v2 (copy), v25 (copy)
    local v29 = v12:use();
    local v30, v31 = l_useState_0(true);
    local v32, v33 = l_useState_0(v22);
    local v34, v35 = l_useState_0(0);
    local v36 = nil;
    local v37 = nil;
    if not v1 then
        local v38, v39 = l_useState_0({});
        v36 = v38;
        v37 = v39;
        l_useEffect_0(function() --[[ Line: 72 ]]
            -- upvalues: v37 (ref), l_join_0 (ref), l_StartPageManager_0 (ref)
            local function v43(v40, v41) --[[ Line: 73 ]] --[[ Name: onImageImported ]]
                -- upvalues: v37 (ref), l_join_0 (ref)
                v37(function(v42) --[[ Line: 74 ]]
                    -- upvalues: l_join_0 (ref), v40 (copy), v41 (copy)
                    return l_join_0(v42, {
                        [v40] = v41
                    });
                end);
            end;
            local v44 = l_StartPageManager_0.ImageImportedSignal:Connect(v43);
            return function() --[[ Line: 81 ]]
                -- upvalues: v44 (copy)
                v44:Disconnect();
            end;
        end, {});
    end;
    local v45 = l_useDialog_0(v15.get());
    local v46 = l_useDialog_0(v14.get());
    local v47 = {
        showVerifyAge = v45, 
        showAgeRestricted = v46
    };
    if not v1 then
        l_useEffect_0(function() --[[ Line: 97 ]]
            -- upvalues: v37 (ref), l_join_0 (ref), l_StartPageManager_0 (ref)
            local function v51(v48, v49) --[[ Line: 98 ]] --[[ Name: onImageImported ]]
                -- upvalues: v37 (ref), l_join_0 (ref)
                v37(function(v50) --[[ Line: 99 ]]
                    -- upvalues: l_join_0 (ref), v48 (copy), v49 (copy)
                    return l_join_0(v50, {
                        [v48] = v49
                    });
                end);
            end;
            local v52 = l_StartPageManager_0.ImageImportedSignal:Connect(v51);
            return function() --[[ Line: 106 ]]
                -- upvalues: v52 (copy)
                v52:Disconnect();
            end;
        end, {});
    end;
    local v53 = l_counter_0();
    return if v4 then v5.createElement(v26.Provider, {
        value = v47
    }, {
        Contents = v5.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            Wrapper = v5.createElement("Frame", {
                LayoutOrder = v53(), 
                [v5.Change.AbsoluteSize] = function(v54) --[[ Line: 122 ]]
                    -- upvalues: v28 (ref), v35 (copy)
                    local v55 = math.min(1458, v54.AbsoluteSize.X - (v28 + 1));
                    v35(v55);
                end, 
                [v5.Tag] = "X-Fill X-Row StartPage-PageBackground"
            }, {
                Menu = v5.createElement("Frame", {
                    LayoutOrder = v53(), 
                    [v5.Tag] = "X-Fit X-Left X-Top X-PadS X-Transparent"
                }, {
                    v5.createElement(v16, {
                        Size = UDim2.new(0, v28, 1, 0), 
                        Pages = v17, 
                        SelectedPage = v32, 
                        OnPageSwap = function(v56) --[[ Line: 137 ]] --[[ Name: OnPageSwap ]]
                            -- upvalues: v29 (copy), v13 (ref), v32 (copy), v19 (ref), v33 (copy)
                            v29:log(v13, {
                                telemetryType = "navigation", 
                                telemetrySubtype = "page", 
                                context = "menu", 
                                from = string.match(v32.TextKey, "%w+$"), 
                                to = string.match(v56.TextKey, "%w+$")
                            });
                            v19.restartAnimation();
                            v33(v56);
                        end
                    })
                }), 
                Separator = v5.createElement("Frame", {
                    Size = UDim2.new(0, 1, 1, 0), 
                    LayoutOrder = v53(), 
                    [v5.Tag] = "StartPage-BorderColor"
                }), 
                Page = v5.createElement("Frame", {
                    Size = UDim2.new(1, -1 * (v28 + 1), 1, 0), 
                    LayoutOrder = v53(), 
                    [v5.Tag] = "X-Middle X-Center StartPage-Background StartPage-NoBorder"
                }, {
                    if v34 > 0 then v5.createElement(v32.PageComponent, {
                        Size = UDim2.new(0, v34, 1, 0), 
                        OnPageSwap = function(v57) --[[ Line: 170 ]] --[[ Name: OnPageSwap ]]
                            -- upvalues: v19 (ref), v33 (copy), v23 (ref), v24 (ref), v3 (ref), v21 (ref)
                            v19.restartAnimation();
                            if v57 == "Experiences" then
                                v33(v23);
                                return;
                            elseif v57 == "Templates" then
                                v33(v24);
                                return;
                            else
                                if v3 and v57 == "Recents" then
                                    v33(v21);
                                end;
                                return;
                            end;
                        end
                    }) else nil
                })
            }), 
            TutorialPopup = if not (v30 and l_StartPageManager_0:getDaysSinceFirstUserLogin() <= 1) or l_StartPageManager_0:isTutorialPopupClosed() then nil else v5.createElement(v18, {
                Size = UDim2.new(1, 0, 1, 0), 
                OnClose = function() --[[ Line: 191 ]] --[[ Name: OnClose ]]
                    -- upvalues: v31 (copy), l_StartPageManager_0 (ref)
                    v31(false);
                    l_StartPageManager_0:setTutorialPopupClosed(true);
                end
            })
        })
    }) else if v1 then v5.createElement(v26.Provider, {
        value = v47
    }, {
        Wrapper = v5.createElement("Frame", {
            LayoutOrder = v53(), 
            [v5.Change.AbsoluteSize] = function(v58) --[[ Line: 205 ]]
                -- upvalues: v28 (ref), v35 (copy)
                local v59 = math.min(1458, v58.AbsoluteSize.X - (v28 + 1));
                v35(v59);
            end, 
            [v5.Tag] = "X-Fill X-Row StartPage-PageBackground"
        }, {
            Menu = v5.createElement("Frame", {
                LayoutOrder = v53(), 
                [v5.Tag] = "X-Fit X-Left X-Top X-PadS X-Transparent"
            }, {
                v5.createElement(v16, {
                    Size = UDim2.new(0, v28, 1, 0), 
                    Pages = v17, 
                    SelectedPage = v32, 
                    OnPageSwap = function(v60) --[[ Line: 220 ]] --[[ Name: OnPageSwap ]]
                        -- upvalues: v29 (copy), v13 (ref), v32 (copy), v19 (ref), v33 (copy)
                        v29:log(v13, {
                            telemetryType = "navigation", 
                            telemetrySubtype = "page", 
                            context = "menu", 
                            from = string.match(v32.TextKey, "%w+$"), 
                            to = string.match(v60.TextKey, "%w+$")
                        });
                        v19.restartAnimation();
                        v33(v60);
                    end
                })
            }), 
            Separator = v5.createElement("Frame", {
                LayoutOrder = v53(), 
                Size = UDim2.new(0, 1, 1, 0), 
                [v5.Tag] = "StartPage-BorderColor"
            }), 
            Page = v5.createElement("Frame", {
                ClipsDescendants = true, 
                LayoutOrder = v53(), 
                Size = UDim2.new(1, -1 * (v28 + 1), 1, 0), 
                [v5.Tag] = "X-Middle X-Center StartPage-Background StartPage-NoBorder"
            }, {
                Container = if v34 > 0 then v5.createElement("Frame", {
                    Size = UDim2.new(0, v34, 1, 0), 
                    [v5.Tag] = "X-Transparent"
                }, {
                    PageComponent = v5.createElement(v32.PageComponent, {
                        OnPageSwap = function(v61) --[[ Line: 256 ]] --[[ Name: OnPageSwap ]]
                            -- upvalues: v19 (ref), v33 (copy), v23 (ref), v24 (ref), v3 (ref), v21 (ref)
                            v19.restartAnimation();
                            if v61 == "Experiences" then
                                v33(v23);
                                return;
                            elseif v61 == "Templates" then
                                v33(v24);
                                return;
                            else
                                if v3 and v61 == "Recents" then
                                    v33(v21);
                                end;
                                return;
                            end;
                        end
                    })
                }) else nil
            }), 
            Tutorial = if not (v30 and l_StartPageManager_0:getDaysSinceFirstUserLogin() <= 1) or l_StartPageManager_0:isTutorialPopupClosed() then nil else v5.createElement(v18, {
                Size = UDim2.new(1, 0, 1, 0), 
                OnClose = function() --[[ Line: 276 ]] --[[ Name: OnClose ]]
                    -- upvalues: v31 (copy), l_StartPageManager_0 (ref)
                    v31(false);
                    l_StartPageManager_0:setTutorialPopupClosed(true);
                end
            })
        })
    }) else if v2 then v5.createElement(v25.Provider, {
        value = v36
    }, {
        DialogProvider = v5.createElement(v26.Provider, {
            value = v47
        }, {
            Wrapper = v5.createElement("Frame", {
                LayoutOrder = v53(), 
                [v5.Change.AbsoluteSize] = function(v62) --[[ Line: 293 ]]
                    -- upvalues: v28 (ref), v35 (copy)
                    local v63 = math.min(1458, v62.AbsoluteSize.X - (v28 + 1));
                    v35(v63);
                end, 
                [v5.Tag] = "X-Fill X-Row StartPage-PageBackground"
            }, {
                Menu = v5.createElement("Frame", {
                    LayoutOrder = v53(), 
                    [v5.Tag] = "X-Fit X-Left X-Top X-PadS X-Transparent"
                }, {
                    v5.createElement(v16, {
                        Size = UDim2.new(0, v28, 1, 0), 
                        Pages = v17, 
                        SelectedPage = v32, 
                        OnPageSwap = function(v64) --[[ Line: 309 ]] --[[ Name: OnPageSwap ]]
                            -- upvalues: v29 (copy), v13 (ref), v32 (copy), v19 (ref), v33 (copy)
                            v29:log(v13, {
                                telemetryType = "navigation", 
                                telemetrySubtype = "page", 
                                context = "menu", 
                                from = string.match(v32.TextKey, "%w+$"), 
                                to = string.match(v64.TextKey, "%w+$")
                            });
                            v19.restartAnimation();
                            v33(v64);
                        end
                    })
                }), 
                Separator = v5.createElement("Frame", {
                    LayoutOrder = v53(), 
                    Size = UDim2.new(0, 1, 1, 0), 
                    [v5.Tag] = "StartPage-BorderColor"
                }), 
                Page = v5.createElement("Frame", {
                    ClipsDescendants = true, 
                    LayoutOrder = v53(), 
                    Size = UDim2.new(1, -1 * (v28 + 1), 1, 0), 
                    [v5.Tag] = "X-Middle X-Center StartPage-Background StartPage-NoBorder"
                }, {
                    Container = if v34 > 0 then v5.createElement("Frame", {
                        Size = UDim2.new(0, v34, 1, 0), 
                        [v5.Tag] = "X-Transparent"
                    }, {
                        PageComponent = v5.createElement(v32.PageComponent, {
                            OnPageSwap = function(v65) --[[ Line: 345 ]] --[[ Name: OnPageSwap ]]
                                -- upvalues: v19 (ref), v33 (copy), v23 (ref), v24 (ref), v3 (ref), v21 (ref)
                                v19.restartAnimation();
                                if v65 == "Experiences" then
                                    v33(v23);
                                    return;
                                elseif v65 == "Templates" then
                                    v33(v24);
                                    return;
                                else
                                    if v3 and v65 == "Recents" then
                                        v33(v21);
                                    end;
                                    return;
                                end;
                            end
                        })
                    }) else nil
                }), 
                Tutorial = if not (v30 and l_StartPageManager_0:getDaysSinceFirstUserLogin() <= 1) or l_StartPageManager_0:isTutorialPopupClosed() then nil else v5.createElement(v18, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    OnClose = function() --[[ Line: 365 ]] --[[ Name: OnClose ]]
                        -- upvalues: v31 (copy), l_StartPageManager_0 (ref)
                        v31(false);
                        l_StartPageManager_0:setTutorialPopupClosed(true);
                    end
                })
            })
        })
    }) else v5.createElement(v25.Provider, {
        value = v36
    }, {
        v5.createElement(v26.Provider, {
            value = v47
        }, {
            Contents = v5.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                v5.createElement("Frame", {
                    LayoutOrder = v53(), 
                    [v5.Change.AbsoluteSize] = function(v66) --[[ Line: 385 ]]
                        -- upvalues: v28 (ref), v35 (copy)
                        local v67 = math.min(1458, v66.AbsoluteSize.X - (v28 + 1));
                        v35(v67);
                    end, 
                    [v5.Tag] = "X-Fill X-Row StartPage-PageBackground"
                }, {
                    Menu = v5.createElement("Frame", {
                        LayoutOrder = v53(), 
                        [v5.Tag] = "X-Fit X-Left X-Top X-PadS X-Transparent"
                    }, {
                        v5.createElement(v16, {
                            Size = UDim2.new(0, v28, 1, 0), 
                            Pages = v17, 
                            SelectedPage = v32, 
                            OnPageSwap = function(v68) --[[ Line: 401 ]] --[[ Name: OnPageSwap ]]
                                -- upvalues: v29 (copy), v13 (ref), v32 (copy), v19 (ref), v33 (copy)
                                v29:log(v13, {
                                    telemetryType = "navigation", 
                                    telemetrySubtype = "page", 
                                    context = "menu", 
                                    from = string.match(v32.TextKey, "%w+$"), 
                                    to = string.match(v68.TextKey, "%w+$")
                                });
                                v19.restartAnimation();
                                v33(v68);
                            end
                        })
                    }), 
                    Separator = v5.createElement("Frame", {
                        Size = UDim2.new(0, 1, 1, 0), 
                        LayoutOrder = v53(), 
                        [v5.Tag] = "StartPage-BorderColor"
                    }), 
                    Page = v5.createElement("Frame", {
                        Size = UDim2.new(1, -1 * (v28 + 1), 1, 0), 
                        LayoutOrder = v53(), 
                        [v5.Tag] = "X-Middle X-Center StartPage-Background StartPage-NoBorder"
                    }, {
                        if v34 > 0 then v5.createElement(v32.PageComponent, {
                            Size = UDim2.new(0, v34, 1, 0), 
                            OnPageSwap = function(v69) --[[ Line: 434 ]] --[[ Name: OnPageSwap ]]
                                -- upvalues: v19 (ref), v33 (copy), v23 (ref), v24 (ref), v3 (ref), v21 (ref)
                                v19.restartAnimation();
                                if v69 == "Experiences" then
                                    v33(v23);
                                    return;
                                elseif v69 == "Templates" then
                                    v33(v24);
                                    return;
                                else
                                    if v3 and v69 == "Recents" then
                                        v33(v21);
                                    end;
                                    return;
                                end;
                            end
                        }) else nil
                    })
                }), 
                if not (v30 and l_StartPageManager_0:getDaysSinceFirstUserLogin() <= 1) or l_StartPageManager_0:isTutorialPopupClosed() then nil else v5.createElement(v18, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    OnClose = function() --[[ Line: 455 ]] --[[ Name: OnClose ]]
                        -- upvalues: v31 (copy), l_StartPageManager_0 (ref)
                        v31(false);
                        l_StartPageManager_0:setTutorialPopupClosed(true);
                    end
                })
            })
        })
    });
end;