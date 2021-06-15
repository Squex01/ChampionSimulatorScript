local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Squex01/ChampionSimulatorScript/main/ChampionSimulator.lua')))()
local w = library:CreateWindow("Champion Simulator")
local b = w:CreateFolder("AutoFarm")
local f = w:CreateFolder("AutoBuy")
local e = w:CreateFolder("Mix")
local u = w:CreateFolder("Credits")

if game:GetService("CoreGui"):FindFirstChild("PurchasePromptApp") then
    game:GetService("CoreGui").PurchasePromptApp:Destroy()
end

b:Toggle("Auto Punch",function(bool)
    shared.toggle = bool
    autopunch = bool
end)

b:Dropdown("Select Sell",{"Sell","2xSell"},true,function(blubb)
    sellchoice = blubb
end)

b:Toggle("Auto Sell",function(bool)
    shared.toggle = bool
    autosell = bool
end)

b:Toggle("Collect Gems/Coins",function(bool)
    shared.toggle = bool
    autocollect = bool
end)

b:Toggle("Collect Rings",function(bool)
    shared.toggle = bool
    autorings = bool
end)

f:Toggle("Gloves",function(bool)
    shared.toggle = bool
    autogloves = bool
end)

f:Toggle("DNA",function(bool)
    shared.toggle = bool
    autodna = bool
end)

f:Toggle("Aura",function(bool)
    shared.toggle = bool
    autoaura = bool
end)

e:Button("RIP RBX Shop",function()
    if game:GetService("StarterGui").Hud.Interface:FindFirstChild("RobShop") then
        game:GetService("StarterGui").Hud.Interface.RobShop:Destroy()
    end
    if game:GetService("Players").LocalPlayer.PlayerGui.Hud.Interface:FindFirstChild("RobShop") then
        game:GetService("Players").LocalPlayer.PlayerGui.Hud.Interface.RobShop:Destroy()
    end
end)

e:Slider("WalkSpeed",{min = 10; max = 200; precise = true; },function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

e:Slider("JumpPower",{min = 10; max = 200; precise = true; },function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end)

e:Toggle("AntiAfk",function(bool)
    shared.toggle = bool
    AntiAfk = bool
end)

--Credits
u:Button("Relax",function()
    setclipboard("Relax")
end)

u:Button("Discrod Server",function()
    setclipboard("https://discord.gg/K4txdRSVfq")
end)

while wait() do

    spawn(function()
        if autopunch == true then
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
                if v:IsA("Tool") then
                    wait(0.1)
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                end
            end
            for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do 
                if v:IsA("Tool") then
                    wait(0.4)
                    v:Activate()
                    wait(0.4)
                    v:Deactivate()
                end
            end
        end
    end)

    spawn(function()
        if autosell == true then
            for i,v in pairs(workspace:GetDescendants()) do
                if v.Name == sellchoice then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.CFrame.Position + Vector3.new(0,2,0))
                    wait(0.5)
                end
            end
        end
    end)

    spawn(function()
        if autocollect == true then
            for i,v in pairs(game:GetService("Workspace").Pickups:GetDescendants()) do
                if v.ClassName == "TouchTransmitter" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Parent.CFrame.Position)
                end
            end
        end
    end)

    spawn(function()
        if autorings == true then
            for _,v in pairs(workspace:GetDescendants()) do
                if not autorings then break end
                if v.ClassName == "TouchTransmitter" then
                    if v.Parent.Name == "Touch" then
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
                        wait()
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
                    end
                end
            end
        end
    end)

    spawn(function()
        if autogloves == true then
            game:GetService("ReplicatedStorage").Remotes.Events.Gloves:FireServer("purchaseall",1)
            game:GetService("ReplicatedStorage").Remotes.Events.Gloves:FireServer("purchaseall",2)
            game:GetService("ReplicatedStorage").Remotes.Events.Gloves:FireServer("purchaseall",3)
            game:GetService("ReplicatedStorage").Remotes.Events.Gloves:FireServer("purchaseall",4)
            game:GetService("ReplicatedStorage").Remotes.Events.Gloves:FireServer("purchaseall",5)
            game:GetService("ReplicatedStorage").Remotes.Events.Gloves:FireServer("purchaseall",6)
            game:GetService("ReplicatedStorage").Remotes.Events.Gloves:FireServer("purchaseall",7)
            game:GetService("ReplicatedStorage").Remotes.Events.Gloves:FireServer("purchaseall",8)
            game:GetService("ReplicatedStorage").Remotes.Events.Gloves:FireServer("purchaseall",9)
            wait(0.2)
        end
    end)

    spawn(function()
        if autodna == true then
            game:GetService("ReplicatedStorage").Remotes.Events.DNA:FireServer("purchaseall",1)
            game:GetService("ReplicatedStorage").Remotes.Events.DNA:FireServer("purchaseall",2)
            game:GetService("ReplicatedStorage").Remotes.Events.DNA:FireServer("purchaseall",3)
            game:GetService("ReplicatedStorage").Remotes.Events.DNA:FireServer("purchaseall",4)
            game:GetService("ReplicatedStorage").Remotes.Events.DNA:FireServer("purchaseall",5)
            game:GetService("ReplicatedStorage").Remotes.Events.DNA:FireServer("purchaseall",6)
            game:GetService("ReplicatedStorage").Remotes.Events.DNA:FireServer("purchaseall",7)
            game:GetService("ReplicatedStorage").Remotes.Events.DNA:FireServer("purchaseall",8)
            game:GetService("ReplicatedStorage").Remotes.Events.DNA:FireServer("purchaseall",9)
            wait(0.2)
        end
    end)

    spawn(function()
        if autoaura == true then
            game:GetService("ReplicatedStorage").Remotes.Events.Auras:FireServer("purchase",1)
            game:GetService("ReplicatedStorage").Remotes.Events.Auras:FireServer("purchase",2)
            game:GetService("ReplicatedStorage").Remotes.Events.Auras:FireServer("purchase",3)
            game:GetService("ReplicatedStorage").Remotes.Events.Auras:FireServer("purchase",4)
            game:GetService("ReplicatedStorage").Remotes.Events.Auras:FireServer("purchase",5)
            game:GetService("ReplicatedStorage").Remotes.Events.Auras:FireServer("purchase",6)
            game:GetService("ReplicatedStorage").Remotes.Events.Auras:FireServer("purchase",7)
            game:GetService("ReplicatedStorage").Remotes.Events.Auras:FireServer("purchase",8)
            game:GetService("ReplicatedStorage").Remotes.Events.Auras:FireServer("purchase",9)
            wait(2)
        end
    end)

    spawn(function()
        if AntiAfk == true then
            local vu = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:connect(function()
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end)
        end
    end)
end