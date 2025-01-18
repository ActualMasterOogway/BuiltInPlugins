local l_Parent_0 = script.Parent.Parent.Parent;
local _ = game:GetService("HttpService");
local l_Packages_0 = l_Parent_0.Packages;
local l_Promise_0 = require(l_Packages_0.Framework).Util.Promise;
local _ = require(l_Parent_0.Core.Types.AssetQuotaTypes);
local v5 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddBuyerStatus);
local v6 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagEnableUGCForAllChecks);
local _ = require(l_Parent_0.Core.Networking.__snapshots__.HomeAudioConfiguration);
local v8 = require(l_Parent_0.Core.Types.BuyerStatus);
local v9 = require(l_Parent_0.Core.Util.FiatUtil);
local v10 = require(l_Parent_0.Core.Types.PurchaseTransactionStatus);
local v11 = {};
v11.__index = v11;
v11.new = function(v12) --[[ Line: 32 ]] --[[ Name: new ]]
    -- upvalues: v11 (copy)
    return (setmetatable({
        assetCount = v12 or 10
    }, v11));
end;
local function v14(v13) --[[ Line: 38 ]] --[[ Name: getFakeAsset ]]
    return {
        asset = {
            id = v13, 
            name = "Observation Tower Mock" .. v13, 
            duration = 0, 
            typeId = 10, 
            isEndorsed = true, 
            description = "mocked asset item", 
            createdUtc = "2018-05-10T02:28:14.227Z", 
            updatedUtc = "2018-06-10T02:28:14.24Z", 
            assetGenres = {}
        }, 
        creator = {
            id = v13, 
            name = "JUSTforTEST", 
            type = 1
        }, 
        thumbnail = {
            final = true, 
            Url = "rbxasset://textures/StudioToolbox/Animation.png", 
            retryUrl = nil, 
            userId = 0, 
            endpointType = "Avatar"
        }, 
        voting = {
            showVotes = true, 
            upVotes = 4506, 
            downVotes = 581, 
            canVote = true, 
            userVote = "", 
            hasVoted = false, 
            reasonForNotVoteable = ""
        }
    };
end;
v11.fakeAssetFactory = function(_, v16) --[[ Line: 75 ]] --[[ Name: fakeAssetFactory ]]
    -- upvalues: v14 (copy)
    return (v14(v16));
end;
local function v18(v17) --[[ Line: 79 ]] --[[ Name: getCreationsFakeAsset ]]
    return {
        assetId = v17, 
        assetType = "Models", 
        created = "2019-08-09T21:41:51.97Z", 
        creatorType = "User", 
        name = "Dummy" .. v17, 
        creatorTargetId = 1010101, 
        status = "Free", 
        description = "mocked asset item", 
        updated = "2021-05-06T19:56:54.437Z", 
        priceConfiguration = {}
    };
end;
local function _(v19) --[[ Line: 94 ]] --[[ Name: getFakeToolboxItems ]]
    return {
        id = v19, 
        itemType = "Asset"
    };
end;
v11.fakeToolboxItemFactory = function(_, v22) --[[ Line: 101 ]] --[[ Name: fakeToolboxItemFactory ]]
    return {
        id = v22, 
        itemType = "Asset"
    };
end;
local function _(v23) --[[ Line: 105 ]] --[[ Name: getFakeCreationsItems ]]
    return {
        assetId = v23, 
        name = "Dummy"
    };
end;
local function v32(v25, v26) --[[ Line: 112 ]] --[[ Name: createStringValueforVerification ]]
    for _, v28 in ipairs(game.CoreGui:GetChildren()) do
        if v28.Name == "CategoryVerification" then
            v28:Destroy();
        end;
    end;
    local v29 = Instance.new("StringValue", game.CoreGui);
    v29.Name = "CategoryVerification";
    local v30 = Instance.new("StringValue", game.CoreGui.CategoryVerification);
    v30.Value = v25;
    v30.Name = "Category";
    if v26 then
        local v31 = Instance.new("StringValue", game.CoreGui.CategoryVerification);
        v31.Value = v26;
        v31.Name = "Sort";
    end;
    return v29;
end;
v11.getAssets = function(v33, _) --[[ Line: 135 ]] --[[ Name: getAssets ]]
    -- upvalues: v14 (copy), l_Promise_0 (copy)
    local v35 = {
        responseBody = {
            TotalResults = v33.assetCount
        }
    };
    local v36 = {};
    for v37 = 1, 10 do
        v36[v37] = v14(v37);
    end;
    v35.responseBody.Results = v36;
    return l_Promise_0.resolve(v35);
end;
v11.postAssetCheckPermissions = function(_, _, _) --[[ Line: 150 ]] --[[ Name: postAssetCheckPermissions ]]
    -- upvalues: l_Promise_0 (copy)
    local v41 = {
        responseBody = {
            TotalResults = 11
        }
    };
    local v42 = {
        {
            action = "Use", 
            assetId = 7327, 
            status = "HasPermission"
        }, 
        {
            action = "Edit", 
            assetId = 7327, 
            status = "HasPermission"
        }, 
        {
            action = "GrantAssetPermissions", 
            assetId = 7327, 
            status = "HasPermission"
        }, 
        {
            action = "Use", 
            assetId = 3127, 
            status = "HasPermission"
        }, 
        {
            action = "Edit", 
            assetId = 3127, 
            status = "HasPermission"
        }, 
        {
            action = "GrantAssetPermissions", 
            assetId = 3127, 
            status = "NoPermission"
        }, 
        {
            action = "GrantAssetPermissions", 
            assetId = 2134, 
            status = "AssetNotFound"
        }, 
        {
            action = "Edit", 
            assetId = 9765, 
            status = "UnknownError"
        }, 
        {
            action = "Use", 
            assetId = 7340, 
            status = "NoPermission"
        }, 
        {
            action = "Edit", 
            assetId = 7340, 
            status = "NoPermission"
        }, 
        {
            action = "GrantAssetPermissions", 
            assetId = 7340, 
            status = "NoPermission"
        }
    };
    v41.responseBody.results = v42;
    return l_Promise_0.resolve(v41);
end;
v11.getToolboxItems = function(v43, v44) --[[ Line: 174 ]] --[[ Name: getToolboxItems ]]
    -- upvalues: v32 (copy), l_Promise_0 (copy)
    local l_categoryName_0 = v44.categoryName;
    local l_sortType_0 = v44.sortType;
    v32(l_categoryName_0, l_sortType_0);
    local v47 = {
        responseBody = {
            totalResults = v43.assetCount, 
            nextPageCursor = "nextPageCursor"
        }
    };
    local v48 = {};
    for v49 = 1, v43.assetCount do
        v48[v49] = {
            id = v49, 
            itemType = "Asset"
        };
    end;
    v47.responseBody.data = v48;
    return l_Promise_0.resolve(v47);
end;
v11.getItemDetails = function(_, v51) --[[ Line: 206 ]] --[[ Name: getItemDetails ]]
    -- upvalues: v14 (copy), l_Promise_0 (copy)
    local v52 = {};
    for _, v54 in ipairs(v51) do
        table.insert(v52, (v14(v54.id)));
    end;
    return l_Promise_0.resolve({
        responseBody = {
            data = v52
        }
    });
end;
v11.getItemDetailsAssetIds = function(_, v56) --[[ Line: 221 ]] --[[ Name: getItemDetailsAssetIds ]]
    -- upvalues: v14 (copy), l_Promise_0 (copy)
    local v57 = {};
    for _, v59 in ipairs(v56) do
        table.insert(v57, (v14(v59)));
    end;
    return l_Promise_0.resolve({
        responseBody = {
            data = v57
        }
    });
end;
v11.getDevelopAsset = function(v60, _) --[[ Line: 235 ]] --[[ Name: getDevelopAsset ]]
    -- upvalues: l_Promise_0 (copy)
    local v62 = {
        responseBody = {
            totalResults = v60.assetCount, 
            results = {}
        }
    };
    local v63 = {};
    for v64 = 1, v60.assetCount do
        v63[v64] = {
            id = v64, 
            itemType = "Asset"
        };
    end;
    v62.responseBody.results.data = v63;
    return l_Promise_0.resolve(v62);
end;
local function v68() --[[ Line: 251 ]] --[[ Name: getFakeCreations ]]
    -- upvalues: l_Promise_0 (copy)
    local v65 = {
        responseBody = {}
    };
    local v66 = {};
    for v67 = 1, 10 do
        v66[v67] = {
            assetId = v67, 
            name = "Dummy"
        };
    end;
    v65.responseBody.data = v66;
    return l_Promise_0.resolve(v65);
end;
v11.getAssetCreations = function(_, _) --[[ Line: 264 ]] --[[ Name: getAssetCreations ]]
    -- upvalues: v68 (copy)
    return v68();
end;
v11.getAssetGroupCreations = function(_, _) --[[ Line: 268 ]] --[[ Name: getAssetGroupCreations ]]
    -- upvalues: v68 (copy)
    return v68();
end;
v11.getAssetCreationDetails = function(_, v74) --[[ Line: 272 ]] --[[ Name: getAssetCreationDetails ]]
    -- upvalues: v18 (copy), l_Promise_0 (copy)
    local v75 = {};
    for v76 = 1, #v74 do
        v75[v76] = v18(v76);
    end;
    return l_Promise_0.resolve({
        responseBody = v75
    });
end;
v11.getCreatorInfo = function(_, _, _) --[[ Line: 283 ]] --[[ Name: getCreatorInfo ]]
    -- upvalues: l_Promise_0 (copy)
    local v80 = {
        responseBody = {
            id = "1010101", 
            name = "testAccount"
        }
    };
    return l_Promise_0.resolve(v80);
end;
v11.configureSales = function(_, _, _, _) --[[ Line: 293 ]] --[[ Name: configureSales ]]
    -- upvalues: l_Promise_0 (copy)
    return l_Promise_0.resolve({});
end;
v11.updateSales = function(_, _, _) --[[ Line: 297 ]] --[[ Name: updateSales ]]
    -- upvalues: l_Promise_0 (copy)
    return l_Promise_0.resolve({});
end;
v11.resolveAssets = function(_, v89, v90, v91) --[[ Line: 302 ]] --[[ Name: resolveAssets ]]
    -- upvalues: l_Promise_0 (copy)
    return l_Promise_0.resolve({
        responseBody = {
            TotalResults = v90 or #v89, 
            Results = v89, 
            nextPageCursor = v91
        }
    });
end;
v11.getVote = function(_, _, _) --[[ Line: 312 ]] --[[ Name: getVote ]]
    -- upvalues: l_Promise_0 (copy)
    local v95 = {
        userVote = true
    };
    return l_Promise_0.resolve(v95);
end;
v11.postVote = function(_, _) --[[ Line: 319 ]] --[[ Name: postVote ]]
    -- upvalues: l_Promise_0 (copy)
    return l_Promise_0.resolve({
        model = {
            HasVoted = true, 
            CanVote = true, 
            upVotes = 4507, 
            UserVote = true, 
            DownVote = 581, 
            ShowVotes = true
        }, 
        success = true, 
        message = "This is a test message"
    });
end;
v11.postUnvote = function(_, _) --[[ Line: 334 ]] --[[ Name: postUnvote ]]
    -- upvalues: l_Promise_0 (copy)
    return l_Promise_0.resolve({
        model = {
            HasVoted = false, 
            CanVote = true, 
            upVotes = 4506, 
            UserVote = "", 
            DownVote = 581, 
            ShowVotes = true
        }, 
        success = true, 
        message = "This is a test message"
    });
end;
v11.postFavorite = function(_, _, _) --[[ Line: 349 ]] --[[ Name: postFavorite ]]
    -- upvalues: l_Promise_0 (copy)
    return l_Promise_0.resolve({});
end;
v11.deleteFavorite = function(_, _, _) --[[ Line: 353 ]] --[[ Name: deleteFavorite ]]
    -- upvalues: l_Promise_0 (copy)
    return l_Promise_0.resolve({});
end;
v11.postInsertAsset = function(_, _) --[[ Line: 357 ]] --[[ Name: postInsertAsset ]]
    return true;
end;
v11.getManageableGroups = function(_) --[[ Line: 361 ]] --[[ Name: getManageableGroups ]]
    -- upvalues: l_Promise_0 (copy)
    local v109 = {
        responseBody = {
            data = {}
        }
    };
    return l_Promise_0.resolve(v109);
end;
v11.getUsers = function(_, _, _) --[[ Line: 370 ]] --[[ Name: getUsers ]]
    -- upvalues: l_Promise_0 (copy)
    return l_Promise_0.resolve({});
end;
v11.getHasEditPermissionForAsset = function(_, _, _) --[[ Line: 374 ]] --[[ Name: getHasEditPermissionForAsset ]]
    -- upvalues: l_Promise_0 (copy)
    return l_Promise_0.resolve(true);
end;
v11.getRobuxBalance = function(_, _) --[[ Line: 378 ]] --[[ Name: getRobuxBalance ]]
    -- upvalues: l_Promise_0 (copy)
    return l_Promise_0.resolve({
        responseBody = {
            robux = "16"
        }
    });
end;
v11.getFavoriteCounts = function(_, _) --[[ Line: 386 ]] --[[ Name: getFavoriteCounts ]]
    -- upvalues: l_Promise_0 (copy)
    return l_Promise_0.resolve({
        responseBody = "10"
    });
end;
v11.getFavorited = function(_, _) --[[ Line: 392 ]] --[[ Name: getFavorited ]]
    -- upvalues: l_Promise_0 (copy)
    return l_Promise_0.resolve({
        responseBody = "null"
    });
end;
v11.getMetaData = function(_) --[[ Line: 398 ]] --[[ Name: getMetaData ]]
    -- upvalues: l_Promise_0 (copy)
    return l_Promise_0.resolve({});
end;
if v6() then
    v11.getUploadPermissionStatus = function(_) --[[ Line: 403 ]] --[[ Name: getUploadPermissionStatus ]]
        -- upvalues: l_Promise_0 (copy)
        return l_Promise_0.resolve({
            responseBody = {
                deniedReason = 0, 
                isAllowed = true
            }
        });
    end;
end;
v11.getTagsMetadata = function(_) --[[ Line: 413 ]] --[[ Name: getTagsMetadata ]]
    -- upvalues: l_Promise_0 (copy)
    return l_Promise_0.resolve({});
end;
v11.uploadCatalogItem = function(_, _, _) --[[ Line: 417 ]] --[[ Name: uploadCatalogItem ]]
    -- upvalues: l_Promise_0 (copy)
    return l_Promise_0.resolve({});
end;
v11.uploadCatalogItemFormat = function(_, _, _, _, _, _, _, _) --[[ Line: 421 ]] --[[ Name: uploadCatalogItemFormat ]]
    -- upvalues: l_Promise_0 (copy)
    return l_Promise_0.resolve({});
end;
v11.getCreatorMarketplaceQuotas = function(_, _, _) --[[ Line: 425 ]] --[[ Name: getCreatorMarketplaceQuotas ]]
    -- upvalues: l_Promise_0 (copy)
    return l_Promise_0.resolve({});
end;
v11.getPublishingRequirements = function(_) --[[ Line: 432 ]] --[[ Name: getPublishingRequirements ]]
    -- upvalues: l_Promise_0 (copy)
    return l_Promise_0.resolve({});
end;
v11.getThumbnailStatus = function(_, _) --[[ Line: 436 ]] --[[ Name: getThumbnailStatus ]]
    -- upvalues: l_Promise_0 (copy)
    return l_Promise_0.resolve({
        responseBody = {
            data = {
                [1] = {
                    imageUrl = "fake_image_url", 
                    state = "Completed", 
                    targetId = 12345
                }
            }
        }
    });
end;
v11.getIsVerifiedCreator = function(_) --[[ Line: 450 ]] --[[ Name: getIsVerifiedCreator ]]
    -- upvalues: l_Promise_0 (copy)
    return l_Promise_0.resolve({
        responseBody = {
            isVerifiedCreator = true
        }
    });
end;
v11.getHomeConfiguration = function(_, v144) --[[ Line: 458 ]] --[[ Name: getHomeConfiguration ]]
    -- upvalues: l_Promise_0 (copy)
    if v144 == Enum.AssetType.Audio then
        return l_Promise_0.resolve({
            responseBody = {
                topKeywords = {}, 
                sections = {
                    [1] = {
                        displayName = "Categories", 
                        name = "categories", 
                        subcategory = {
                            name = "audio", 
                            displayName = "Audio", 
                            hidden = false, 
                            searchKeywords = "audio", 
                            queryParams = {
                                keyword = "audio", 
                                assetSubTypes = nil, 
                                creatorTargetId = nil, 
                                creatorType = nil, 
                                excludeAssetSubTypes = nil
                            }, 
                            path = {
                                [1] = "audio"
                            }, 
                            index = 0, 
                            children = {
                                music = {
                                    name = "music", 
                                    displayName = "Music", 
                                    hidden = false, 
                                    searchKeywords = "music", 
                                    queryParams = {
                                        keyword = "music", 
                                        assetSubTypes = nil, 
                                        creatorTargetId = nil, 
                                        creatorType = nil, 
                                        excludeAssetSubTypes = nil
                                    }, 
                                    path = {
                                        [1] = "audio", 
                                        [2] = "music"
                                    }, 
                                    index = 0, 
                                    children = {}, 
                                    childCount = 0
                                }, 
                                ["sound-effect"] = {
                                    name = "sound-effect", 
                                    displayName = "Sound Effect", 
                                    hidden = false, 
                                    searchKeywords = "sound-effect", 
                                    queryParams = {
                                        keyword = "sound-effect", 
                                        assetSubTypes = nil, 
                                        creatorTargetId = nil, 
                                        creatorType = nil, 
                                        excludeAssetSubTypes = nil
                                    }, 
                                    path = {
                                        [1] = "audio", 
                                        [2] = "sound-effect"
                                    }, 
                                    index = 1, 
                                    children = {}, 
                                    childCount = 0
                                }
                            }, 
                            childCount = 2
                        }
                    }
                }
            }
        });
    else
        return l_Promise_0.resolve({
            responseBody = {
                topKeywords = {}, 
                sections = {}
            }
        });
    end;
end;
v11.getUniverseInfo = function(_, _) --[[ Line: 541 ]] --[[ Name: getUniverseInfo ]]
    -- upvalues: l_Promise_0 (copy)
    return l_Promise_0.resolve({
        responseBody = {
            name = "Universe", 
            rootPlaceId = 12345
        }
    });
end;
v11.purchaseAsset = function(_, v148, v149, _) --[[ Line: 550 ]] --[[ Name: purchaseAsset ]]
    -- upvalues: l_Promise_0 (copy), v10 (copy)
    if v148 then
        return l_Promise_0.resolve({
            actualPrice = v149.expectedPrice, 
            checkoutUrl = "http://create.roblox.com", 
            purchaseTransactionStatus = v10.Success
        });
    else
        return l_Promise_0.resolve({
            responseBody = {
                purchased = true
            }
        });
    end;
end;
v11.getDefaultCreateBundleDataSharing = function(_, _) --[[ Line: 566 ]] --[[ Name: getDefaultCreateBundleDataSharing ]]
    -- upvalues: l_Promise_0 (copy)
    return l_Promise_0.resolve({
        responseBody = {
            isEligible = true, 
            configurations = {
                [1] = {
                    type = "AvatarBundles", 
                    isOptOut = false
                }
            }
        }
    });
end;
v11.postCreateBundleDataSharing = function(_, _, _) --[[ Line: 580 ]] --[[ Name: postCreateBundleDataSharing ]]
    -- upvalues: l_Promise_0 (copy)
    return l_Promise_0.resolve({
        responseCode = 200
    });
end;
if v5() then
    v11.getPurchaserStatus = function(_) --[[ Line: 587 ]] --[[ Name: getPurchaserStatus ]]
        -- upvalues: l_Promise_0 (copy), v8 (copy)
        return l_Promise_0.resolve({
            responseBody = {
                purchaserStatus = v8.Allowed
            }
        });
    end;
end;
v11.getFiatProduct = function(_, _, _) --[[ Line: 596 ]] --[[ Name: getFiatProduct ]]
    -- upvalues: l_Promise_0 (copy), v9 (copy)
    return l_Promise_0.resolve({
        responseBody = v9.getDefaultFiatProduct()
    });
end;
v11.getIsOwnedByUser = function(_, _, _) --[[ Line: 602 ]] --[[ Name: getIsOwnedByUser ]]
    -- upvalues: l_Promise_0 (copy)
    return l_Promise_0.resolve({
        responseBody = false
    });
end;
v11.getIsAssetOpenForUse = function(_, _) --[[ Line: 608 ]] --[[ Name: getIsAssetOpenForUse ]]
    return false;
end;
return v11;