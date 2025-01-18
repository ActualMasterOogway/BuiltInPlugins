local v0 = {
    CopySelected = "CopySelected", 
    SelectAll = "SelectAll"
};
local v1 = {
    [1] = "CopySelected", 
    [2] = "SelectAll"
};
local v2 = {
    DeleteWatch = "DeleteWatch", 
    DeleteAllWatches = "DeleteAllWatches"
};
local v3 = {
    [1] = "DeleteWatch", 
    [2] = "DeleteAllWatches"
};
local v4 = {
    EditLogpoint = "EditLogpoint", 
    EnableLogpoint = "EnableLogpoint", 
    DisableLogpoint = "DisableLogpoint", 
    DeleteLogpoint = "DeleteLogpoint"
};
local v5 = {
    EditBreakpoint = "EditBreakpoint", 
    EnableBreakpoint = "EnableBreakpoint", 
    DisableBreakpoint = "DisableBreakpoint", 
    DeleteBreakpoint = "DeleteBreakpoint"
};
local v6 = {
    GoToScript = "GoToScript"
};
local v7 = {
    [1] = "EditLogpoint", 
    [2] = "EnableLogpoint", 
    [3] = "DisableLogpoint", 
    [4] = "DeleteLogpoint", 
    [5] = "GoToScript"
};
local v8 = {
    [1] = "EditBreakpoint", 
    [2] = "EnableBreakpoint", 
    [3] = "DisableBreakpoint", 
    [4] = "DeleteBreakpoint", 
    [5] = "GoToScript"
};
local v9 = {
    simulationResumeActionV2 = "simulationResumeActionV2", 
    simulationPauseActionV2 = "simulationPauseActionV2", 
    stepOverActionV2 = "stepOverActionV2", 
    stepIntoActionV2 = "stepIntoActionV2", 
    stepOutActionV2 = "stepOutActionV2"
};
local v10 = {
    Client = "StudioGameStateType_PlayClient", 
    Server = "StudioGameStateType_PlayServer", 
    Edit = "StudioGameStateType_Edit"
};
local function v12(v11) --[[ Line: 73 ]]
    return ({
        StudioGameStateType_Edit = 0, 
        StudioGameStateType_PlayClient = 1, 
        StudioGameStateType_PlayServer = 2, 
        StudioGameStateType_Standalone = 3
    })[v11];
end;
local v13 = {
    Unknown = "Enum.DebuggerPauseReason.Unknown", 
    Requested = "Enum.DebuggerPauseReason.Requested", 
    Breakpoint = "Enum.DebuggerPauseReason.Breakpoint", 
    Exception = "Enum.DebuggerPauseReason.Exception", 
    SingleStep = "Enum.DebuggerPauseReason.SingleStep", 
    Entrypoint = "Enum.DebuggerPauseReason.Entrypoint"
};
local v14 = {
    Success = "Enum.DebuggerStatus.Success", 
    Timeout = "Enum.DebuggerStatus.Timeout", 
    ConnectionLost = "Enum.DebuggerStatus.ConnectionLost", 
    InvalidResponse = "Enum.DebuggerStatus.InvalidResponse", 
    InternalError = "Enum.DebuggerStatus.InternalError", 
    InvalidState = "Enum.DebuggerStatus.InvalidState", 
    RpcError = "Enum.DebuggerStatus.RpcError", 
    InvalidArgument = "Enum.DebuggerStatus.InvalidArgument", 
    ConnectionClosed = "Enum.DebuggerStatus.ConnectionClosed"
};
local v15 = {
    breakpointDisabled = "rbxasset://textures/Debugger/Breakpoints/" .. "breakpoint_disabled@2x.png", 
    breakpointEnabled = "rbxasset://textures/Debugger/Breakpoints/" .. "breakpoint_enabled@2x.png", 
    conditionalDisabled = "rbxasset://textures/Debugger/Breakpoints/" .. "conditional_disabled@2x.png", 
    conditionalEnabled = "rbxasset://textures/Debugger/Breakpoints/" .. "conditional_enabled@2x.png", 
    invalidBreakpoint = "rbxasset://textures/Debugger/Breakpoints/" .. "invalid_breakpoint@2x.png", 
    invalidLogpoint = "rbxasset://textures/Debugger/Breakpoints/" .. "invalid_logpoint@2x.png", 
    logpointDisabled = "rbxasset://textures/Debugger/Breakpoints/" .. "logpoint_disabled@2x.png", 
    logpointEnabled = "rbxasset://textures/Debugger/Breakpoints/" .. "logpoint_enabled@2x.png", 
    client = "rbxasset://textures/Debugger/Breakpoints/" .. "client@2x.png", 
    server = "rbxasset://textures/Debugger/Breakpoints/" .. "server@2x.png"
};
local v16 = {
    Breakpoint = "Breakpoint", 
    Logpoint = "Logpoint"
};
return {
    CallstackActionIds = v0, 
    WatchActionIds = v2, 
    LogpointActions = v4, 
    BreakpointActions = v5, 
    CommonActions = v6, 
    StepActionIds = v9, 
    HEADER_HEIGHT = 28, 
    ICON_SIZE = 16, 
    BUTTON_SIZE = 28, 
    BUTTON_PADDING = 2, 
    COLUMN_HEADER_HEIGHT = 24, 
    ROW_HEIGHT = 22, 
    DebugpointIconTable = v15, 
    SeparationToken = "_", 
    GameStateTypes = v10, 
    DebugpointType = v16, 
    DebuggerPauseReason = v13, 
    DebuggerStatus = v14, 
    GetIntForGST = v12, 
    LogpointActionsOrder = v7, 
    BreakpointActionsOrder = v8, 
    EnableKey = 2, 
    DisableKey = 3, 
    CallstackActionsOrder = v1, 
    WatchActionsOrder = v3, 
    ColumnSize = "ColumnSize", 
    Tab = "Tab", 
    ScopeFilter = "ScopeFilter", 
    ColumnFilter = "ColumnFilter", 
    ColumnSizeVariables = "ColumnSizeVariables", 
    ColumnSizeMyWatches = "ColumnSizeMyWatches", 
    WatchVariables = "WatchVariables", 
    kInvalidDebuggerConnectionId = -1, 
    DummyRowName = " ", 
    VariablesColumnFilter = "VariablesColumnFilter", 
    MyWatchesColumnFilter = "MyWatchesColumnFilter"
};