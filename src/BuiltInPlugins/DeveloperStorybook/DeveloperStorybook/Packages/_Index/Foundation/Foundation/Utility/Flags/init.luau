--!nolint ImportUnused
local Foundation = script:FindFirstAncestor("Foundation")
local Packages = Foundation.Parent
local SafeFlags = require(Packages.SafeFlags)

-- Define all flags within this Flags table
-- Example:
-- 	MyFastFlag = SafeFlags.createGetFFlag("MyFastFlag")(), <-- Make sure to call the function to get the value
return {
	FoundationStylingPolyfill = SafeFlags.createGetFFlag("FoundationStylingPolyfill")(),
	FoundationCompositeTextInput = SafeFlags.createGetFFlag("FoundationCompositeTextInput2")(),
	FoundationIconButtonPaddings = SafeFlags.createGetFFlag("FoundationIconButtonPaddings")(),
	FoundationSkeletonDarkThemeFix = SafeFlags.createGetFFlag("FoundationSkeletonDarkThemeFix")(),
	FoundationBadgeSimplifySizing = SafeFlags.createGetFFlag("FoundationBadgeSimplifySizing")(),
}
