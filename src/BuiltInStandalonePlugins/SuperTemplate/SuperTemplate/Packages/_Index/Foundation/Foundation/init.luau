local v0 = require(script.Utility.strict);
local v1 = require(script.Utility.Flags);
local _ = require(script.Components.Types);
local v3 = require(script.Components.TextInput);
local v4 = v0({
    Badge = require(script.Components.Badge), 
    Button = require(script.Components.Button), 
    Checkbox = require(script.Components.Checkbox), 
    Empty = require(script.Components.Empty), 
    Icon = require(script.Components.Icon), 
    IconButton = require(script.Components.IconButton), 
    Image = require(script.Components.Image), 
    InputLabel = require(script.Components.InputLabel), 
    Loading = require(script.Components.Loading), 
    Pill = require(script.Components.Pill), 
    RadioGroup = require(script.Components.RadioGroup), 
    ScrollView = require(script.Components.ScrollView), 
    Skeleton = require(script.Components.Skeleton), 
    Toggle = require(script.Components.Toggle), 
    Text = require(script.Components.Text), 
    TextInput = if v1.FoundationCompositeTextInput then require(script.Components.CompositeTextInput) else v3, 
    NumberInput = require(script.Components.NumberInput), 
    Toast = require(script.Components.Toast), 
    View = require(script.Components.View), 
    KeyLabel = require(script.Components.KeyLabel), 
    FoundationProvider = require(script.Providers.Foundation), 
    OverlayProvider = require(script.Providers.Overlay), 
    Hooks = {
        useCursor = require(script.Providers.Cursor.useCursor), 
        withCursor = require(script.Providers.Cursor.withCursor), 
        useDefaultTags = require(script.Utility.useDefaultTags), 
        usePreferences = require(script.Providers.Preferences.usePreferences), 
        useScaledValue = require(script.Utility.useScaledValue), 
        useStyleTags = require(script.Providers.Style.useStyleTags), 
        useTokens = require(script.Providers.Style.useTokens)
    }, 
    Enums = {
        BadgeSize = require(script.Enums.BadgeSize), 
        BadgeVariant = require(script.Enums.BadgeVariant), 
        ButtonSize = require(script.Enums.ButtonSize), 
        ButtonVariant = require(script.Enums.ButtonVariant), 
        CheckboxSize = require(script.Enums.CheckboxSize), 
        ControlState = require(script.Enums.ControlState), 
        CursorType = require(script.Enums.CursorType), 
        Device = require(script.Enums.Device), 
        FillBehavior = require(script.Enums.FillBehavior), 
        IconPosition = require(script.Enums.IconPosition), 
        IconSize = require(script.Enums.IconSize), 
        InputLabelSize = require(script.Enums.InputLabelSize), 
        Radius = require(script.Enums.Radius), 
        ScrollBarVisibility = require(script.Enums.ScrollBarVisibility), 
        StateLayerAffordance = require(script.Enums.StateLayerAffordance), 
        StateLayerMode = require(script.Enums.StateLayerMode), 
        Theme = require(script.Enums.Theme), 
        ToggleSize = require(script.Enums.ToggleSize)
    }, 
    Utility = {
        composeStyleVariant = require(script.Utility.composeStyleVariant), 
        indexBindable = require(script.Utility.indexBindable), 
        mockComponent = require(script.Utility.mockComponent), 
        withCommonProps = require(script.Utility.withCommonProps), 
        withDefaults = require(script.Utility.withDefaults)
    }
});
if _G.__FOUNDATION_TRACK_USAGE__ then
    local v5 = require(script.Parent.UsageTracker);
    v4 = v5.trackMemberAccess("Foundation", v4, v5.isReactComponent);
end;
if _G.__FOUNDATION_TRACE_LOG__ then
    require(script.Utility.Logger):enableTraceLog();
end;
return v4;