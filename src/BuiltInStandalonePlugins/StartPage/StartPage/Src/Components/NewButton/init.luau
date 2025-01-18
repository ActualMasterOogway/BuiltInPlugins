local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_counter_0 = v2.Util.counter;
local l_Image_0 = v2.UI.Image;
local l_StartPageManager_0 = require(l_script_FirstAncestor_0.Src.Util.Services).StartPageManager;
local v7 = require(l_script_FirstAncestor_0.Src.Hooks.useCursor);
local v8 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPagePlaceOpenAttributionTelemetry)();
local v9 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageNewExperienceInsteadNotFile)();
local v10 = game:DefineFastFlag("FixPSCMissingUniverseIdFromLuaStartPage", false);
local v11 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.TelemetryContext);
local v12 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.StartPageTelemetryEvent);
return function(v13) --[[ Line: 42 ]] --[[ Name: NewButton ]]
    -- upvalues: v11 (copy), l_Localization_0 (copy), l_counter_0 (copy), v7 (copy), v1 (copy), v10 (copy), l_StartPageManager_0 (copy), v8 (copy), v12 (copy), l_Image_0 (copy), v9 (copy)
    local v14 = v11:use();
    local v15 = l_Localization_0:use();
    local v16 = l_counter_0();
    local v17, v18 = v7("PointingHand");
    return v1.createElement("ImageButton", {
        Size = v13.Size, 
        Position = v13.Position, 
        [v1.Event.Activated] = function() --[[ Line: 52 ]]
            -- upvalues: v10 (ref), l_StartPageManager_0 (ref), v8 (ref), v14 (copy), v12 (ref)
            if v10 then
                l_StartPageManager_0:openPlace(95206881, 28220420, false);
            else
                l_StartPageManager_0:openPlace(95206881, 0, false);
            end;
            if v8 then
                v14:log(v12, {
                    telemetryType = "interaction", 
                    telemetrySubtype = "place_open", 
                    action = "new_file"
                });
            end;
        end, 
        [v1.Event.MouseEnter] = v17, 
        [v1.Event.MouseLeave] = v18, 
        [v1.Tag] = "X-Row X-Middle StartPage-MenuBackground StartPage-ButtonPadding StartPage-RoundedCorner8"
    }, {
        PlusIcon = v1.createElement("Frame", {
            Size = UDim2.new(0, 24, 0, 24), 
            LayoutOrder = v16(), 
            [v1.Tag] = "X-PadS X-Corner StartPage-ButtonBackgroundColor"
        }, {
            v1.createElement(l_Image_0, {
                [v1.Tag] = "StartPage-PlusIcon X-AnchorCenter"
            })
        }), 
        Text = v1.createElement("TextLabel", {
            Text = if v9 then v15:getText("Plugin", "NewExperience") else v15:getText("Plugin", "NewFile"), 
            LayoutOrder = v16(), 
            [v1.Tag] = "X-Fit X-Pad X-Transparent StartPage-TextSize StartPage-FontBold StartPage-TextColor"
        })
    });
end;