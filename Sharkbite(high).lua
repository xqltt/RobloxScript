local library = loadstring(game:HttpGet("https://pastebin.com/raw/DnDhCpxd", true))()
LocalPlayer =  game:GetService("Players").LocalPlayer.Name



  if game.CoreGui:FindFirstChild("esp") then
  else
    local folder = Instance.new("Folder", game.CoreGui)
    folder.Name = "esp"
  end



  function Sharkesp()
    local folder = Instance.new("Folder", game.CoreGui.esp)
    folder.Name = "sharks"
    for i,v in pairs(game.Workspace.Sharks:GetChildren()) do
      if v ~= nil then
        sharks = {}
        table.insert(sharks, v.Name)
        for i = 1, #sharks do
          sdir = game.Workspace.Sharks[v.Name]

          local sesp = Instance.new("BillboardGui", game.CoreGui.esp.sharks)
          sesp.Name = sdir.Name
          sesp.Adornee = sdir.Kill
          sesp.AlwaysOnTop=true
          sesp.ResetOnSpawn=false
          sesp.Size = UDim2.new(1,1,1,1)

          local tag = Instance.new("TextLabel", sesp)
          tag.Size = UDim2.new(5,5,5,5)
          tag.Text = sdir.OwnerName.Value
          tag.TextColor3 = Color3.new(255, 0, 0)
          tag.TextStrokeTransparency = 0
          tag.BackgroundTransparency = 1

          local cham = Instance.new("BoxHandleAdornment", game.CoreGui.esp.sharks)
          cham.Name = sdir.Name
          cham.Size = sdir:WaitForChild("Body").Size
          cham.Adornee = sdir.Body
          cham.AlwaysOnTop = true
          cham.ZIndex = 5
          cham.Color3 = Color3.new(244,0,0)
          cham.Transparency = 0.72

          if sdir:FindFirstChild("Fin") then
            local fin = Instance.new("BoxHandleAdornment", game.CoreGui.esp.sharks)
            fin.Name = sdir.Name
            fin.Size = sdir.Fin.Size
            fin.Adornee = sdir.Fin
            fin.AlwaysOnTop = true
            fin.ZIndex = 5
            fin.Color3 = Color3.new(244,0,0)
            fin.Transparency = 0.6

            end end end end end


            function Survivoresp()
              local folder = Instance.new("Folder", game.CoreGui.esp)
              folder.Name = "survivors"
              for i,v in pairs(game.Players:GetChildren()) do
                if v.Name ~= LocalPlayer and v.Team.Name == "Survivor" then
                  survivors = {}
                  table.insert(survivors, v.Name)

                  for i = 1, #survivors do
                    local esp = Instance.new("BillboardGui", game.CoreGui.esp.survivors)
                    esp.Adornee = game.Players[v.Name].Character
                    esp.AlwaysOnTop=true
                    esp.ResetOnSpawn=false
                    esp.Size = UDim2.new(1,1,1,1)
                    esp.Name = v.Name

                    local tag = Instance.new("TextLabel", esp)
                    tag.Size = UDim2.new(5,5,5,5)
                    tag.Text = "Survivor"
                    tag.TextColor3 = Color3.new(0, 255, 0)
                    tag.BackgroundTransparency = 1
                    end end end end



                    function cleanshark()
                      game.CoreGui.esp.sharks:Destroy()
                    end

                    function cleansurv()
                      game.CoreGui.esp.survivors:Destroy()
                    end

                    local swin = library:CreateWindow("Sharkbite")
                    swin:Section("ESP")

                    local p = swin:Toggle("Survivor ESP", {flag = "suresp"}, function(flag)

                    if flag then Survivoresp()
                  else
                    cleansurv() end end)

                    local l = swin:Toggle("Shark ESP", {flag = "shesp"}, function(flag)
                    if flag then Sharkesp()
                  else
                    cleanshark()
                  end
                  end)

                  swin:Section("Misc")

                  swin:Toggle("Shark TP Farm", {flag = "tpshark"}, function(flag)
                  end)


                  swin:Toggle("Kill Survivors", {flag = "ksur"}, function()
                  end)


                  spawn(function()
                  while wait() do
                    pcall(function()
                    if swin.flags.ksur then
                      if game.Players.LocalPlayer.Team.Name == "Shark" then
                        for i,v in pairs(game.Players:GetChildren()) do
                          if v.Team.Name == "Survivor" then
                            workspace.Sharks:WaitForChild(tostring("Shark"..LocalPlayer))
                            v.Character:MoveTo(workspace.Sharks["Shark"..LocalPlayer]:FindFirstChild("Kill").Position)
                            v.Character:MoveTo(workspace.Sharks["Shark"..LocalPlayer]:FindFirstChild("Kill2").Position)
                            workspace.Sharks["Shark"..game.Players.LocalPlayer.Name]:MoveTo(v.Character:FindFirstChild("HumanoidRootPart").Position)
                          end
                        end
                      end
                    end
                    end)
                  end
                  end)






                  swin:Toggle("AFK", {flag = "afk"}, function(flag)
                  if flag then
                    flag = false
                    wait(1)
                    flag = true
                  end
                  end)




                  function reload()
                    pcall(function()
                    if game.Players.LocalPlayer.PlayerGui:FindFirstChild("WeaponDisplay") then
                      if string.match(game.Players.LocalPlayer.PlayerGui.WeaponDisplay.Frame.Ammo.text, "%d") == "0" then
                        keypress(0x52)
                        keyrelease(0x52)
                      end
                    end
                    end)
                  end

                  function equipgun()
                    pcall(function()
                    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                      if v and v:FindFirstChild("LocalScript") then
                        game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"):EquipTool(v)
                      end
                      end
                    end)
                  end


                  function checkGun()
                    if not game.Players.LocalPlayer.PlayerGui.WeaponDisplay:FindFirstChild("Frame")
                    then game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"):UnequipTools()
                    wait()
                    equipgun()
                  end
                  end

                spawn(function()
                pcall(function()
                local loc = game.Players.LocalPlayer
                local cam = workspace.Camera
                while wait() do
                  if swin.flags.afk then
                    loc.CameraMode = Enum.CameraMode.LockFirstPerson
                    if loc.Team.Name == "Survivor" then
                      equipgun()
                      for i,v in pairs(workspace.Sharks:GetChildren()) do
                        if workspace.Sharks:FindFirstChild(tostring(v.Name)) then
                          game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"):UnequipTools()
                          equipgun()
                          --checkgun()
                          cam.CoordinateFrame = CFrame.new(cam.CoordinateFrame.p, v.Body.CFrame.p)
                          mouse1press()
                          wait()
                          mouse1release()
                          reload()
                        end
                      end
                    end
                  else loc.CameraMode = Enum.CameraMode.Classic
                  end
                end
                end)
                end)















                swin:Toggle("No Barriers", {flag = "barrier"}, function(flag)
                if flag then
                  for i,v in pairs(workspace:GetDescendants()) do
                    if v:IsA("Part") and v.Name ~= "gayboy" then
                      v.CanCollide = false
                    end
                  end
                else
                  for i,v in pairs(workspace:GetDescendants()) do
                    if v:IsA("Part") then
                      v.CanCollide = true
                    end
                  end
                end
                end)


swin:Toggle("Auto-Chest", {flag = "chest"}, function(flag)
  if flag then
    local LocalPlayer = game.Players.LocalPlayer
    if workspace:FindFirstChild("ChestDrop") then
      local bpos = LocalPlayer.Character.HumanoidRootPart.CFrame 
    wait(0.5)
    LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.ChestDrop.LootChest.Union.CFrame
    wait(0.5)
    LocalPlayer.Character.HumanoidRootPart.CFrame = bpos
  end
end
  end)


spawn(function()
workspace.ChildAdded:Connect(function(chest)
  local LocalPlayer = game.Players.LocalPlayer
if chest.Name == "ChestDrop" and swin.flags.chest then
  local bpos = LocalPlayer.Character.HumanoidRootPart.CFrame 
    wait(0.5)
    LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.ChestDrop.LootChest.Union.CFrame
    wait(0.5)
    LocalPlayer.Character.HumanoidRootPart.CFrame = bpos
  end
  end)
end)

swin:Toggle("RGB Water", {flag = "water"}, function(flag)
  if not flag then
    workspace.Terrain.WaterColor = Color3.fromRGB(52, 120, 154)
  end
  end)

spawn(function(rgbwater)
while wait() do
  if swin.flags.water then
                  workspace.Terrain.WaterColor = Color3.fromHSV(tick() * 24 % 255/255, 1, 1)
                  wait()
                end
              end
end)


                spawn(function()
                pcall(function()
                while wait() do
                  local lp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                  if swin.flags.tpshark and lp and game.Players.LocalPlayer.Team.Name == "Survivor" then
                    for i,v in pairs(game.Workspace.Sharks:GetChildren()) do
						for i1,v1 in pairs(game.Players:GetChildren()) do
								if v1.Team.Name ~= "Shark" and v.Name == v1.Name.."Shark" then
							v:Destroy()
						end
						end
                      if v then
                        v:WaitForChild("Body")
                        v.Body.CFrame = lp.CFrame + Vector3.new(0,i + 10,100)
                      end
                    end
                  end
                end
                end)
                end)
                
                ypcall(function()
                    if debug then
                        swin:Button("Infinite Ammo", function()
                            local plr = game:GetService("Players").LocalPlayer
game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"):UnequipTools()
function getGun()
    for i,v in pairs(plr.Backpack:GetChildren()) do
        if v.Name ~= "Flare Gun" and v:FindFirstChild("LocalScript") then
            return v.LocalScript
        end
        end
    end
for i,v in next, getgc() do 
    if type(v) == "function" and getfenv(v).script and getfenv(v).script == getGun() then 
        for i2,v2 in next, debug.getupvalues(v) do 
            if type(v2) == "number" then 
                debug.setupvalue(v, i2, math.huge)
            end
        end
end
end
                        end)
                        end
                    end)

                


swin:Button("Remove Ragdoll", function()
local ragdoll = require(game:GetService("ReplicatedStorage").Ragdoll)

ragdoll.Activate = function() return nil end
end)

                local o = swin:Button("Flare Gun", function()
                game.Workspace.Events.GamePasses.EquipFlareGun:FireServer()
                end)

                local i = swin:Button("Teleport to Lobby", function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3.76587367, 286.200226, -27.4438801)
                end)

                game.Workspace.Sharks.ChildAdded:Connect(function(shark)

                if swin.flags.shesp then
                  shark:WaitForChild("Kill")
                  local sesp = Instance.new("BillboardGui", game.CoreGui.esp.sharks)
                  sesp.Name = shark.Name
                  sesp.Adornee = shark.Kill
                  sesp.AlwaysOnTop=true
                  sesp.ResetOnSpawn=false
                  sesp.Size = UDim2.new(1,1,1,1)


                  local tag = Instance.new("TextLabel", sesp)
                  tag.Size = UDim2.new(10,10,10,10)
                  tag.Text = shark.OwnerName.Value
                  tag.TextColor3 = Color3.new(25,0,0)
                  tag.BackgroundTransparency = 1

                  local cham = Instance.new("BoxHandleAdornment", game.CoreGui.esp.sharks)
                  cham.Name = shark.Name
                  cham.Size = shark:WaitForChild("Body").Size
                  cham.Adornee = shark.Body
                  cham.AlwaysOnTop = true
                  cham.ZIndex = 5
                  cham.Color3 = Color3.new(244,0,0)
                  cham.Transparency = 0.72

                  if shark:FindFirstChild("Fin") then
                    local fin = Instance.new("BoxHandleAdornment", game.CoreGui.esp.sharks)
                    fin.Name = shark.Name
                    fin.Size = shark.Fin.Size
                    fin.Adornee = shark.Fin
                    fin.AlwaysOnTop = true
                    fin.ZIndex = 5
                    fin.Color3 = Color3.new(244,0,0)
                    fin.Transparency = 0.6
                  end
                end
                end)

                local Players = game:GetService("Players")
                local RunService = game:GetService("RunService")
                local Teams = game:GetService("Teams")
                survivor = Teams.Survivor

                survivor.PlayerAdded:Connect(function(character)

                RunService.Stepped:wait()
                if swin.flags.suresp then
                  if character.Team.Name == "Survivor" then
                    if character.Name ~= game.Players.LocalPlayer.Name then
                      local esp = Instance.new("BillboardGui", game.CoreGui.esp.survivors)
                      esp.Adornee = character.Character
                      esp.AlwaysOnTop=true
                      esp.ResetOnSpawn=false
                      esp.Size = UDim2.new(1,1,1,1)
                      esp.Name = character.Character.Name

                      local tag = Instance.new("TextLabel", esp)
                      tag.Size = UDim2.new(5,5,5,5)
                      tag.Text = "Survivor"
                      tag.TextColor3 = Color3.new(0, 255, 0)
                      tag.BackgroundTransparency = 1
                    end
                  end
                end
                end)

                survivor.PlayerRemoved:Connect(function(peen)
                if swin.flags.suresp then
                  for i,v in pairs(game.CoreGui.esp.survivors:GetChildren()) do
                    if v.Name == peen.Name then
                      v:Destroy()
                    end
                  end
                end
                end)

swin:Button("TP to New Server", function()
                  game:GetService("TeleportService"):Teleport(734159876)
                  end)


                swin:Button("Destroy", function()
                game.CoreGui.ScreenGui:Destroy()
                end)


                function sharkdist()
                  while wait() do
                    if swin.flags.shesp then
                      game.CoreGui.esp:FindFirstChild("sharks")
                      for i,v in pairs(game.CoreGui.esp.sharks:GetChildren()) do
                        if v then
                          if v:IsA("BillboardGui") then
                            oo = {};
                            table.insert(oo, v.Name)
                            for i = 1, #oo do
                              if workspace.Sharks:FindFirstChild(tostring(v.Name)) and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                local texts = math.ceil((v.Adornee.Position - game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).magnitude)
                                local text = tostring(texts)
                                v.TextLabel.Text = v.Adornee.Parent.OwnerName.Value.."\n["..text.."]"
                              else
                                v:Destroy()
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end

                function checkBox()
                  while wait() do
                    if swin.flags.shesp then
                      for i,v in pairs(game.CoreGui.esp.sharks:GetChildren()) do
                        if v:IsA("BoxHandleAdornment") then
                          if not workspace.Sharks:FindFirstChild(tostring(v.Name)) then
                            v:Destroy()
                          end
                        end
                      end
                      if swin.flags.suresp then
                        for i,v in pairs(game.CoreGui.esp.survivors:GetChildren()) do
                          if game.Players[v.Name].Team.Name ~= "Survivor" then
                            v:Destroy()
                          end
                        end
                      end
                    end
                  end
                end

                function survdist()
                  while wait() do
                    if swin.flags.suresp then
                      game.CoreGui.esp:FindFirstChild("survivors")
                      for i,v in pairs(game.CoreGui.esp.survivors:GetChildren()) do
                        if v then
                          oo = {};
                          table.insert(oo, v.Name)
                          for i = 1, #oo do
                            pcall(function()
                            if game.Players[v.Name].Team.Name == "Survivor" then
                              if game.Players.LocalPlayer.Team.Name == "Shark" then
                                workspace.Sharks:WaitForChild(tostring("Shark"..LocalPlayer))
                                workspace.Sharks["Shark"..LocalPlayer]:WaitForChild("Body")
                                local texts = math.ceil((v.Adornee:FindFirstChild("HumanoidRootPart").Position - workspace.Sharks["Shark"..LocalPlayer]:WaitForChild("Body").Position).magnitude)
                                local text = tostring(texts)
                                v.TextLabel.Text = v.Adornee.Name.."\n["..text.."]"
                              else
                                local texts = math.ceil((v.Adornee:FindFirstChild("HumanoidRootPart").Position - game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude)
                                local text = tostring(texts)
                                v.TextLabel.Text = v.Adornee.Name.."\n["..text.."]"
                              end
                            end
                            end)
                          end
                        end
                      end
                    end
                  end
                end
                spawn(function() sharkdist() end)
                spawn(function() survdist() end)
                spawn(function() checkBox() end)


                spawn(function(rainbow)
                while wait() do
                  game.CoreGui:FindFirstChild("ScreenGui")
                  game.CoreGui.ScreenGui.Container.Sharkbite.Underline.BackgroundColor3 = Color3.fromHSV(tick() * 24 % 255/255, 1, 1)
                  wait()
                end
                end)

                -- -- This script was generated by Hydroxide

                -- local oh1 = -0
                -- local oh2 = Vector3.new(5000000000, 0, 720000000)
                -- local oh3 = 0.05
                -- game:GetService("Workspace").Boats.Submarine.Engine.EngineEvent:FireServer(oh1, oh2, oh3)
