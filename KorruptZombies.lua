local ReGui = loadstring(game:HttpGet("https://raw.githubusercontent.com/myethg/Dear-ReGui/a597754289462abb2697646cbd28b802f19c6dc5/ReGui.lua"))()

local InsertService = cloneref(game:GetService("InsertService"))

ReGui:Init({
    Prefabs = InsertService:LoadLocalAsset("rbxassetid://91788667330406")
})

ReGui:DefineTheme("RayTeakStyle", {
    WindowPadding = UDim.new(0, 15),
    WindowRounding = 5.0,
    FramePadding = UDim.new(0, 5),
    FrameRounding = 4.0,
    ItemSpacing = UDim.new(0, 12),
    ItemInnerSpacing = UDim.new(0, 8),
    IndentSpacing = 25.0,
    ScrollbarSize = 15.0,
    ScrollbarRounding = 9.0,
    GrabMinSize = 5.0,
    GrabRounding = 3.0,

    TitleAlign = Enum.TextXAlignment.Left,

    Text = Color3.fromRGB(204, 204, 212),
    TextDisabled = Color3.fromRGB(61, 59, 74),

    WindowBg = Color3.fromRGB(15, 13, 18),
    ChildWindowBg = Color3.fromRGB(18, 18, 23),
    PopupBg = Color3.fromRGB(18, 18, 23),

    Border = Color3.fromRGB(204, 204, 212),
    BorderShadow = Color3.fromRGB(235, 232, 224),

    FrameBg = Color3.fromRGB(26, 23, 31),
    FrameBgHovered = Color3.fromRGB(61, 59, 74),
    FrameBgActive = Color3.fromRGB(143, 143, 148),

    TitleBarBg = Color3.fromRGB(26, 23, 31),
    TitleBarBgActive = Color3.fromRGB(18, 18, 23),
    MenuBarBg = Color3.fromRGB(26, 23, 31),

    ScrollbarBg = Color3.fromRGB(26, 23, 31),
    ScrollbarGrab = Color3.fromRGB(204, 204, 212),
    ScrollbarGrabHovered = Color3.fromRGB(143, 143, 148),
    ScrollbarGrabActive = Color3.fromRGB(15, 13, 18),

    CheckMark = Color3.fromRGB(204, 204, 212),

    SliderGrab = Color3.fromRGB(204, 204, 212),
    SliderGrabActive = Color3.fromRGB(15, 13, 18),

    ButtonsBg = Color3.fromRGB(26, 23, 31),
    ButtonsBgHovered = Color3.fromRGB(61, 59, 74),
    ButtonsBgActive = Color3.fromRGB(143, 143, 148),
    ButtonsText = Color3.fromRGB(204, 204, 212),

    HeaderBg = Color3.fromRGB(26, 23, 31),
    HeaderHovered = Color3.fromRGB(143, 143, 148),
    HeaderActive = Color3.fromRGB(15, 13, 18),

    ResizeGrab = Color3.fromRGB(0, 0, 0),
    ResizeGrabHovered = Color3.fromRGB(143, 143, 148),
    ResizeGrabActive = Color3.fromRGB(15, 13, 18),

    CloseButton = Color3.fromRGB(102, 99, 97),
    CloseButtonHovered = Color3.fromRGB(102, 99, 97),
    CloseButtonActive = Color3.fromRGB(102, 99, 97),

    PlotLines = Color3.fromRGB(102, 99, 97),
    PlotLinesHovered = Color3.fromRGB(64, 255, 0),
    PlotHistogram = Color3.fromRGB(102, 99, 97),
    PlotHistogramHovered = Color3.fromRGB(64, 255, 0),

    TextSelectedBg = Color3.fromRGB(64, 255, 0),

    ModalWindowDimBg = Color3.fromRGB(255, 250, 242),
    ModalWindowDimBgTransparency = 0.73,

    RadioButtonBg = Color3.fromRGB(26, 23, 31),
    RadioButtonHoveredBg = Color3.fromRGB(61, 59, 74),
    RadioButtonActiveBg = Color3.fromRGB(143, 143, 148),
    RadioButtonMark = Color3.fromRGB(204, 204, 212),
    RadioButtonMarkHovered = Color3.fromRGB(204, 204, 212),

    CollapsingHeaderBg = Color3.fromRGB(26, 23, 31),
    CollapsingHeaderText = Color3.fromRGB(204, 204, 212),
    CollapsingHeaderArrow = Color3.fromRGB(204, 204, 212),

    SeparatorColor = Color3.fromRGB(204, 204, 212),
    SeparatorTextColor = Color3.fromRGB(204, 204, 212),

    TooltipBg = Color3.fromRGB(18, 18, 23),
    TooltipBorder = Color3.fromRGB(204, 204, 212),
})

pcall(function()
    ReGui:SetTheme("RayTeakStyle")
end)

local MainWindow = ReGui:Window({
    Title = "Korrupt Zombies Menu",
    Size = UDim2.new(0, 700, 0, 550),
    NoScroll = true,
    NoResize = true,
    NoCollapse = false,
    NoClose = false,
    CornerRadius = UDim.new(0, 5),
    Theme = "RayTeakStyle",
})

MainWindow:Center()

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local ZombiesFolder = workspace:WaitForChild("Zombies")

local Content = MainWindow:ScrollingCanvas({
    Fill = true,
    UiPadding = UDim.new(0, 0)
})

local CombatSection = Content:CollapsingHeader({
    Title = "Combat",
    DefaultOpen = true,
    TextColor3 = Color3.fromRGB(204, 204, 212),
    BackgroundColor3 = Color3.fromRGB(26, 23, 31),
})

local AimingNode = CombatSection:TreeNode({
    Title = "Aiming Utility",
    DefaultOpen = true,
    TextColor3 = Color3.fromRGB(204, 204, 212),
})

local AimingSettings = {
    Enabled = true,
    FOV = 90,
    Sensitivity = 1,
    Highlight = false,
    LockPart = "HumanoidRootPart",
    VisibleCheck = true,
    ToggleMode = false,
    ToggleKey = Enum.KeyCode.E,
    FOVColor = Color3.fromRGB(255, 128, 128),
    ClosestPriority = false,
    AutoShoot = true,
    AutoShootMode = "Click",
    ClickInterval = 0.08,
    MaxClickBurst = nil
}

local FOVring = Drawing.new("Circle")
FOVring.Visible = true
FOVring.Thickness = 1
FOVring.Transparency = 0.8
FOVring.Color = AimingSettings.FOVColor
FOVring.Position = Camera.ViewportSize / 2
FOVring.Radius = AimingSettings.FOV

local currentTarget = nil
local toggleState = false
local debounce = false
local autoShooting = false
local clickTask = nil

local function safeMousePress()
    pcall(function()
        if typeof(mouse1press) == "function" then
            mouse1press()
        elseif typeof(mouse1_down) == "function" then
            mouse1_down()
        end
    end)
end

local function safeMouseRelease()
    pcall(function()
        if typeof(mouse1release) == "function" then
            mouse1release()
        elseif typeof(mouse1_up) == "function" then
            mouse1_up()
        end
    end)
end

local function isVisible(targetPart)
    if not AimingSettings.VisibleCheck then return true end
    if not targetPart or not targetPart.Parent then return false end
    local origin = Camera.CFrame.Position
    local direction = targetPart.Position - origin
    local distance = direction.Magnitude
    if distance <= 0 then return true end

    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Blacklist
    params.FilterDescendantsInstances = { LocalPlayer.Character, Camera }

    local result = workspace:Raycast(origin, direction.Unit * distance, params)
    if not result then return true end
    local hitInst = result.Instance
    return hitInst and hitInst:IsDescendantOf(targetPart.Parent)
end

local function highlightTarget(model)
    if not AimingSettings.Highlight or not model then return end
    if not model:FindFirstChildOfClass("Highlight") then
        local hl = Instance.new("Highlight")
        hl.Adornee = model
        hl.FillColor = Color3.fromRGB(255, 128, 128)
        hl.OutlineColor = Color3.fromRGB(255, 0, 0)
        hl.Parent = model
    end
end

local function removeHighlight(model)
    if AimingSettings.Highlight and model then
        local hl = model:FindFirstChildOfClass("Highlight")
        if hl then hl:Destroy() end
    end
end

local function getClosestZombie(cframe)
    local screenCenter = Camera.ViewportSize / 2
    local closest, closestMag = nil, math.huge
    for _, zombie in ipairs(ZombiesFolder:GetChildren()) do
        local targetPart = zombie:FindFirstChild(AimingSettings.LockPart)
        if targetPart then
            local screenPoint, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
            if onScreen and isVisible(targetPart) then
                local dist = (Vector2.new(screenPoint.X, screenPoint.Y) - screenCenter).Magnitude
                if dist < AimingSettings.FOV and dist < closestMag then
                    closest = zombie
                    closestMag = dist
                end
            end
        end
    end
    return closest
end

local function getClosestZombieToPlayer()
    local playerChar = LocalPlayer.Character
    if not playerChar or not playerChar:FindFirstChild("HumanoidRootPart") then return nil end
    local playerPos = playerChar.HumanoidRootPart.Position
    local closest, closestDist = nil, math.huge
    for _, zombie in ipairs(ZombiesFolder:GetChildren()) do
        local targetPart = zombie:FindFirstChild(AimingSettings.LockPart)
        if targetPart then
            local distance = (targetPart.Position - playerPos).Magnitude
            if distance < closestDist and isVisible(targetPart) then
                closest = zombie
                closestDist = distance
            end
        end
    end
    return closest
end

local function handleToggle()
    if debounce then return end
    debounce = true
    toggleState = not toggleState
    task.wait(0.3)
    debounce = false
end

local function stopAutoShooting()
    if clickTask and type(clickTask) == "thread" then
        autoShooting = false
        clickTask = nil
    end
    if autoShooting then
        safeMouseRelease()
        autoShooting = false
    end
end

local function getHumanoidFromModel(model)
    if not model then return nil end
    return model:FindFirstChildOfClass("Humanoid")
end

local function startAutoShootLoop(targetModel)
    if clickTask or not targetModel then return end

    local humanoid = getHumanoidFromModel(targetModel)
    local function isTargetAliveAndValid()
        if not targetModel or not targetModel.Parent then return false end
        local lockPart = targetModel:FindFirstChild(AimingSettings.LockPart)
        if not lockPart then return false end
        if not isVisible(lockPart) then return false end
        if humanoid and humanoid.Health and humanoid.Health <= 0 then return false end
        if not AimingSettings.AutoShoot then return false end
        if AimingSettings.ToggleMode then
            if not toggleState then return false end
        else
            if not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then return false end
        end
        return true
    end

    if AimingSettings.AutoShootMode == "Hold" then
        autoShooting = true
        safeMousePress()
        clickTask = coroutine.create(function()
            while isTargetAliveAndValid() do task.wait(0.05) end
            safeMouseRelease()
            autoShooting = false
            clickTask = nil
        end)
        coroutine.resume(clickTask)
    else
        autoShooting = true
        clickTask = coroutine.create(function()
            while isTargetAliveAndValid() do
                local burst = AimingSettings.MaxClickBurst or math.huge
                local count = 0
                while count < burst and isTargetAliveAndValid() do
                    safeMousePress()
                    task.wait(math.clamp(AimingSettings.ClickInterval * 0.25, 0.01, 0.05))
                    safeMouseRelease()
                    count += 1
                    task.wait(AimingSettings.ClickInterval)
                end
                task.wait(0)
            end
            autoShooting = false
            clickTask = nil
        end)
        coroutine.resume(clickTask)
    end
end

local function updateFOVRing()
    FOVring.Radius = AimingSettings.FOV
    FOVring.Color = AimingSettings.FOVColor
    FOVring.Position = Camera.ViewportSize / 2
end

RunService.RenderStepped:Connect(function()
    if not AimingSettings.Enabled then
        stopAutoShooting()
        return
    end

    updateFOVRing()

    if AimingSettings.ToggleMode then
        if UserInputService:IsKeyDown(AimingSettings.ToggleKey) then
            handleToggle()
        end
    else
        toggleState = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
    end

    if toggleState then
        if not currentTarget or not currentTarget:FindFirstChild(AimingSettings.LockPart) then
            if currentTarget then removeHighlight(currentTarget) end
            if AimingSettings.ClosestPriority then
                currentTarget = getClosestZombieToPlayer()
            else
                currentTarget = getClosestZombie(Camera.CFrame)
            end
            highlightTarget(currentTarget)
        end

        if currentTarget and currentTarget:FindFirstChild(AimingSettings.LockPart) then
            local targetPart = currentTarget[AimingSettings.LockPart]
            if isVisible(targetPart) then
                Camera.CFrame = Camera.CFrame:Lerp(
                    CFrame.new(Camera.CFrame.Position, targetPart.Position),
                    AimingSettings.Sensitivity
                )
                FOVring.Color = Color3.fromRGB(0, 255, 0)
            else
                FOVring.Color = AimingSettings.FOVColor
            end
        else
            FOVring.Color = AimingSettings.FOVColor
        end

        if AimingSettings.AutoShoot and AimingSettings.VisibleCheck then
            if currentTarget and currentTarget:FindFirstChild(AimingSettings.LockPart)
                and isVisible(currentTarget[AimingSettings.LockPart]) then
                if not clickTask then
                    startAutoShootLoop(currentTarget)
                end
            else
                stopAutoShooting()
            end
        else
            stopAutoShooting()
        end
    else
        if currentTarget then removeHighlight(currentTarget) end
        currentTarget = nil
        FOVring.Color = AimingSettings.FOVColor
        stopAutoShooting()
    end
end)

AimingNode:Checkbox({
    Label = "Enabled",
    Value = true,
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        AimingSettings.Enabled = Value
        if not Value then
            stopAutoShooting()
        end
    end
})

AimingNode:Checkbox({
    Label = "Highlight Target",
    Value = false,
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        AimingSettings.Highlight = Value
    end
})

local LockPartRow = AimingNode:Row()
LockPartRow:Label({
    Text = "Lock Part:",
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Size = UDim2.new(0.4, 0, 0, 0),
})
LockPartRow:Combo({
    Selected = "HumanoidRootPart",
    Items = {"Head", "HumanoidRootPart"},
    TextColor3 = Color3.fromRGB(204, 204, 212),
    BackgroundColor3 = Color3.fromRGB(26, 23, 31),
    Callback = function(_, Value)
        AimingSettings.LockPart = Value
    end
})

AimingNode:Checkbox({
    Label = "Visible Check",
    Value = true,
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        AimingSettings.VisibleCheck = Value
        if not Value and AimingSettings.AutoShoot then
            stopAutoShooting()
        end
    end
})

AimingNode:Checkbox({
    Label = "Toggle Mode",
    Value = false,
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        AimingSettings.ToggleMode = Value
    end
})

local KeybindRow = AimingNode:Row()
KeybindRow:Label({
    Text = "Aim Key:",
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Size = UDim2.new(0.4, 0, 0, 0),
})
KeybindRow:Combo({
    Selected = "E",
    Items = {"E", "Q", "F", "G", "R", "T", "Y", "X", "C", "V", "B"},
    TextColor3 = Color3.fromRGB(204, 204, 212),
    BackgroundColor3 = Color3.fromRGB(26, 23, 31),
    Callback = function(_, Value)
        local keyMap = {
            E = Enum.KeyCode.E,
            Q = Enum.KeyCode.Q,
            F = Enum.KeyCode.F,
            G = Enum.KeyCode.G,
            R = Enum.KeyCode.R,
            T = Enum.KeyCode.T,
            Y = Enum.KeyCode.Y,
            X = Enum.KeyCode.X,
            C = Enum.KeyCode.C,
            V = Enum.KeyCode.V,
            B = Enum.KeyCode.B,
        }
        AimingSettings.ToggleKey = keyMap[Value] or Enum.KeyCode.E
    end
})

AimingNode:SliderInt({
    Label = "FOV Size",
    Value = 90,
    Minimum = 0,
    Maximum = 1000,
    Format = "%d px",
    TextColor3 = Color3.fromRGB(204, 204, 212),
    SliderGrabColor = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        AimingSettings.FOV = Value
        updateFOVRing()
    end
})

AimingNode:SliderFloat({
    Label = "Sensitivity",
    Value = 1,
    Minimum = 0.001,
    Maximum = 1,
    Format = "%.3f",
    TextColor3 = Color3.fromRGB(204, 204, 212),
    SliderGrabColor = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        AimingSettings.Sensitivity = Value
    end
})

AimingNode:Checkbox({
    Label = "Show FOV Circle",
    Value = true,
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        FOVring.Visible = Value
    end
})

local ColorRow = AimingNode:Row()
ColorRow:Label({
    Text = "FOV Color:",
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Size = UDim2.new(0.4, 0, 0, 0),
})
ColorRow:InputColor3({
    Value = Color3.fromRGB(255, 128, 128),
    Label = "",
    Callback = function(_, Value)
        AimingSettings.FOVColor = Value
        FOVring.Color = Value
    end
})

AimingNode:Checkbox({
    Label = "Closest to LocalPlayer [PRIORITY]",
    Value = false,
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        AimingSettings.ClosestPriority = Value
    end
})

AimingNode:Checkbox({
    Label = "Auto Shoot",
    Value = false,
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        if Value and not AimingSettings.VisibleCheck then
            AimingSettings.AutoShoot = false
            return
        end
        AimingSettings.AutoShoot = Value
        if not Value then
            if autoShooting then
                safeMouseRelease()
                autoShooting = false
            end
        end
    end
})

local VisualsNode = CombatSection:TreeNode({
    Title = "Visualization",
    DefaultOpen = true,
    TextColor3 = Color3.fromRGB(204, 204, 212),
})

local visualizeEnabled = false
local visualizeMode = "default"
local refreshInterval = 2
local displayNames = false
local displayDistance = 100
_G.color_chams = _G.color_chams or Color3.fromRGB(0, 255, 120)
_G.cham_priority = _G.cham_priority or {"zombies"}

local ChamColorRow = VisualsNode:Row()
ChamColorRow:Label({
    Text = "Cham Color:",
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Size = UDim2.new(0.4, 0, 0, 0),
})
ChamColorRow:InputColor3({
    Value = _G.color_chams,
    Label = "",
    Callback = function(_, Value)
        _G.color_chams = Value
    end
})

VisualsNode:Checkbox({
    Label = "Enable Cham Visualization",
    Value = false,
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        visualizeEnabled = Value
    end
})

local PriorityRow = VisualsNode:Row()
PriorityRow:Label({
    Text = "Cham Priority:",
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Size = UDim2.new(0.4, 0, 0, 0),
})
PriorityRow:Combo({
    Selected = "zombies",
    Items = {"zombies"},
    TextColor3 = Color3.fromRGB(204, 204, 212),
    BackgroundColor3 = Color3.fromRGB(26, 23, 31),
    Callback = function(_, Value)
        _G.cham_priority = {Value}
    end
})

local StyleRow = VisualsNode:Row()
StyleRow:Label({
    Text = "Cham Style:",
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Size = UDim2.new(0.4, 0, 0, 0),
})
StyleRow:Combo({
    Selected = "default",
    Items = {"default", "cheat"},
    TextColor3 = Color3.fromRGB(204, 204, 212),
    BackgroundColor3 = Color3.fromRGB(26, 23, 31),
    Callback = function(_, Value)
        visualizeMode = Value
    end
})

VisualsNode:SliderFloat({
    Label = "Refresh Interval",
    Value = 2,
    Minimum = 0.1,
    Maximum = 10,
    Format = "%.1f",
    TextColor3 = Color3.fromRGB(204, 204, 212),
    SliderGrabColor = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        refreshInterval = Value
    end
})

VisualsNode:Checkbox({
    Label = "Display Names",
    Value = false,
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        displayNames = Value
    end
})

VisualsNode:SliderInt({
    Label = "Display Distance (studs)",
    Value = 100,
    Minimum = 10,
    Maximum = 1000,
    Format = "%d",
    TextColor3 = Color3.fromRGB(204, 204, 212),
    SliderGrabColor = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        displayDistance = Value
    end
})

local folders = {
    zombies = workspace:WaitForChild("Zombies", 5)
}

local ChamFolder = Instance.new("Folder")
ChamFolder.Name = "ChamVisuals"
ChamFolder.Parent = game.CoreGui

local Highlights, Labels = {}, {}

local function applyCham(obj)
    if Highlights[obj] then return end
    local h = Instance.new("Highlight")
    h.Adornee = obj
    h.Parent = ChamFolder
    Highlights[obj] = h
    if displayNames and obj:IsA("Model") then
        local head = obj:FindFirstChildWhichIsA("BasePart") or obj:FindFirstChild("HumanoidRootPart")
        if head then
            local gui = Instance.new("BillboardGui")
            gui.Size = UDim2.new(0, 200, 0, 50)
            gui.AlwaysOnTop = true
            gui.Name = "ChamLabel"
            gui.MaxDistance = displayDistance
            gui.Adornee = head
            local txt = Instance.new("TextLabel", gui)
            txt.Size = UDim2.new(1, 0, 1, 0)
            txt.BackgroundTransparency = 1
            txt.TextScaled = true
            txt.TextColor3 = _G.color_chams
            txt.Text = obj.Name
            gui.Parent = ChamFolder
            Labels[obj] = gui
        end
    end
end

local function removeCham(obj)
    if Highlights[obj] then Highlights[obj]:Destroy() Highlights[obj] = nil end
    if Labels[obj] then Labels[obj]:Destroy() Labels[obj] = nil end
end

local function refreshChams()
    if not visualizeEnabled then
        for m in pairs(Highlights) do removeCham(m) end
        return
    end
    for m in pairs(Highlights) do
        if not m.Parent then removeCham(m) end
    end
    local chamList = {}
    if type(_G.cham_priority) == "table" then
        for k, v in pairs(_G.cham_priority) do
            if type(k) == "string" and v then
                table.insert(chamList, k)
            elseif type(v) == "string" then
                table.insert(chamList, v)
            end
        end
    else
        chamList = {"zombies"}
    end
    for _, cat in ipairs(chamList) do
        local folder = folders[cat]
        if folder then
            for _, obj in ipairs(folder:GetChildren()) do
                if obj:IsA("Model") or obj:IsA("BasePart") then
                    applyCham(obj)
                end
            end
        end
    end
    for obj, h in pairs(Highlights) do
        if h and h.Parent then
            h.FillColor = _G.color_chams
            if visualizeMode == "cheat" then
                h.FillTransparency = 0.3
                h.OutlineTransparency = 0
                h.OutlineColor = Color3.fromRGB(255,255,255)
            else
                h.FillTransparency = 0.7
                h.OutlineTransparency = 0.3
                h.OutlineColor = Color3.fromRGB(0,0,0)
            end
        end
    end
end

task.spawn(function()
    while task.wait(refreshInterval) do refreshChams() end
end)

VisualsNode:Checkbox({
    Label = "Day Time",
    Value = false,
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        if Value then
            game.Lighting.ClockTime = 14
            game.Lighting.Brightness = 2
            game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
            game.Lighting.Ambient = Color3.fromRGB(200, 200, 200)
        end
    end
})

VisualsNode:Checkbox({
    Label = "Night Time",
    Value = false,
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        if Value then
            game.Lighting.ClockTime = 0
            game.Lighting.Brightness = 1
            game.Lighting.OutdoorAmbient = Color3.fromRGB(60, 60, 80)
            game.Lighting.Ambient = Color3.fromRGB(40, 40, 60)
        end
    end
})

local ambientEnabled = false

local AmbientColorRow = VisualsNode:Row()
AmbientColorRow:Label({
    Text = "Ambient Color:",
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Size = UDim2.new(0.4, 0, 0, 0),
})
AmbientColorRow:InputColor3({
    Value = _G.color_chams,
    Label = "",
    Callback = function(_, Value)
        if ambientEnabled then
            game.Lighting.Ambient = Value
        end
    end
})

VisualsNode:Checkbox({
    Label = "Enable Ambient Modification",
    Value = false,
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        ambientEnabled = Value
    end
})

_G.color_bounding_box = _G.color_bounding_box or Color3.fromRGB(255, 255, 255)
_G.color_skeleton = _G.color_skeleton or Color3.fromRGB(0, 255, 0)

local renderBoundingBox = false
local renderHealthBar = false
local renderSkeleton = false
local enableOutlines = false

local BBoxRow = VisualsNode:Row()
BBoxRow:Label({
    Text = "Box Color:",
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Size = UDim2.new(0.4, 0, 0, 0),
})
BBoxRow:InputColor3({
    Value = _G.color_bounding_box,
    Label = "",
    Callback = function(_, Value)
        _G.color_bounding_box = Value
    end
})

VisualsNode:Checkbox({
    Label = "Render Bounding Box [Zombie]",
    Value = false,
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        renderBoundingBox = Value
    end
})

VisualsNode:Checkbox({
    Label = "Render Health Bar [Zombie]",
    Value = false,
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        renderHealthBar = Value
    end
})

local SkeletonRow = VisualsNode:Row()
SkeletonRow:Label({
    Text = "Skeleton Color:",
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Size = UDim2.new(0.4, 0, 0, 0),
})
SkeletonRow:InputColor3({
    Value = _G.color_skeleton,
    Label = "",
    Callback = function(_, Value)
        _G.color_skeleton = Value
    end
})

VisualsNode:Checkbox({
    Label = "Render Skeleton [Zombie]",
    Value = false,
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        renderSkeleton = Value
    end
})

VisualsNode:Checkbox({
    Label = "Enable Outlines",
    Value = false,
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        enableOutlines = Value
    end
})

local DrawCache = {}
local function newDrawing(type, props)
    local d = Drawing.new(type)
    for k, v in pairs(props) do d[k] = v end
    return d
end

local function clearCacheFor(model)
    local cache = DrawCache[model]
    if not cache then return end
    for _, obj in pairs(cache) do
        if typeof(obj) == "table" then
            for _, l in pairs(obj) do if l.Remove then l:Remove() end end
        elseif obj.Remove then
            obj:Remove()
        end
    end
    DrawCache[model] = nil
end

local function ensureCache(model)
    if DrawCache[model] then return DrawCache[model] end
    local cache = {
        box = newDrawing("Square", {Filled = false, Thickness = 1, Visible = false}),
        boxOutline = newDrawing("Square", {Filled = false, Thickness = 3, Visible = false, Color = Color3.new(0,0,0)}),
        barOutline = newDrawing("Square", {Filled = true, Visible = false}),
        barFill = newDrawing("Square", {Filled = true, Visible = false}),
        skeleton = {},
        skeletonOutline = {}
    }
    DrawCache[model] = cache
    return cache
end

local function getCorners(model)
    local min, max = Vector3.new(9e9,9e9,9e9), Vector3.new(-9e9,-9e9,-9e9)
    for _, part in ipairs(model:GetChildren()) do
        if part:IsA("BasePart") then
            local cf, sz = part.CFrame, part.Size
            for x = -1,1,2 do
                for y = -1,1,2 do
                    for z = -1,1,2 do
                        local world = cf:PointToWorldSpace(Vector3.new(sz.X*x/2, sz.Y*y/2, sz.Z*z/2))
                        min = Vector3.new(math.min(min.X,world.X), math.min(min.Y,world.Y), math.min(min.Z,world.Z))
                        max = Vector3.new(math.max(max.X,world.X), math.max(max.Y,world.Y), math.max(max.Z,world.Z))
                    end
                end
            end
        end
    end
    local points, visible = {}, 0
    for _, pos in ipairs({
        Vector3.new(min.X,min.Y,min.Z), Vector3.new(max.X,max.Y,max.Z),
        Vector3.new(min.X,max.Y,max.Z), Vector3.new(max.X,min.Y,min.Z)
    }) do
        local v, on = Camera:WorldToViewportPoint(pos)
        if on and v.Z > 0 then visible += 1 end
        points[#points+1] = {vec=v, on=on}
    end
    return points, visible
end

RunService.RenderStepped:Connect(function()
    if not (renderBoundingBox or renderHealthBar or renderSkeleton) then
        for _, cache in pairs(DrawCache) do
            for _, obj in pairs(cache) do
                if typeof(obj) == "table" then for _, l in pairs(obj) do l.Visible = false end
                elseif obj.Visible ~= nil then obj.Visible = false end
            end
        end
        return
    end

    for _, z in ipairs(ZombiesFolder:GetChildren()) do
        if not z:IsA("Model") then continue end
        local hum = z:FindFirstChildOfClass("Humanoid")
        local hrp = z:FindFirstChild("HumanoidRootPart")
        if not (hum and hrp) or hum.Health <= 0 then clearCacheFor(z) continue end

        local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
        if not (onScreen and screenPos.Z > 0) then clearCacheFor(z) continue end

        local cache = ensureCache(z)
        local pts, vis = getCorners(z)
        if vis == 0 then clearCacheFor(z) continue end

        local minX, minY, maxX, maxY = 9e9,9e9,-9e9,-9e9
        for _, p in ipairs(pts) do
            if p.on then
                minX, minY = math.min(minX,p.vec.X), math.min(minY,p.vec.Y)
                maxX, maxY = math.max(maxX,p.vec.X), math.max(maxY,p.vec.Y)
            end
        end
        local x, y, w, h = minX, minY, maxX-minX, maxY-minY

        if renderBoundingBox then
            if enableOutlines then
                cache.boxOutline.Position = Vector2.new(x, y)
                cache.boxOutline.Size = Vector2.new(w, h)
                cache.boxOutline.Visible = true
            else
                cache.boxOutline.Visible = false
            end
            cache.box.Position = Vector2.new(x, y)
            cache.box.Size = Vector2.new(w, h)
            cache.box.Color = _G.color_bounding_box
            cache.box.Visible = true
        else
            cache.box.Visible = false
            cache.boxOutline.Visible = false
        end

        if renderHealthBar then
            local hp = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
            cache.barOutline.Color = Color3.new(0,0,0)
            cache.barOutline.Size = Vector2.new(4, h)
            cache.barOutline.Position = Vector2.new(x - 6, y)
            cache.barOutline.Visible = enableOutlines
            cache.barFill.Color = Color3.fromRGB(255*(1-hp), 255*hp, 0)
            cache.barFill.Size = Vector2.new(2, h * hp)
            cache.barFill.Position = Vector2.new(x - 5, y + (h - h * hp))
            cache.barFill.Visible = true
        else
            cache.barOutline.Visible = false
            cache.barFill.Visible = false
        end

        if renderSkeleton then
            local bones = {
                {z:FindFirstChild("Head"), z:FindFirstChild("UpperTorso") or z:FindFirstChild("Torso")},
                {z:FindFirstChild("UpperTorso") or z:FindFirstChild("Torso"), z:FindFirstChild("LowerTorso")},
                {z:FindFirstChild("UpperTorso") or z:FindFirstChild("Torso"), z:FindFirstChild("LeftUpperArm")},
                {z:FindFirstChild("UpperTorso") or z:FindFirstChild("Torso"), z:FindFirstChild("RightUpperArm")},
                {z:FindFirstChild("LowerTorso"), z:FindFirstChild("LeftUpperLeg")},
                {z:FindFirstChild("LowerTorso"), z:FindFirstChild("RightUpperLeg")}
            }
            for i, pair in ipairs(bones) do
                local p1, p2 = pair[1], pair[2]
                if p1 and p2 then
                    local a, aOn = Camera:WorldToViewportPoint(p1.Position)
                    local b, bOn = Camera:WorldToViewportPoint(p2.Position)
                    if aOn and bOn and a.Z > 0 and b.Z > 0 then
                        if enableOutlines then
                            cache.skeletonOutline[i] = cache.skeletonOutline[i] or newDrawing("Line", {Thickness = 3, Color = Color3.new(0,0,0)})
                            local ol = cache.skeletonOutline[i]
                            ol.From, ol.To, ol.Visible = Vector2.new(a.X,a.Y), Vector2.new(b.X,b.Y), true
                        elseif cache.skeletonOutline[i] then
                            cache.skeletonOutline[i].Visible = false
                        end
                        cache.skeleton[i] = cache.skeleton[i] or newDrawing("Line", {Thickness = 1})
                        local l = cache.skeleton[i]
                        l.From, l.To, l.Color, l.Visible = Vector2.new(a.X,a.Y), Vector2.new(b.X,b.Y), _G.color_skeleton, true
                    else
                        if cache.skeleton[i] then cache.skeleton[i].Visible = false end
                        if cache.skeletonOutline[i] then cache.skeletonOutline[i].Visible = false end
                    end
                end
            end
        else
            for _, l in pairs(cache.skeleton) do l.Visible = false end
            for _, l in pairs(cache.skeletonOutline) do l.Visible = false end
        end
    end

    for m in pairs(DrawCache) do
        if not m.Parent then clearCacheFor(m) end
    end
end)

local MiscNode = CombatSection:TreeNode({
    Title = "Misc",
    DefaultOpen = true,
    TextColor3 = Color3.fromRGB(204, 204, 212),
})

local platform

MiscNode:Button({
    Text = "Platform ⚠️",
    TextColor3 = Color3.fromRGB(204, 204, 212),
    BackgroundColor3 = Color3.fromRGB(26, 23, 31),
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character
        local root = character and character:FindFirstChild("HumanoidRootPart")

        if not root then
            return
        end

        if platform and platform.Parent then
            platform:Destroy()
            platform = nil
            return
        end

        platform = Instance.new("Part")
        platform.Name = "ShootThroughPlatform"
        platform.Size = Vector3.new(20, 1, 20)
        platform.Anchored = true
        platform.CanCollide = true
        platform.CanQuery = true
        platform.CanTouch = true
        platform.Transparency = 0.8
        platform.Material = Enum.Material.ForceField
        platform.Position = root.Position + Vector3.new(0, 10, 0)
        platform.Parent = workspace
    end
})

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local defHip = humanoid.HipHeight

MiscNode:SliderFloat({
    Label = "HipHeight",
    Value = defHip,
    Minimum = 0,
    Maximum = 50,
    Format = "%.1f",
    TextColor3 = Color3.fromRGB(204, 204, 212),
    SliderGrabColor = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        humanoid.HipHeight = Value
    end
})

MiscNode:Button({
    Text = "Reset HipHeight",
    TextColor3 = Color3.fromRGB(204, 204, 212),
    BackgroundColor3 = Color3.fromRGB(26, 23, 31),
    Callback = function()
        humanoid.HipHeight = defHip
    end
})

local teleportEnabled = false
local teleportPosition = nil

task.spawn(function()
    while true do
        if teleportEnabled and teleportPosition then
            for _, zombie in pairs(ZombiesFolder:GetChildren()) do
                if zombie:IsA("Model") and zombie:FindFirstChild("HumanoidRootPart") then
                    zombie:MoveTo(teleportPosition)
                end
            end
        end
        task.wait(0.02)
    end
end)

local ZombieTPRow = MiscNode:Row()
ZombieTPRow:Checkbox({
    Label = "Zombie TP (F to set position)",
    Value = false,
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        teleportEnabled = Value
        if Value then
            local mouse = player:GetMouse()
            local hit = mouse.Hit
            if hit then
                teleportPosition = hit.Position
            end
        end
    end
})

local Floating = false
local function randomString()
    local str = ""
    for i = 1, 10 do
        str = str .. string.char(math.random(97, 122))
    end
    return str
end

local IYMouse = LocalPlayer:GetMouse()
local floatName = randomString()

MiscNode:Checkbox({
    Label = "Float (Q=down, E=up)",
    Value = false,
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        local pchar = LocalPlayer.Character
        if Value then
            if Floating then return end
            Floating = true
            if not pchar or pchar:FindFirstChild(floatName) then return end
            task.spawn(function()
                local Float = Instance.new("Part")
                Float.Name = floatName
                Float.Parent = pchar
                Float.Transparency = 1
                Float.Size = Vector3.new(2, 0.2, 1.5)
                Float.Anchored = true
                local FloatValue = -3.1
                local function getRoot(char)
                    return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
                end
                Float.CFrame = getRoot(pchar).CFrame * CFrame.new(0, FloatValue, 0)
                local qUp, eUp, qDown, eDown, floatDied, FloatingFunc
                qUp = IYMouse.KeyUp:Connect(function(KEY)
                    if KEY == "q" then
                        FloatValue = FloatValue + 0.5
                    end
                end)
                eUp = IYMouse.KeyUp:Connect(function(KEY)
                    if KEY == "e" then
                        FloatValue = FloatValue - 1.5
                    end
                end)
                qDown = IYMouse.KeyDown:Connect(function(KEY)
                    if KEY == "q" then
                        FloatValue = FloatValue - 0.5
                    end
                end)
                eDown = IYMouse.KeyDown:Connect(function(KEY)
                    if KEY == "e" then
                        FloatValue = FloatValue + 1.5
                    end
                end)
                local function Cleanup()
                    Floating = false
                    if Float then Float:Destroy() end
                    if qUp then qUp:Disconnect() end
                    if eUp then eUp:Disconnect() end
                    if qDown then qDown:Disconnect() end
                    if eDown then eDown:Disconnect() end
                    if floatDied then floatDied:Disconnect() end
                    if FloatingFunc then FloatingFunc:Disconnect() end
                end
                floatDied = pchar:FindFirstChildOfClass("Humanoid").Died:Connect(Cleanup)
                FloatingFunc = RunService.Heartbeat:Connect(function()
                    if pchar and pchar:FindFirstChild(floatName) and getRoot(pchar) then
                        Float.CFrame = getRoot(pchar).CFrame * CFrame.new(0, FloatValue, 0)
                    else
                        Cleanup()
                    end
                end)
            end)
        else
            if not Floating then return end
            Floating = false
            local pchar = LocalPlayer.Character
            if pchar and pchar:FindFirstChild(floatName) then
                pchar:FindFirstChild(floatName):Destroy()
            end
        end
    end
})

local Watermark = ReGui.Elements:Label({
    Parent = ReGui.Container.Windows,
    Visible = true,
    UiPadding = UDim.new(0, 8),
    CornerRadius = UDim.new(0, 2),
    Position = UDim2.fromOffset(10, 10),
    Size = UDim2.fromOffset(280, 50),
    Border = false,
    BorderThickness = 1,
    BorderColor = Color3.fromRGB(204, 204, 212),
    BackgroundTransparency = 1,
    BackgroundColor3 = Color3.fromRGB(15, 13, 18),
    Text = "Korrupt Zombies Menu",
    TextColor3 = Color3.fromRGB(204, 204, 212),
    TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Center,
    Font = Enum.Font.GothamBold,
})

task.spawn(function()
    while task.wait(1) do
        if Watermark and Watermark.Visible then
            local FPS = math.round(1 / RunService.RenderStepped:Wait())
            local TimeString = DateTime.now():FormatLocalTime("h:mm:ss A", "en-us")
            Watermark.Text = string.format("Korrupt Zombies Menu\nFPS: %d | %s", FPS, TimeString)
        end
    end
end)

MainWindow.Visible = true

print("Korrupt Zombies Menu loaded successfully!")
