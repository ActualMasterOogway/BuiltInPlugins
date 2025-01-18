local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local l_StudioService_0 = require(l_script_FirstAncestor_0.Src.Util.Services).StudioService;
local l_StudioUserService_0 = require(l_script_FirstAncestor_0.Src.Util.Services).StudioUserService;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v5 = require(l_Components_0.HomePage);
local v6 = require(l_Components_0.ExperiencesPage);
local v7 = require(l_Components_0.TemplatesPage);
local v8 = require(l_Components_0.ArchivePage);
local v9 = require(l_Components_0.RecentsPage);
local v10 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageAddingRecentsPage)();
local v11 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageStudioTestTemplates)() and require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageNetworkCache)() and require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageQuickLoad)();
local v12 = if v11 and l_StudioUserService_0.IsLoggedIn and l_StudioService_0:HasInternalPermission() then require(l_Components_0.TestTemplatesPage) else nil;
local v13 = {
    {
        TextKey = "PageMenu.Home", 
        PageComponent = v5, 
        Tag = "StartPage-HomeIcon"
    }, 
    {
        TextKey = "PageMenu.Experiences", 
        PageComponent = v6, 
        Tag = "StartPage-ExperiencesIcon"
    }, 
    {
        TextKey = "PageMenu.Templates", 
        PageComponent = v7, 
        Tag = "StartPage-TemplatesIcon"
    }, 
    {
        TextKey = "PageMenu.Archive", 
        PageComponent = v8, 
        Tag = "StartPage-ArchiveIcon"
    }
};
if v10 then
    table.insert(v13, 1, {
        TextKey = "PageMenu.Recents", 
        PageComponent = v9, 
        Tag = "StartPage-RecentsIcon"
    });
end;
if v11 and l_StudioUserService_0.IsLoggedIn and l_StudioService_0:HasInternalPermission() then
    table.insert(v13, {
        TextKey = "PageMenu.TestTemplates", 
        PageComponent = v12, 
        Tag = "StartPage-TestTemplatesIcon"
    });
end;
return v13;