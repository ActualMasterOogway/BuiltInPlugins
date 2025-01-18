game:DefineFastFlag("FixCancellableDialogResizing", false);
return {
    getFFlagEnableStudioThumbnailController = function() --[[ Line: 3 ]] --[[ Name: getFFlagEnableStudioThumbnailController ]]
        return game:GetFastFlag("EnableStudioThumbnailController");
    end, 
    getFFlagFixCancellableDialogResizing = function() --[[ Line: 6 ]] --[[ Name: getFFlagFixCancellableDialogResizing ]]
        return game:GetFastFlag("FixCancellableDialogResizing");
    end
};