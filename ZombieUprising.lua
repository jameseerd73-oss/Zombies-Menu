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
    Title = "Zombie Uprising Menu",
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
local Workspace = game:GetService("Workspace")

local Camera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

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

local SilentAimNode = CombatSection:TreeNode({
    Title = "Bullet Redirection",
    DefaultOpen = true,
    TextColor3 = Color3.fromRGB(204, 204, 212),
})

local AimbotSettings = {
    Enabled = true,
    SilentAim = false,
    AimlockPart = "Head",
    ShowFov = false,
    Snaplines = false,
    VisibilityCheck = false,
    SilentAimHitChance = 100,
    FovSize = 150,
    FovThickness = 2,
    FovTransparency = 1,
    FovColor = Color3.fromRGB(255, 255, 255),
    MagicBullet = false,
    ClosestCharacter = false,
    ClosestCursor = true
}

local ZombiesFolder = Workspace:FindFirstChild("Zombies") or Instance.new("Folder", Workspace)
ZombiesFolder.Name = "Zombies"
_G.color_chams = _G.color_chams or Color3.fromRGB(0, 255, 120)
_G.fov_color = _G.fov_color or AimbotSettings.FovColor

local Zombies = {}

local function CacheZombie(model)
    if model:IsA("Model") then
        local part = model:FindFirstChild(AimbotSettings.AimlockPart)
        if part then
            Zombies[model] = { AimPart = part }
        end
    end
end

local function RemoveZombie(model)
    Zombies[model] = nil
end

for _, z in pairs(ZombiesFolder:GetChildren()) do CacheZombie(z) end
ZombiesFolder.ChildAdded:Connect(CacheZombie)
ZombiesFolder.ChildRemoved:Connect(RemoveZombie)

local FOV = Drawing.new("Circle")
FOV.Thickness = AimbotSettings.FovThickness
FOV.Transparency = AimbotSettings.FovTransparency
FOV.Color = _G.fov_color
FOV.Filled = false
FOV.NumSides = 64
FOV.Radius = AimbotSettings.FovSize
FOV.Visible = AimbotSettings.ShowFov

local Snapline = Drawing.new("Line")
Snapline.Thickness = 1.5
Snapline.Transparency = 1
Snapline.Color = _G.fov_color
Snapline.Visible = AimbotSettings.Snaplines

local function GetCursorPosition()
    if LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
        return Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    else
        return UserInputService:GetMouseLocation()
    end
end

local function IsVisible(part)
    if not AimbotSettings.VisibilityCheck then return true end
    local origin = Camera.CFrame.Position
    local direction = (part.Position - origin)
    local result = Workspace:FindPartOnRayWithIgnoreList(
        Ray.new(origin, direction),
        {LocalPlayer.Character, part.Parent},
        false,
        true
    )
    return result == nil
end

local function GetClosestZombie()
    local mousePos = GetCursorPosition()
    local closest, closestDist, aimPart

    for model, data in pairs(Zombies) do
        local part = data.AimPart
        if part and part:IsDescendantOf(Workspace) then
            local screenPos, visible = Camera:WorldToViewportPoint(part.Position)
            if visible then
                local dist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                if dist < AimbotSettings.FovSize and (not closestDist or dist < closestDist) then
                    if IsVisible(part) then
                        closest, closestDist, aimPart = model, dist, part
                    end
                end
            end
        end
    end

    return closest, aimPart
end

local aimModel, aimPart

RunService.RenderStepped:Connect(function()
    local mousePos = GetCursorPosition()
    FOV.Position = mousePos
    FOV.Radius = AimbotSettings.FovSize
    FOV.Visible = AimbotSettings.ShowFov
    FOV.Color = _G.fov_color

    Snapline.Color = _G.fov_color
    Snapline.Visible = AimbotSettings.Snaplines

    local target, part = GetClosestZombie()
    if target and part then
        aimModel, aimPart = target, part

        if AimbotSettings.Snaplines then
            local pos, visible = Camera:WorldToViewportPoint(part.Position)
            if visible then
                Snapline.From = mousePos
                Snapline.To = Vector2.new(pos.X, pos.Y)
                Snapline.Visible = true
            else
                Snapline.Visible = false
            end
        end
    else
        aimModel, aimPart = nil, nil
        Snapline.Visible = false
    end
end)

local oldIndex
oldIndex = hookmetamethod(game, "__index", function(self, key)
    if not checkcaller() and AimbotSettings.SilentAim and aimPart and self == LocalPlayer:GetMouse() then
        if math.random(1, 100) <= AimbotSettings.SilentAimHitChance then
            if key == "Target" then
                return aimPart
            elseif key == "Hit" then
                return CFrame.new(aimPart.Position)
            end
        end
    end
    return oldIndex(self, key)
end)

local AutoShootSettings = {
    Enabled = false,
    Mode = "Hold",
    ClickInterval = 0.08,
    MaxClickBurst = nil
}

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

local autoShooting = false
local clickTask = nil

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

local function startAutoShootLoop(targetPart)
    if clickTask or not targetPart then return end

    local function isTargetValid()
        return aimPart ~= nil
            and aimPart:IsDescendantOf(workspace)
            and AimbotSettings.VisibilityCheck
            and AutoShootSettings.Enabled
    end

    if AutoShootSettings.Mode == "Hold" then
        autoShooting = true
        safeMousePress()
        clickTask = coroutine.create(function()
            while isTargetValid() do task.wait(0.05) end
            safeMouseRelease()
            autoShooting = false
            clickTask = nil
        end)
        coroutine.resume(clickTask)
    else
        autoShooting = true
        clickTask = coroutine.create(function()
            while isTargetValid() do
                local burst = AutoShootSettings.MaxClickBurst or math.huge
                local count = 0
                while count < burst and isTargetValid() do
                    safeMousePress()
                    task.wait(math.clamp(AutoShootSettings.ClickInterval * 0.25, 0.01, 0.05))
                    safeMouseRelease()
                    count += 1
                    task.wait(AutoShootSettings.ClickInterval)
                end
                task.wait(0)
            end
            autoShooting = false
            clickTask = nil
        end)
        coroutine.resume(clickTask)
    end
end

RunService.RenderStepped:Connect(function()
    if aimPart and AimbotSettings.VisibilityCheck and AutoShootSettings.Enabled then
        if not clickTask then
            startAutoShootLoop(aimPart)
        end
    else
        stopAutoShooting()
    end
end)

SilentAimNode:Checkbox({
    Label = "Enabled",
    Value = false,
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        AimbotSettings.SilentAim = Value
    end
})

SilentAimNode:Checkbox({
    Label = "Visibility Check",
    Value = false,
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        AimbotSettings.VisibilityCheck = Value
    end
})

SilentAimNode:SliderInt({
    Label = "Hitchance",
    Value = 100,
    Minimum = 0,
    Maximum = 100,
    Format = "%d%%",
    TextColor3 = Color3.fromRGB(204, 204, 212),
    SliderGrabColor = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        AimbotSettings.SilentAimHitChance = Value
    end
})

SilentAimNode:Checkbox({
    Label = "Magic Bullet ⚠️",
    Value = false,
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        AimbotSettings.MagicBullet = Value
    end
})

local HitcheckRow = SilentAimNode:Row()
HitcheckRow:Label({
    Text = "Hitcheck:",
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Size = UDim2.new(0.4, 0, 0, 0),
})
HitcheckRow:Combo({
    Selected = "Head",
    Items = {"Head", "HumanoidRootPart"},
    TextColor3 = Color3.fromRGB(204, 204, 212),
    BackgroundColor3 = Color3.fromRGB(26, 23, 31),
    Callback = function(_, Value)
        AimbotSettings.AimlockPart = Value
        for model, data in pairs(Zombies) do
            local part = model:FindFirstChild(Value)
            if part then
                data.AimPart = part
            end
        end
    end
})

local PrioritizeRow = SilentAimNode:Row()
PrioritizeRow:Label({
    Text = "Prioritize:",
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Size = UDim2.new(0.4, 0, 0, 0),
})
PrioritizeRow:Combo({
    Selected = "Closest Cursor",
    Items = {"Closest Cursor", "Closest Player"},
    TextColor3 = Color3.fromRGB(204, 204, 212),
    BackgroundColor3 = Color3.fromRGB(26, 23, 31),
    Callback = function(_, Value)
        if Value == "Closest Cursor" then
            AimbotSettings.ClosestCharacter = false
            AimbotSettings.ClosestCursor = true
        else
            AimbotSettings.ClosestCharacter = true
            AimbotSettings.ClosestCursor = false
        end
    end
})

SilentAimNode:Checkbox({
    Label = "Visualize FOV",
    Value = false,
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        AimbotSettings.ShowFov = Value
        FOV.Visible = Value
    end
})

local FOVColorRow = SilentAimNode:Row()
FOVColorRow:Label({
    Text = "FOV Color:",
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Size = UDim2.new(0.4, 0, 0, 0),
})
FOVColorRow:InputColor3({
    Value = _G.fov_color,
    Label = "",
    Callback = function(_, Value)
        _G.fov_color = Value
        AimbotSettings.FovColor = Value
        if FOV then FOV.Color = Value end
        if Snapline then Snapline.Color = Value end
    end
})

SilentAimNode:SliderInt({
    Label = "Field of View Circle Size",
    Value = 150,
    Minimum = 0,
    Maximum = 1000,
    Format = "%d px",
    TextColor3 = Color3.fromRGB(204, 204, 212),
    SliderGrabColor = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        AimbotSettings.FovSize = Value
        FOV.Radius = Value
    end
})

SilentAimNode:Checkbox({
    Label = "Snapline",
    Value = false,
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        AimbotSettings.Snaplines = Value
        Snapline.Visible = Value
    end
})

SilentAimNode:Checkbox({
    Label = "Auto Shoot",
    Value = false,
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        if Value and not AimbotSettings.VisibilityCheck then
            AutoShootSettings.Enabled = false
            return
        end
        AutoShootSettings.Enabled = Value
        if not Value then
            pcall(function()
                if autoShooting then
                    safeMouseRelease()
                    autoShooting = false
                end
            end)
        end
    end
})

SilentAimNode:SliderFloat({
    Label = "Click Interval",
    Value = 0.08,
    Minimum = 0.01,
    Maximum = 0.25,
    Format = "%.3f",
    TextColor3 = Color3.fromRGB(204, 204, 212),
    SliderGrabColor = Color3.fromRGB(204, 204, 212),
    Callback = function(_, Value)
        AutoShootSettings.ClickInterval = Value
    end
})

local AimModeRow = SilentAimNode:Row()
AimModeRow:Label({
    Text = "Aim Mode:",
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Size = UDim2.new(0.4, 0, 0, 0),
})
AimModeRow:Combo({
    Selected = "Hold",
    Items = {"none", "Hold", "Click"},
    TextColor3 = Color3.fromRGB(204, 204, 212),
    BackgroundColor3 = Color3.fromRGB(26, 23, 31),
    Callback = function(_, Value)
        if Value == "Hold" or Value == "Click" then
            AutoShootSettings.Mode = Value
        else
            AutoShootSettings.Mode = "Click"
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
    Items = {"zombies", "perk_machines", "upgrades", "turrets", "rewards"},
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
    zombies = workspace:WaitForChild("Zombies", 5),
    perk_machines = workspace.Map:WaitForChild("PerkMachines", 5),
    rewards = workspace.Map.Rewards:WaitForChild("Spawns", 5),
    upgrades = workspace.Map:WaitForChild("Upgrades", 5),
    turrets = workspace.Map:WaitForChild("Turrets", 5)
}

local ChamFolder = Instance.new("Folder")
ChamFolder.Name = "ChamVisuals"
ChamFolder.Parent = game.CoreGui

local Highlights = {}
local Labels = {}

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
    local chamList = {"zombies"}
    if type(_G.cham_priority) == "table" then
        chamList = _G.cham_priority
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
local ambientColor = _G.color_chams

local AmbientColorRow = VisualsNode:Row()
AmbientColorRow:Label({
    Text = "Ambient Color:",
    TextColor3 = Color3.fromRGB(204, 204, 212),
    Size = UDim2.new(0.4, 0, 0, 0),
})
AmbientColorRow:InputColor3({
    Value = ambientColor,
    Label = "",
    Callback = function(_, Value)
        ambientColor = Value
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
        if Value then
            game.Lighting.Ambient = ambientColor
        end
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

local function newDrawing(drawType, props)
    local d = Drawing.new(drawType)
    for k, v in pairs(props) do
        pcall(function()
            d[k] = v
        end)
    end
    return d
end

local function clearCacheFor(model)
    local cache = DrawCache[model]
    if not cache then return end
    for _, obj in pairs(cache) do
        if typeof(obj) == "table" then
            for _, line in pairs(obj) do
                if line and line.Remove then
                    pcall(function() line:Remove() end)
                end
            end
        elseif obj and obj.Remove then
            pcall(function() obj:Remove() end)
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
    local min = Vector3.new(9e9, 9e9, 9e9)
    local max = Vector3.new(-9e9, -9e9, -9e9)
    for _, part in ipairs(model:GetChildren()) do
        if part:IsA("BasePart") then
            local cf = part.CFrame
            local sz = part.Size
            for x = -1, 1, 2 do
                for y = -1, 1, 2 do
                    for z = -1, 1, 2 do
                        local world = cf:PointToWorldSpace(Vector3.new(sz.X*x/2, sz.Y*y/2, sz.Z*z/2))
                        min = Vector3.new(math.min(min.X, world.X), math.min(min.Y, world.Y), math.min(min.Z, world.Z))
                        max = Vector3.new(math.max(max.X, world.X), math.max(max.Y, world.Y), math.max(max.Z, world.Z))
                    end
                end
            end
        end
    end
    local points = {}
    local visible = 0
    local positions = {
        Vector3.new(min.X, min.Y, min.Z),
        Vector3.new(max.X, max.Y, max.Z),
        Vector3.new(min.X, max.Y, max.Z),
        Vector3.new(max.X, min.Y, min.Z)
    }
    for _, pos in ipairs(positions) do
        local v, on = Camera:WorldToViewportPoint(pos)
        if on and v.Z > 0 then visible += 1 end
        points[#points + 1] = {vec = v, on = on}
    end
    return points, visible
end

RunService.RenderStepped:Connect(function()
    if not (renderBoundingBox or renderHealthBar or renderSkeleton) then
        for _, cache in pairs(DrawCache) do
            for _, obj in pairs(cache) do
                if typeof(obj) == "table" then
                    for _, line in pairs(obj) do
                        if line then line.Visible = false end
                    end
                elseif obj then
                    pcall(function() obj.Visible = false end)
                end
            end
        end
        return
    end

    local Zombies = workspace:WaitForChild("Zombies", 5)
    if not Zombies then return end

    for _, z in ipairs(Zombies:GetChildren()) do
        if not z:IsA("Model") then continue end
        local hum = z:FindFirstChildOfClass("Humanoid")
        local hrp = z:FindFirstChild("HumanoidRootPart")
        if not (hum and hrp) or hum.Health <= 0 then clearCacheFor(z) continue end

        local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
        if not (onScreen and screenPos.Z > 0) then clearCacheFor(z) continue end

        local cache = ensureCache(z)
        local pts, vis = getCorners(z)
        if vis == 0 then clearCacheFor(z) continue end

        local minX, minY, maxX, maxY = 9e9, 9e9, -9e9, -9e9
        for _, p in ipairs(pts) do
            if p.on then
                minX = math.min(minX, p.vec.X)
                minY = math.min(minY, p.vec.Y)
                maxX = math.max(maxX, p.vec.X)
                maxY = math.max(maxY, p.vec.Y)
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
            local hp = math.clamp(hum.Health / math.max(hum.MaxHealth, 1), 0, 1)
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
            local torso = z:FindFirstChild("UpperTorso") or z:FindFirstChild("Torso")
            local lowerTorso = z:FindFirstChild("LowerTorso")
            local bones = {
                {z:FindFirstChild("Head"), torso},
                {torso, lowerTorso},
                {torso, z:FindFirstChild("LeftUpperArm")},
                {torso, z:FindFirstChild("RightUpperArm")},
                {lowerTorso, z:FindFirstChild("LeftUpperLeg")},
                {lowerTorso, z:FindFirstChild("RightUpperLeg")}
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
                            ol.From = Vector2.new(a.X, a.Y)
                            ol.To = Vector2.new(b.X, b.Y)
                            ol.Visible = true
                        elseif cache.skeletonOutline[i] then
                            cache.skeletonOutline[i].Visible = false
                        end
                        cache.skeleton[i] = cache.skeleton[i] or newDrawing("Line", {Thickness = 1})
                        local line = cache.skeleton[i]
                        line.From = Vector2.new(a.X, a.Y)
                        line.To = Vector2.new(b.X, b.Y)
                        line.Color = _G.color_skeleton
                        line.Visible = true
                    else
                        if cache.skeleton[i] then cache.skeleton[i].Visible = false end
                        if cache.skeletonOutline[i] then cache.skeletonOutline[i].Visible = false end
                    end
                end
            end
        else
            for _, line in pairs(cache.skeleton) do line.Visible = false end
            for _, line in pairs(cache.skeletonOutline) do line.Visible = false end
        end
    end

    for model in pairs(DrawCache) do
        if not model.Parent then clearCacheFor(model) end
    end
end)

local MiscNode = CombatSection:TreeNode({
    Title = "Misc",
    DefaultOpen = true,
    TextColor3 = Color3.fromRGB(204, 204, 212),
})

MiscNode:Button({
    Text = "Gun Manipulation",
    TextColor3 = Color3.fromRGB(204, 204, 212),
    BackgroundColor3 = Color3.fromRGB(26, 23, 31),
    Callback = function()
        local ReplicatedFirst = game:GetService("ReplicatedFirst")
        local ok, env = pcall(function()
            return getsenv(ReplicatedFirst.Framework)
        end)
        if not ok or type(env) ~= "table" then
            return
        end
        for _, item in pairs(env) do
            if type(item) == "function" then
                local success, upvals = pcall(function() return debug.getupvalues(item) end)
                if success and type(upvals) == "table" then
                    for _, up in pairs(upvals) do
                        if type(up) == "table" then
                            for key, gunmodule in pairs(up) do
                                if key == "gunmodulestorage" and type(gunmodule) == "table" then
                                    for _, gun in pairs(gunmodule) do
                                        if type(gun) == "table" then
                                            if gun.spread then
                                                gun.spread = {
                                                    Increase = 0,
                                                    Decrease = 0,
                                                    Max = 0,
                                                    Min = 0
                                                }
                                            end
                                            if gun.mode then
                                                gun.mode = "Auto"
                                            end
                                            if gun.recoil then
                                                gun.recoil = {
                                                    Aimed = 0,
                                                    FirstShot = 0,
                                                    Tilt = {0, 0},
                                                    Side = {0, 0},
                                                    Vertical = {0, 0},
                                                    Back = {0, 0}
                                                }
                                            end
                                            if gun.rpm then
                                                gun.rpm = 1e15
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
})

local platform = nil

MiscNode:Button({
    Text = "Platform ⚠️",
    TextColor3 = Color3.fromRGB(204, 204, 212),
    BackgroundColor3 = Color3.fromRGB(26, 23, 31),
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character
        local root = character and character:FindFirstChild("HumanoidRootPart")
        if not root then return end
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

local Floating = false

local function randomString()
    local str = ""
    for _ = 1, 10 do
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
            if not pchar then return end
            local root = pchar:FindFirstChild("HumanoidRootPart") or pchar:FindFirstChild("Torso") or pchar:FindFirstChild("UpperTorso")
            local pHumanoid = pchar:FindFirstChildOfClass("Humanoid")
            if not root or not pHumanoid then return end
            Floating = true
            task.spawn(function()
                local Float = Instance.new("Part")
                Float.Name = floatName
                Float.Parent = pchar
                Float.Transparency = 1
                Float.Size = Vector3.new(2, 0.2, 1.5)
                Float.Anchored = true
                Float.CanCollide = true
                local FloatValue = -3.1
                local qUp, eUp, qDown, eDown, floatDied, FloatingFunc
                Float.CFrame = root.CFrame * CFrame.new(0, FloatValue, 0)
                local function getRoot(char)
                    return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
                end
                local cleaned = false
                local function Cleanup()
                    if cleaned then return end
                    cleaned = true
                    Floating = false
                    if Float then Float:Destroy() end
                    if qUp then qUp:Disconnect() end
                    if eUp then eUp:Disconnect() end
                    if qDown then qDown:Disconnect() end
                    if eDown then eDown:Disconnect() end
                    if floatDied then floatDied:Disconnect() end
                    if FloatingFunc then FloatingFunc:Disconnect() end
                end
                qUp = IYMouse.KeyUp:Connect(function(KEY)
                    if KEY:lower() == "q" then FloatValue += 0.5 end
                end)
                eUp = IYMouse.KeyUp:Connect(function(KEY)
                    if KEY:lower() == "e" then FloatValue -= 1.5 end
                end)
                qDown = IYMouse.KeyDown:Connect(function(KEY)
                    if KEY:lower() == "q" then FloatValue -= 0.5 end
                end)
                eDown = IYMouse.KeyDown:Connect(function(KEY)
                    if KEY:lower() == "e" then FloatValue += 1.5 end
                end)
                floatDied = pHumanoid.Died:Connect(Cleanup)
                FloatingFunc = RunService.Heartbeat:Connect(function()
                    local currentRoot = getRoot(pchar)
                    if pchar and pchar.Parent and Float and Float.Parent and currentRoot then
                        Float.CFrame = currentRoot.CFrame * CFrame.new(0, FloatValue, 0)
                    else
                        Cleanup()
                    end
                end)
            end)
        else
            Floating = false
            local currentChar = LocalPlayer.Character
            if currentChar then
                local float = currentChar:FindFirstChild(floatName)
                if float then float:Destroy() end
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
    Text = "Zombie Uprising Menu",
    TextColor3 = Color3.fromRGB(204, 204, 212),
    TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Center,
    Font = Enum.Font.GothamBold,
})

task.spawn(function()
    while task.wait(1) do
        if Watermark and Watermark.Visible then
            local delta = RunService.RenderStepped:Wait()
            local FPS = 0
            if delta and delta > 0 then
                FPS = math.round(1 / delta)
            end
            local TimeString = DateTime.now():FormatLocalTime("h:mm:ss A", "en-us")
            Watermark.Text = string.format("Zombie Uprising Menu\nFPS: %d | %s", FPS, TimeString)
        end
    end
end)

MainWindow.Visible = true

print("Zombie Uprising Menu loaded successfully!")
