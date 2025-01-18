local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_StartPageManager_0 = require(l_script_FirstAncestor_0.Src.Util.Services).StartPageManager;
local v3 = game:DefineFastFlag("StartPageTrackLinkOrigin", false);
return {
    get = function(v4) --[[ Line: 17 ]] --[[ Name: get ]]
        -- upvalues: v3 (copy), l_StartPageManager_0 (copy)
        local v5 = {
            {
                ContentId = "Momentum/Sketch", 
                ImageUrl = "rbxasset://textures/StartPage/Sketch.png", 
                Name = v4:getText("DiscoverStudioPlaceholder", "SketchSeries.Title"), 
                Description = v4:getText("DiscoverStudioPlaceholder", "SketchSeries.Desc"), 
                Link = "https://www.youtube.com/playlist?list=PLMneGxZNs3ZawdQ3Y5bjCRHM75fDJydv9"
            }, 
            {
                ContentId = "Momentum/Tutorials", 
                ImageUrl = "rbxasset://textures/StartPage/Tutorials.png", 
                Name = v4:getText("DiscoverStudioPlaceholder", "Tutorials.Title"), 
                Description = v4:getText("DiscoverStudioPlaceholder", "Tutorials.Desc"), 
                Link = v3 and "https://create.roblox.com/docs/en-us/tutorials?utm_source=studio&utm_content=start_page" or "https://create.roblox.com/docs/en-us/tutorials"
            }, 
            {
                ContentId = "Momentum/Datamodel", 
                ImageUrl = "rbxasset://textures/StartPage/Datamodel.png", 
                Name = v4:getText("DiscoverStudioPlaceholder", "Principles.Title"), 
                Description = v4:getText("DiscoverStudioPlaceholder", "Principles.Desc"), 
                Link = v3 and "https://create.roblox.com/docs/en-us/creation#experiences?utm_source=studio&utm_content=start_page" or "https://create.roblox.com/docs/en-us/creation#experiences"
            }, 
            {
                ContentId = "Momentum/Avatar", 
                ImageUrl = "rbxasset://textures/StartPage/Avatar.png", 
                Name = v4:getText("DiscoverStudioPlaceholder", "Avatar.Title"), 
                Description = v4:getText("DiscoverStudioPlaceholder", "Avatar.Desc"), 
                Link = v3 and "https://create.roblox.com/docs/avatar?utm_source=studio&utm_content=start_page" or "https://create.roblox.com/docs/avatar"
            }, 
            {
                ContentId = "Momentum/Engine", 
                ImageUrl = "rbxasset://textures/StartPage/Engine.png", 
                Name = v4:getText("DiscoverStudioPlaceholder", "Engine.Title"), 
                Description = v4:getText("DiscoverStudioPlaceholder", "Engine.Desc"), 
                Link = v3 and "https://create.roblox.com/docs/en-us/platform?utm_source=studioe&utm_content=start_page" or "https://create.roblox.com/docs/en-us/platform"
            }, 
            {
                ContentId = "Momentum/CreatorHub", 
                ImageUrl = "rbxasset://textures/StartPage/CreatorHub.png", 
                Name = v4:getText("DiscoverStudioPlaceholder", "CreatorHub.Title"), 
                Description = v4:getText("DiscoverStudioPlaceholder", "CreatorHub.Desc"), 
                Link = v3 and "https://create.roblox.com/?utm_source=studio&utm_content=start_page" or "https://create.roblox.com/"
            }
        };
        if l_StartPageManager_0:isTutorialBannerClosed() then
            table.insert(v5, {
                ContentId = "Momentum/Tour", 
                ImageUrl = "rbxasset://textures/StartPage/StudioTour.png", 
                Name = v4:getText("DiscoverStudioPlaceholder", "StudioTour.Title"), 
                Description = v4:getText("DiscoverStudioPlaceholder", "StudioTour.Desc"), 
                LaunchTutorialOnClick = true
            });
        end;
        return v5;
    end
};