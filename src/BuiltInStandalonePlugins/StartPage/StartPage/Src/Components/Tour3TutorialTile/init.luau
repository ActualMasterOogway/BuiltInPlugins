local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local l_TextService_0 = game:GetService("TextService");
local v2 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageQuickLoad)();
local v3 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageTour3BannerLayoutFix)();
local v4 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v4.useState;
local l_useMemo_0 = v4.useMemo;
local v7 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_counter_0 = v7.Util.counter;
local l_Localization_0 = v7.ContextServices.Localization;
local l_UI_0 = v7.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Image_0 = l_UI_0.Image;
local v13 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.TelemetryContext);
local v14 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.StartPageTelemetryEvent);
local v15 = require(l_script_FirstAncestor_0.Src.Components.Shimmer);
local l_StartPageManager_0 = require(l_script_FirstAncestor_0.Src.Util.Services).StartPageManager;
local v17 = require(l_script_FirstAncestor_0.Src.Hooks.useCursor);
local v18 = 345;
return function(v19) --[[ Line: 49 ]] --[[ Name: TutorialTile ]]
    -- upvalues: v13 (copy), l_Localization_0 (copy), l_counter_0 (copy), v3 (copy), l_useMemo_0 (copy), l_TextService_0 (copy), v18 (ref), l_useState_0 (copy), v17 (copy), v4 (copy), v2 (copy), l_Image_0 (copy), v14 (copy), l_StartPageManager_0 (copy), l_TextLabel_0 (copy), v15 (copy)
    local v20 = v13:use();
    local v21 = l_Localization_0:use();
    local v22 = l_counter_0();
    if v3 then
        v18 = math.max(l_useMemo_0(function() --[[ Line: 55 ]]
            -- upvalues: v21 (copy), l_TextService_0 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 56 ]]
                -- upvalues: v21 (ref), l_TextService_0 (ref)
                local l_GetTextBoundsParams_0 = Instance.new("GetTextBoundsParams");
                l_GetTextBoundsParams_0.Text = v21:getText("Plugin", "TutorialTile.TourTitle");
                l_GetTextBoundsParams_0.Font = Font.fromEnum(Enum.Font.BuilderSansExtraBold);
                l_GetTextBoundsParams_0.Size = 40;
                l_GetTextBoundsParams_0.Width = 1e999;
                return l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_0).X;
            end);
            if l_status_0 then
                return l_result_0;
            else
                return 345;
            end;
        end, {
            v21
        }) + 48, 345);
    end;
    local v26, v27 = l_useState_0(nil);
    local v28, v29 = v17("PointingHand");
    local v30 = v26 and v26.X < v18 + 96;
    return v4.createElement("Frame", {
        Position = if v2 then nil else v19.Position, 
        ClipsDescendants = true, 
        Size = UDim2.fromScale(1, 0), 
        [v4.Change.AbsoluteSize] = function(v31) --[[ Line: 85 ]]
            -- upvalues: v27 (copy)
            v27(v31.AbsoluteSize);
        end, 
        [v4.Tag] = "X-FitY X-Transparent"
    }, {
        if not not v2 or v19.HasParentLoaded then v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            [v4.Tag] = "X-Transparent X-FitY StartPage-PaddingY8"
        }, {
            CityImage = v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, 0, 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                ZIndex = 1, 
                Size = UDim2.new(1, v30 and -32 or 0, 0, v30 and 165.5 or 331)
            }, {
                BackgroundImage = v4.createElement(l_Image_0, {
                    Size = UDim2.fromScale(1, 1), 
                    Style = {
                        Image = "rbxasset://textures/StartPage/Tour3Screenshot.png", 
                        ScaleType = Enum.ScaleType.Crop
                    }, 
                    [v4.Tag] = "StartPage-RoundedCorner8"
                }), 
                CancelButton = v4.createElement("TextButton", {
                    ZIndex = 3, 
                    AnchorPoint = Vector2.new(1, 0), 
                    Position = UDim2.new(1, 0, 0, 0), 
                    Size = UDim2.fromOffset(44, 44), 
                    Text = "", 
                    [v4.Event.Activated] = function() --[[ Line: 123 ]]
                        -- upvalues: v20 (copy), v14 (ref), v19 (copy)
                        v20:log(v14, {
                            telemetryType = "interaction", 
                            telemetrySubtype = "tutorial_tile", 
                            action = "close"
                        });
                        if v19.OnClose then
                            v19.OnClose();
                        end;
                    end, 
                    [v4.Event.MouseEnter] = v28, 
                    [v4.Event.MouseLeave] = v29, 
                    [v4.Tag] = "X-Transparent"
                }, {
                    Icon = v4.createElement("ImageLabel", {
                        Position = UDim2.fromScale(0.5, 0.5), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        [v4.Tag] = "X-Transparent StartPage-CancelWhiteIcon"
                    })
                })
            }), 
            Container = v4.createElement("Frame", {
                ZIndex = 2, 
                Position = if v30 then UDim2.new(0, 0, 0, 173.5) else UDim2.new(0, 48, 0, 48), 
                Size = if v30 then UDim2.fromScale(1, 0) else UDim2.fromOffset(v18, 235), 
                [v4.Tag] = "X-ColumnM X-Left StartPage-RoundedCorner8 " .. (v30 and "X-Transparent X-FitY StartPage-Padding16" or "StartPage-TileBackground StartPage-Padding24") .. (v3 and " X-FitY" or "")
            }, {
                Title = v4.createElement("TextLabel", {
                    Text = v21:getText("Plugin", "TutorialTile.TourTitle"), 
                    TextSize = v30 and 30 or 40, 
                    LineHeight = v3 and 1 or nil, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    LayoutOrder = v22(), 
                    Size = UDim2.fromScale(1, 0), 
                    [v4.Tag] = "X-Fit X-Left X-Bottom StartPage-TextColor StartPage-FontExtraBold X-Transparent"
                }), 
                Description = v4.createElement("TextLabel", {
                    Text = v21:getText("Plugin", "TutorialTile.TourDesc"), 
                    TextSize = v30 and 18 or 20, 
                    Size = UDim2.new(1, -16, 0, 0), 
                    LineHeight = 1.2, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    LayoutOrder = v22(), 
                    [v4.Tag] = "X-FitY X-Left StartPage-TextColor StartPage-Font X-Transparent StartPage-PaddingY8"
                }), 
                Button = v4.createElement("ImageButton", {
                    LayoutOrder = v22(), 
                    BackgroundColor3 = Color3.fromHex("#3C64FA"), 
                    [v4.Event.Activated] = function() --[[ Line: 186 ]]
                        -- upvalues: v20 (copy), v14 (ref), l_StartPageManager_0 (ref)
                        v20:log(v14, {
                            telemetryType = "interaction", 
                            telemetrySubtype = "tutorial_tile", 
                            action = "start_tour"
                        });
                        l_StartPageManager_0:startTutorial();
                    end, 
                    [v4.Event.MouseEnter] = v28, 
                    [v4.Event.MouseLeave] = v29, 
                    [v4.Tag] = "X-Fit X-Row X-Middle StartPage-ButtonPadding StartPage-RoundedCorner8"
                }, {
                    v4.createElement(l_TextLabel_0, {
                        Text = v21:getText("Plugin", "TutorialTile.StartButton"), 
                        Font = Enum.Font.BuilderSansBold, 
                        TextSize = 16, 
                        [v4.Tag] = "X-Fit StartPage-StandardTextColor"
                    })
                })
            })
        }) else v4.createElement(v15.Component, {
            Size = UDim2.new(1, v30 and -32 or 0, 0, v30 and 165.5 or 331)
        })
    });
end;