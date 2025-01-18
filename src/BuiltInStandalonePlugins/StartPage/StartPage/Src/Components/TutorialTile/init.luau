local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageQuickLoad)();
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v2.useState;
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_counter_0 = v4.Util.counter;
local l_Localization_0 = v4.ContextServices.Localization;
local l_UI_0 = v4.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Image_0 = l_UI_0.Image;
local v10 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.TelemetryContext);
local v11 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.StartPageTelemetryEvent);
local v12 = require(l_script_FirstAncestor_0.Src.Components.Shimmer);
local l_StartPageManager_0 = require(l_script_FirstAncestor_0.Src.Util.Services).StartPageManager;
local v14 = require(l_script_FirstAncestor_0.Src.Hooks.useCursor);
return function(v15) --[[ Line: 46 ]] --[[ Name: TutorialTile ]]
    -- upvalues: v10 (copy), l_Localization_0 (copy), l_counter_0 (copy), l_useState_0 (copy), v14 (copy), v2 (copy), v1 (copy), v11 (copy), l_StartPageManager_0 (copy), l_TextLabel_0 (copy), l_Image_0 (copy), v12 (copy)
    local v16 = v10:use();
    local v17 = l_Localization_0:use();
    local v18 = l_counter_0();
    local v19, v20 = l_useState_0(nil);
    local v21, v22 = v14("PointingHand");
    local v23 = v19 and v19.X < 1262;
    return v2.createElement("Frame", {
        Position = if v1 then nil else v15.Position, 
        ClipsDescendants = true, 
        [v2.Tag] = "X-FitY X-Transparent"
    }, {
        if not not v1 or v15.HasParentLoaded then v2.createElement("Frame", {
            [v2.Tag] = "X-Transparent X-FitY"
        }, {
            Container = v2.createElement("Frame", {
                [v2.Change.AbsoluteSize] = function(v24) --[[ Line: 71 ]]
                    -- upvalues: v20 (copy)
                    v20(v24.AbsoluteSize);
                end, 
                [v2.Tag] = "X-FitY StartPage-RoundedCorner8 X-Transparent"
            }, {
                TextboxContainer = v2.createElement("Frame", {
                    Size = UDim2.new(0, 414, 0, v23 and 178 or 402), 
                    Position = UDim2.new(0, 0, 0, v23 and 402 or 0), 
                    ClipsDescendants = true, 
                    [v2.Tag] = "X-Column X-Left X-Transparent " .. (v23 and "X-Top" or "X-Middle")
                }, {
                    TakeTourText = v2.createElement("Frame", {
                        Size = UDim2.new(0, 414, 0, 88), 
                        LayoutOrder = v18(), 
                        [v2.Tag] = "X-Pad X-ColumnM X-Transparent"
                    }, {
                        Title = v2.createElement("TextLabel", {
                            Text = v17:getText("Plugin", "TutorialTile.TourTitle"), 
                            TextSize = 32, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            LayoutOrder = v18(), 
                            [v2.Tag] = "X-Fit StartPage-FontExtraBold X-Transparent StartPage-TextColor"
                        }), 
                        Description = v2.createElement("TextLabel", {
                            Text = v17:getText("Plugin", "TutorialTile.TourDesc"), 
                            TextWrapped = true, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            LayoutOrder = v18(), 
                            [v2.Tag] = "X-Fit X-Left X-Top StartPage-TextColor StartPage-Font X-Transparent StartPage-TextSize"
                        })
                    }), 
                    EmptySpace = v2.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 32), 
                        LayoutOrder = v18(), 
                        [v2.Tag] = "X-Transparent"
                    }), 
                    TakeTourButton = v2.createElement("Frame", {
                        LayoutOrder = v18(), 
                        [v2.Tag] = "X-Fit X-Pad X-Transparent"
                    }, {
                        v2.createElement("ImageButton", {
                            BackgroundColor3 = Color3.fromHex("#3C64FA"), 
                            [v2.Event.Activated] = function() --[[ Line: 125 ]]
                                -- upvalues: v16 (copy), v11 (ref), l_StartPageManager_0 (ref)
                                v16:log(v11, {
                                    telemetryType = "interaction", 
                                    telemetrySubtype = "tutorial_tile", 
                                    action = "start_tour"
                                });
                                l_StartPageManager_0:startTutorial();
                            end, 
                            [v2.Event.MouseEnter] = v21, 
                            [v2.Event.MouseLeave] = v22, 
                            [v2.Tag] = "X-Fit X-Row X-Middle StartPage-ButtonPadding StartPage-RoundedCorner8"
                        }, {
                            v2.createElement(l_TextLabel_0, {
                                Text = v17:getText("Plugin", "TutorialTile.StartButton"), 
                                Font = Enum.Font.BuilderSansBold, 
                                TextSize = 16, 
                                [v2.Tag] = "X-Fit StartPage-StandardTextColor"
                            })
                        })
                    })
                }), 
                CityImage = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Position = if v23 then UDim2.new(0, 0, 0, 0) else UDim2.new(1, -848, 0, 0), 
                    Size = UDim2.new(0, 848, 0, 402)
                }, {
                    v2.createElement(l_Image_0, {
                        Style = {
                            Image = "rbxasset://textures/StartPage/CityImages.png"
                        }, 
                        Size = UDim2.new(0, 848, 0, 402)
                    })
                })
            }), 
            CancelButton = v2.createElement("Frame", {
                Position = UDim2.new(1, -24, 0, 0), 
                [v2.Tag] = "X-Transparent X-Fill X-Pad"
            }, {
                v2.createElement("ImageButton", {
                    [v2.Event.Activated] = function() --[[ Line: 168 ]]
                        -- upvalues: v16 (copy), v11 (ref), v15 (copy)
                        v16:log(v11, {
                            telemetryType = "interaction", 
                            telemetrySubtype = "tutorial_tile", 
                            action = "close"
                        });
                        if v15.OnClose then
                            v15.OnClose();
                        end;
                    end, 
                    [v2.Event.MouseEnter] = v21, 
                    [v2.Event.MouseLeave] = v22, 
                    [v2.Tag] = "X-Transparent StartPage-CancelIcon"
                })
            })
        }) else v2.createElement(v12.Component, {
            Size = UDim2.new(1, 0, 0, 361)
        })
    });
end;