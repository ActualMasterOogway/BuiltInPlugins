local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local v1 = require(l_Parent_0.SafeFlags);
return {
    FoundationStylingPolyfill = v1.createGetFFlag("FoundationStylingPolyfill")(), 
    FoundationCompositeTextInput = v1.createGetFFlag("FoundationCompositeTextInput2")(), 
    FoundationIconButtonPaddings = v1.createGetFFlag("FoundationIconButtonPaddings")(), 
    FoundationSkeletonDarkThemeFix = v1.createGetFFlag("FoundationSkeletonDarkThemeFix")(), 
    FoundationBadgeSimplifySizing = v1.createGetFFlag("FoundationBadgeSimplifySizing")()
};