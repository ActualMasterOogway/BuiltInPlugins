local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local _ = require(l_Packages_0.Framework);
local v3 = require(l_Packages_0.Dash);
local v4 = require(l_Parent_0.Core.Util.AssetConfigConstants);
local v5 = require(l_Parent_0.Core.Util.FiatUtil);
local _ = require(l_Parent_0.Core.Types.MarketplaceFiatServiceTypes);
local v7 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxOnlyPreviewOpenUseModels);
itemsDetailsToCreationsDistributionStatus = function(v8) --[[ Line: 106 ]] --[[ Name: itemsDetailsToCreationsDistributionStatus ]]
    -- upvalues: v4 (copy), v5 (copy)
    if v8.fiatProduct then
        local l_purchasable_0 = v8.fiatProduct.purchasable;
        local l_purchasePrice_0 = v8.fiatProduct.purchasePrice;
        if not l_purchasable_0 or not l_purchasePrice_0 then
            return v4.ASSET_STATUS.OffSale;
        elseif v5.isFree(l_purchasePrice_0) then
            return v4.ASSET_STATUS.Free;
        else
            return v4.ASSET_STATUS.OnSale;
        end;
    elseif v8.product then
        if v8.product.isForSaleOrIsPublicDomain then
            if typeof(v8.product.price) == "number" and v8.product.price > 0 then
                return v4.ASSET_STATUS.OnSale;
            else
                return v4.ASSET_STATUS.Free;
            end;
        else
            return v4.ASSET_STATUS.OffSale;
        end;
    else
        return v4.ASSET_STATUS.OffSale;
    end;
end;
local v11 = {
    new = function() --[[ Line: 132 ]]
        return {};
    end
};
v11.fromItemDetailsRequest = function(v12) --[[ Line: 136 ]] --[[ Name: fromItemDetailsRequest ]]
    -- upvalues: v11 (copy), v7 (copy)
    local v13 = v11.new();
    if v12.asset then
        v13.Asset = {
            Id = v12.asset.id, 
            Name = v12.asset.name, 
            TypeId = v12.asset.typeId, 
            AssetGenres = v12.asset.assetGenres, 
            AssetSubTypes = v12.asset.assetSubTypes, 
            IsEndorsed = v12.asset.isEndorsed, 
            Description = v12.asset.description, 
            Duration = v12.asset.duration, 
            Created = v12.asset.createdUtc, 
            Updated = v12.asset.updatedUtc, 
            HasScripts = v12.asset.hasScripts, 
            CreatingUniverseId = v12.asset.creatingUniverseId, 
            Status = itemsDetailsToCreationsDistributionStatus(v12), 
            IsOpenUse = if v7() then v12.asset.isOpenUse or false else nil
        };
        if v12.asset.audioDetails then
            v13.AudioDetails = {
                Type = v12.asset.audioDetails.audioType, 
                Artist = v12.asset.audioDetails.artist, 
                MusicAlbum = v12.asset.audioDetails.musicAlbum, 
                MusicGenre = v12.asset.audioDetails.musicGenre, 
                SoundEffectCategory = v12.asset.audioDetails.soundEffectCategory, 
                SoundEffectSubcategory = v12.asset.audioDetails.soundEffectSubcategory
            };
        end;
    end;
    if v12.creator then
        v13.Creator = {
            Id = v12.creator.id, 
            Name = v12.creator.name, 
            Type = v12.creator.type, 
            IsVerifiedCreator = v12.creator.isVerifiedCreator
        };
    end;
    if v12.product then
        v13.Product = {
            ProductId = v12.product.productId, 
            Price = v12.product.price
        };
    end;
    if v12.fiatProduct then
        v13.FiatProduct = {
            PurchasePrice = v12.fiatProduct.purchasePrice, 
            Purchasable = v12.fiatProduct.purchasable
        };
    end;
    if v12.thumbnail then
        v13.Thumbnail = {
            Final = v12.thumbnail.final, 
            Url = v12.thumbnail.url, 
            RetryUrl = v12.thumbnail.retryUrl, 
            UserId = v12.thumbnail.userId, 
            EndpointType = v12.thumbnail.endpointType
        };
    end;
    if v12.voting then
        v13.Voting = {
            ShowVotes = v12.voting.showVotes, 
            UpVotes = v12.voting.upVotes, 
            DownVotes = v12.voting.downVotes, 
            VoteCount = v12.voting.voteCount, 
            UpVotePercent = v12.voting.upVotePercent, 
            CanVote = v12.voting.canVote, 
            UserVote = v12.voting.userVote, 
            HasVoted = v12.voting.hasVoted, 
            ReasonForNotVoteable = v12.voting.reasonForNotVoteable
        };
    end;
    return v13;
end;
v11.AddContextToItemDetails = function(v14, v15) --[[ Line: 218 ]] --[[ Name: AddContextToItemDetails ]]
    -- upvalues: v3 (copy)
    v14.Context = v3.join(v14.Context, v15);
    return v14;
end;
v11.fromCreationsDetails = function(v16, v17, v18, v19) --[[ Line: 223 ]]
    -- upvalues: v11 (copy)
    local v20 = v11.new();
    v20.Asset = {
        Description = v16.description, 
        Id = v16.assetId, 
        Name = v16.name, 
        TypeId = v17 and v17.Value, 
        AssetGenres = {}, 
        Status = v16.status
    };
    v20.Creator = {
        Id = v16.creatorTargetId, 
        Name = v18, 
        Type = v19
    };
    return v20;
end;
return v11;