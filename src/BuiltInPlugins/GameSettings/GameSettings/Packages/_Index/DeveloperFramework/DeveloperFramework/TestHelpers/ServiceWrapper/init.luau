local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkMemStorageServiceMocks);
local v2 = require(script.Parent.Instances);
local v3 = require(script.Parent.isCli);
local v4 = {};
v4.__index = v4;
local function v7(v5, v6) --[[ Line: 12 ]] --[[ Name: getMockService ]]
    -- upvalues: v2 (copy), v1 (copy)
    return ({
        AnalyticsService = function() --[[ Line: 14 ]] --[[ Name: AnalyticsService ]]
            -- upvalues: v2 (ref)
            return v2.MockAnalyticsService.new();
        end, 
        AssetManagerService = function() --[[ Line: 17 ]] --[[ Name: AssetManagerService ]]
            -- upvalues: v2 (ref)
            return v2.MockAssetManagerService.new();
        end, 
        CalloutService = function() --[[ Line: 20 ]] --[[ Name: CalloutService ]]
            -- upvalues: v2 (ref)
            return v2.MockCalloutService.new();
        end, 
        ChangeHistoryService = function() --[[ Line: 23 ]] --[[ Name: ChangeHistoryService ]]
            -- upvalues: v2 (ref)
            return v2.MockChangeHistoryService.new();
        end, 
        CoreGui = function() --[[ Line: 26 ]] --[[ Name: CoreGui ]]
            -- upvalues: v2 (ref)
            return v2.MockCoreGui.new();
        end, 
        HttpService = function() --[[ Line: 29 ]] --[[ Name: HttpService ]]
            -- upvalues: v2 (ref)
            return v2.MockHttpService.new();
        end, 
        InsertService = function() --[[ Line: 32 ]] --[[ Name: InsertService ]]
            -- upvalues: v2 (ref)
            return v2.MockInsertService.new();
        end, 
        MarketplaceService = function() --[[ Line: 35 ]] --[[ Name: MarketplaceService ]]
            -- upvalues: v2 (ref)
            return v2.MockMarketplaceService.new();
        end, 
        MaterialGenerationService = function() --[[ Line: 38 ]] --[[ Name: MaterialGenerationService ]]
            -- upvalues: v2 (ref)
            return v2.MockMaterialGenerationService.new();
        end, 
        MaterialService = function() --[[ Line: 41 ]] --[[ Name: MaterialService ]]
            -- upvalues: v2 (ref), v6 (copy)
            return v2.MockMaterialService.new(v6);
        end, 
        MemStorageService = v1() and function() --[[ Line: 45 ]]
            -- upvalues: v2 (ref)
            return v2.MockMemStorageService.new();
        end or nil, 
        Selection = function() --[[ Line: 49 ]] --[[ Name: Selection ]]
            -- upvalues: v2 (ref)
            return v2.MockSelectionService.new();
        end, 
        StudioService = function() --[[ Line: 52 ]] --[[ Name: StudioService ]]
            -- upvalues: v2 (ref)
            return v2.MockStudioService.new();
        end, 
        ToastNotificationService = function() --[[ Line: 55 ]] --[[ Name: ToastNotificationService ]]
            -- upvalues: v2 (ref)
            return v2.MockToastNotificationService.new();
        end, 
        StudioDeviceEmulatorService = function() --[[ Line: 58 ]] --[[ Name: StudioDeviceEmulatorService ]]
            -- upvalues: v2 (ref)
            return v2.MockStudioDeviceEmulatorService.new();
        end
    })[v5]();
end;
v4.new = function(v8, v9) --[[ Line: 66 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy), v3 (copy), v4 (copy)
    local v10 = nil;
    local v11 = nil;
    if v9 then
        v10 = Instance.new("Folder");
        v11 = v7(v8, v10);
    end;
    return (setmetatable({
        _mock = v11, 
        _instance = if v9 then v10 else game:GetService(v8), 
        _service = if not not v9 or v3() and v8 == "AssetManagerService" then v11 else game:GetService(v8)
    }, v4));
end;
v4.destroy = function(v12) --[[ Line: 86 ]] --[[ Name: destroy ]]
    if v12._mock then
        v12._mock:Destroy();
        v12._mock = nil;
        v12._instance:Destroy();
        v12._instance = nil;
    end;
end;
v4.asInstance = function(v13) --[[ Line: 96 ]] --[[ Name: asInstance ]]
    return v13._instance;
end;
v4.asService = function(v14) --[[ Line: 100 ]] --[[ Name: asService ]]
    return v14._service;
end;
return v4;