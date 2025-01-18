local v0 = require(script.Parent.PermissionsPage.Permissions);
local v1 = require(script.Parent.AvatarPage.Avatar);
local v2 = require(script.Parent.BasicInfoPage.BasicInfo);
local v3 = require(script.Parent.MonetizationPage.Monetization);
local v4 = require(script.Parent.OptionsPage.Options);
local v5 = require(script.Parent.PlacesPage.Places);
local v6 = require(script.Parent.SecurityPage.Security);
local v7 = require(script.Parent.WorldPage.World);
return {
    v2, 
    v0, 
    v3, 
    v6, 
    v5, 
    require(script.Parent.LocalizationPage.Localization), 
    v1, 
    v7, 
    v4, 
    (require(script.Parent.CommunicationPage.Communication))
};