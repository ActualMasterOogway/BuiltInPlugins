local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageQuickLoad)();
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_counter_0 = v3.Util.counter;
local l_Localization_0 = v3.ContextServices.Localization;
local l_Image_0 = v3.UI.Image;
local l_StartPageManager_0 = require(l_script_FirstAncestor_0.Src.Util.Services).StartPageManager;
local v8 = require(l_script_FirstAncestor_0.Src.Hooks.useCursor);
local v9 = game:DefineFastFlag("FixPSCMissingUniverseIdFromLuaStartPage", false);
return function(v10) --[[ Line: 40 ]] --[[ Name: NoResultsFoundPage ]]
    -- upvalues: l_Localization_0 (copy), l_counter_0 (copy), v8 (copy), v2 (copy), v1 (copy), l_Image_0 (copy), v9 (copy), l_StartPageManager_0 (copy)
    local v11 = l_Localization_0:use();
    local v12 = l_counter_0();
    local v13, v14 = v8("PointingHand");
    return v2.createElement("Frame", {
        Position = if v1 then nil else v10.Position, 
        Size = v10.Size, 
        [v2.Tag] = "X-Center X-Middle X-Transparent X-Column"
    }, {
        NoDisplayImage = v2.createElement("Frame", {
            LayoutOrder = v12(), 
            [v2.Tag] = "X-FitY X-Center X-Middle X-Transparent"
        }, {
            Image = v2.createElement(l_Image_0, {
                [v2.Tag] = "StartPage-NoExperiences"
            })
        }), 
        EmptySpace = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 32), 
            LayoutOrder = v12(), 
            [v2.Tag] = "X-Transparent"
        }), 
        Title = v2.createElement("TextLabel", {
            Text = v10.Title, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            LayoutOrder = v12(), 
            [v2.Tag] = "X-Fit StartPage-Font StartPage-TextSize X-Transparent StartPage-TextColor"
        }), 
        EmptySpace2 = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 16), 
            LayoutOrder = v12(), 
            [v2.Tag] = "X-Transparent"
        }), 
        Button = v2.createElement("TextButton", {
            Text = v11:getText("Plugin", "CreateANewExperience"), 
            LayoutOrder = v12(), 
            [v2.Event.Activated] = function() --[[ Line: 83 ]]
                -- upvalues: v9 (ref), l_StartPageManager_0 (ref)
                if v9 then
                    l_StartPageManager_0:openPlace(95206881, 28220420, false);
                    return;
                else
                    l_StartPageManager_0:openPlace(95206881, 0, false);
                    return;
                end;
            end, 
            [v2.Event.MouseEnter] = v13, 
            [v2.Event.MouseLeave] = v14, 
            [v2.Tag] = "X-Fit X-Middle StartPage-ButtonBackgroundColor StartPage-FontBold StartPage-TextSize StartPage-ButtonPadding StartPage-RoundedCorner8 StartPage-StandardTextColor"
        })
    });
end;