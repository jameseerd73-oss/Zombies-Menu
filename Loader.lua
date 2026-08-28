local ReGui = loadstring(game:HttpGet("https://raw.githubusercontent.com/myethg/Dear-ReGui/a597754289462abb2697646cbd28b802f19c6dc5/ReGui.lua"))()
local InsertService = cloneref(game:GetService("InsertService"))

ReGui:Init({
    Prefabs = InsertService:LoadLocalAsset("rbxassetid://91788667330406")
})

ReGui:DefineTheme("LoaderTheme", {
    TitleAlign = Enum.TextXAlignment.Left,
    Text = Color3.fromRGB(220, 220, 230),
    TextDisabled = Color3.fromRGB(100, 100, 120),
    FrameBg = Color3.fromRGB(20, 22, 28),
    FrameBgTransparency = 0.05,
    FrameBgActive = Color3.fromRGB(40, 45, 60),
    FrameBgTransparencyActive = 0,
    CheckMark = Color3.fromRGB(60, 160, 255),
    SliderGrab = Color3.fromRGB(60, 160, 255),
    ButtonsBg = Color3.fromRGB(50, 55, 75),
    CollapsingHeaderBg = Color3.fromRGB(35, 40, 55),
    CollapsingHeaderText = Color3.fromRGB(220, 220, 235),
    RadioButtonHoveredBg = Color3.fromRGB(60, 65, 85),
    WindowBg = Color3.fromRGB(15, 17, 22),
    TitleBarBg = Color3.fromRGB(10, 12, 17),
    TitleBarBgActive = Color3.fromRGB(25, 30, 45),
    Border = Color3.fromRGB(45, 50, 65),
    ResizeGrab = Color3.fromRGB(60, 160, 255),
    RegionBgTransparency = 1,
})

local notificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/laagginq/ui-libraries/main/xaxas-notification/src.lua"))()
local notifications = notificationLibrary.new({
    NotificationLifetime = 4,
    NotificationPosition = "Middle",
    TextFont = Enum.Font.Code,
    TextColor = Color3.fromRGB(255, 255, 255),
    TextSize = 16,
    TextStrokeTransparency = 0,
    TextStrokeColor = Color3.fromRGB(0, 0, 0)
})
notifications:BuildNotificationUI()

local Window = ReGui:Window({
    Title = "vanilla.cc",
    Theme = "LoaderTheme",
    NoClose = false,
    NoResize = true,
    NoScrollBar = true,
    NoScroll = true,
    NoTitleBar = true,
    Size = UDim2.fromOffset(450, 200),
}):Center()

local Root = Window:List({
    Layout = Enum.FillDirection.Horizontal,
    HorizontalFlex = Enum.UIFlexAlignment.Fill,
    UiPadding = 0,
    Spacing = 0,
})

local LeftSide = Root:List({
    Layout = Enum.FillDirection.Vertical,
    UiPadding = 8,
    Spacing = 4,
    Size = UDim2.new(0.5, -2, 1, 0),
    BackgroundColor3 = Color3.fromRGB(15, 17, 22),
    BackgroundTransparency = 0.1,
})

LeftSide:Label({
    Text = "Game",
    TextSize = 14,
    TextColor3 = Color3.fromRGB(200, 210, 220),
    Font = Enum.Font.GothamBold,
    Size = UDim2.new(1, 0, 0, 28),
})

local selectedProduct = "Michael Zombies"
local MichaelZombiesBtn, ZombieUprising, KorruptZombiesBtn, InjectBtn

local RightSide = Root:List({
    Layout = Enum.FillDirection.Vertical,
    UiPadding = 12,
    Spacing = 4,
    Size = UDim2.new(0.5, -2, 1, 0),
    BackgroundColor3 = Color3.fromRGB(15, 17, 22),
    BackgroundTransparency = 0.1,
})

RightSide:Label({
    Text = "Cheat Info",
    TextSize = 11,
    TextColor3 = Color3.fromRGB(140, 145, 160),
    Font = Enum.Font.GothamBold,
    Size = UDim2.new(1, 0, 0, 20),
})

RightSide:Label({
    Text = "UNDETECTED",
    TextSize = 18,
    TextColor3 = Color3.fromRGB(0, 255, 100),
    Font = Enum.Font.GothamBold,
    Size = UDim2.new(1, 0, 0, 30),
})

RightSide:Label({
    Text = "Lifetime",
    TextSize = 14,
    TextColor3 = Color3.fromRGB(200, 210, 220),
    Size = UDim2.new(1, 0, 0, 24),
})

RightSide:Label({
    Text = "Version 5.9.8",
    TextSize = 14,
    TextColor3 = Color3.fromRGB(200, 210, 220),
    Size = UDim2.new(1, 0, 0, 24),
})

local ChangelogLabel = RightSide:Label({
    Text = "",
    TextSize = 11,
    TextColor3 = Color3.fromRGB(180, 180, 190),
    Size = UDim2.new(1, 0, 0, 60),
    TextWrapped = true,
})

local changelogs = {
    ["Michael Zombies"] = "Changelog:\nv1.62 - improved ESP, fixed aimbot",
    ["Zombie Uprising"] = "Changelog:\nv1.0 - Silent aim, magic bullet (?), FOV, snaplines, chams",
    ["Korrupt Zombies"] = "Changelog:\nv1.0 - Aimbot, ESP, chams, auto shoot, teleport"
}

local function UpdateChangelog(productName)
    ChangelogLabel.Text = changelogs[productName] or ""
end

RightSide:List({
    Layout = Enum.FillDirection.Vertical,
    HorizontalFlex = Enum.UIFlexAlignment.Fill,
    UiPadding = 0,
    Spacing = 0,
    Size = UDim2.new(1, 0, 1, 0),
})

local function SelectProduct(product, button)
    selectedProduct = product
    if MichaelZombiesBtn then MichaelZombiesBtn:SetSelected(button == MichaelZombiesBtn) end
    if ZombieUprising then ZombieUprising:SetSelected(button == ZombieUprising) end
    if KorruptZombiesBtn then KorruptZombiesBtn:SetSelected(button == KorruptZombiesBtn) end
    UpdateChangelog(selectedProduct)
end

MichaelZombiesBtn = LeftSide:Selectable({
    Text = "Michael Zombies",
    Size = UDim2.new(1, 0, 0, 28),
    Selected = true,
    Callback = function() SelectProduct("Michael Zombies", MichaelZombiesBtn) end,
})

ZombieUprising = LeftSide:Selectable({
    Text = "Zombie Uprising",
    Size = UDim2.new(1, 0, 0, 28),
    Selected = false,
    Callback = function() SelectProduct("Zombie Uprising", ZombieUprising) end,
})

KorruptZombiesBtn = LeftSide:Selectable({
    Text = "Korrupt Zombies",
    Size = UDim2.new(1, 0, 0, 28),
    Selected = false,
    Callback = function() SelectProduct("Korrupt Zombies", KorruptZombiesBtn) end,
})

LeftSide:List({
    Layout = Enum.FillDirection.Vertical,
    HorizontalFlex = Enum.UIFlexAlignment.Fill,
    UiPadding = 0,
    Spacing = 0,
    Size = UDim2.new(1, 0, 1, -120),
})

local BottomLeft = LeftSide:List({
    Layout = Enum.FillDirection.Vertical,
    HorizontalFlex = Enum.UIFlexAlignment.Fill,
    UiPadding = 0,
    Spacing = 4,
    Size = UDim2.new(1, 0, 0, 70),
})

local function CreateInjectButton()
    if InjectBtn then InjectBtn:Destroy() end
    InjectBtn = BottomLeft:Button({
        Text = "Inject",
        Size = UDim2.new(1, 0, 0, 30),
        TextColor3 = Color3.fromRGB(200, 210, 220),
        BackgroundColor3 = Color3.fromRGB(40, 45, 60),
        Font = Enum.Font.GothamBold,
        Callback = function()
            notifications:Notify("Injecting " .. selectedProduct .. "...")
            local scripts = {
                ["Michael Zombies"] = function()
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/jameseerd73-oss/Zombies-Menu/refs/heads/main/MichaelZombies.lua"))()
                    notifications:Notify("Successfully injected " .. selectedProduct)
                end,
                ["Zombie Uprising"] = function()
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/jameseerd73-oss/Zombies-Menu/refs/heads/main/ZombieUprising.lua"))()
                    notifications:Notify("Successfully injected " .. selectedProduct)
                end,
                ["Korrupt Zombies"] = function()
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/jameseerd73-oss/Zombies-Menu/refs/heads/main/KorruptZombies.lua"))()
                    notifications:Notify("Successfully injected " .. selectedProduct)
                end,
            }
            local scriptFunc = scripts[selectedProduct]
            if scriptFunc then 
                pcall(scriptFunc)
            else 
                notifications:Notify("Selected product: " .. selectedProduct .. " (No script assigned)") 
            end
            Window:Close()
        end,
    })
end

CreateInjectButton()

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
        Window:ToggleVisibility()
    end
end)

UpdateChangelog(selectedProduct)
