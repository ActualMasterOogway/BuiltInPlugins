local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_counter_0 = v2.Util.counter;
local l_UI_0 = v2.UI;
local l_Image_0 = l_UI_0.Image;
local l_CaptureFocus_0 = l_UI_0.CaptureFocus;
local v8 = require(l_script_FirstAncestor_0.Src.Components.CursorScope);
local v9 = require(l_script_FirstAncestor_0.Src.Hooks.useCursor);
local v10 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.TelemetryContext);
local v11 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.StartPageTelemetryEvent);
local l_StartPageManager_0 = require(l_script_FirstAncestor_0.Src.Util.Services).StartPageManager;
local v13 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageAtomicTestsFixes);
local function v20(v14) --[[ Line: 40 ]] --[[ Name: Contents ]]
    -- upvalues: v10 (copy), l_Localization_0 (copy), l_counter_0 (copy), v9 (copy), v1 (copy), l_Image_0 (copy), v11 (copy), l_StartPageManager_0 (copy)
    local v15 = v10:use();
    local v16 = l_Localization_0:use();
    local v17 = l_counter_0();
    local v18, v19 = v9("PointingHand");
    return v1.createElement("Frame", {
        Size = UDim2.new(0, 640, 0, 546), 
        ClipsDescendants = true, 
        [v1.Tag] = "StartPage-Background StartPage-RoundedCorner32"
    }, {
        CityImage = v1.createElement(l_Image_0, {
            Style = {
                Image = "rbxasset://textures/StartPage/Tour2Screenshot.png"
            }, 
            Size = UDim2.new(0, 640, 0, 257)
        }), 
        CancelButton = v1.createElement("Frame", {
            [v1.Tag] = "X-Transparent X-Fill X-Top X-Right X-PadL"
        }, {
            v1.createElement("ImageButton", {
                [v1.Event.Activated] = function() --[[ Line: 65 ]]
                    -- upvalues: v15 (copy), v11 (ref), v14 (copy)
                    v15:log(v11, {
                        telemetryType = "interaction", 
                        telemetrySubtype = "tutorial_popup", 
                        action = "close"
                    });
                    if v14.OnClose then
                        v14.OnClose();
                    end;
                end, 
                [v1.Event.MouseEnter] = v18, 
                [v1.Event.MouseLeave] = v19, 
                [v1.Tag] = "X-Transparent StartPage-CancelIcon"
            })
        }), 
        Content = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 257), 
            [v1.Tag] = "X-Center X-PopupTextBoxTextButtonColumn StartPage-Padding32 X-Transparent"
        }, {
            v1.createElement("Frame", {
                LayoutOrder = v17(), 
                [v1.Tag] = "X-Fit StartPage-PopupTextboxColumn X-Pad X-Transparent"
            }, {
                Heading = v1.createElement("TextLabel", {
                    Text = v16:getText("Plugin", "TutorialPopup.Heading"), 
                    Size = UDim2.new(0, 504, 0, 28), 
                    LayoutOrder = v17(), 
                    [v1.Tag] = "X-Transparent StartPage-TextColor StartPage-TextSizeM StartPage-FontBold"
                }), 
                Body = v1.createElement("TextLabel", {
                    Text = v16:getText("Plugin", "TutorialPopup.Body"), 
                    Size = UDim2.new(0, 504, 0, 66), 
                    TextWrapped = true, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    LayoutOrder = v17(), 
                    [v1.Tag] = "X-Center StartPage-TextColor StartPage-TextSize X-Transparent StartPage-Font"
                })
            }), 
            v1.createElement("Frame", {
                LayoutOrder = v17(), 
                [v1.Tag] = "X-Fit X-ColumnS X-Center X-Transparent"
            }, {
                TakeTour = v1.createElement("ImageButton", {
                    Size = UDim2.new(0, 115, 0, 48), 
                    BackgroundColor3 = Color3.fromHex("#3C64FA"), 
                    LayoutOrder = v17(), 
                    [v1.Event.Activated] = function() --[[ Line: 117 ]]
                        -- upvalues: v15 (copy), v11 (ref), l_StartPageManager_0 (ref)
                        v15:log(v11, {
                            telemetryType = "interaction", 
                            telemetrySubtype = "tutorial_popup", 
                            action = "start_tour"
                        });
                        l_StartPageManager_0:startTutorial();
                    end, 
                    [v1.Event.MouseEnter] = v18, 
                    [v1.Event.MouseLeave] = v19, 
                    [v1.Tag] = "X-Row X-Middle StartPage-ButtonPadding StartPage-RoundedCorner8"
                }, {
                    v1.createElement("TextLabel", {
                        Text = v16:getText("Plugin", "TutorialPopup.StartButton"), 
                        [v1.Tag] = "X-Fill X-Middle StartPage-TextSize X-Transparent StartPage-FontBold StartPage-StandardTextColor"
                    })
                }), 
                GoHome = v1.createElement("ImageButton", {
                    Size = UDim2.new(0, 115, 0, 48), 
                    LayoutOrder = v17(), 
                    [v1.Event.Activated] = function() --[[ Line: 139 ]]
                        -- upvalues: v15 (copy), v11 (ref), v14 (copy)
                        v15:log(v11, {
                            telemetryType = "interaction", 
                            telemetrySubtype = "tutorial_popup", 
                            action = "go_home"
                        });
                        if v14.OnClose then
                            v14.OnClose();
                        end;
                    end, 
                    [v1.Event.MouseEnter] = v18, 
                    [v1.Event.MouseLeave] = v19, 
                    [v1.Tag] = "X-Row X-Middle StartPage-ButtonPadding StartPage-Background StartPage-Font StartPage-RoundedCorner8"
                }, {
                    v1.createElement("TextLabel", {
                        Text = v16:getText("Plugin", "TutorialPopup.BackButton"), 
                        [v1.Tag] = "X-Fill StartPage-TextColor StartPage-TextSize X-Transparent StartPage-FontBold"
                    })
                })
            })
        })
    });
end;
return function(v21) --[[ Line: 163 ]] --[[ Name: TutorialPopup ]]
    -- upvalues: v1 (copy), v8 (copy), l_CaptureFocus_0 (copy), v13 (copy), v20 (copy)
    return v1.createElement(v8, nil, {
        v1.createElement("Frame", {
            Size = v21.Size, 
            Position = v21.Position, 
            [v1.Tag] = "X-Transparent"
        }, {
            v1.createElement(l_CaptureFocus_0, {
                Size = if v13() then nil else UDim2.new(1, 0, 1, 0), 
                OnFocusLost = v13() and function() --[[ Line: 172 ]]

                end or nil
            }, {
                DarkBackground = v1.createElement("Frame", {
                    BackgroundTransparency = 0.4, 
                    [v1.Tag] = "X-Fill StartPage-StandardDarkBackground"
                }), 
                PopupContainer = v1.createElement("Frame", {
                    [v1.Tag] = "X-Fill X-Center X-Middle X-Transparent"
                }, {
                    Popup = v1.createElement(v20, v21)
                })
            })
        })
    });
end;