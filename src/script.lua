--
-- DifficultiesImprove script
--
--
-- @author  TyKonKet
-- @date 22/12/2016

DifficultiesImprove = {};
DifficultiesImprove.name = "DifficultiesImprove";
DifficultiesImprove.debug = true;

function DifficultiesImprove:print(txt)
    if DifficultiesImprove.debug then
        print("[" .. self.name .. "] -> " .. txt);
    end
end

function DifficultiesImprove:loadMap(name)    
    if not g_currentMission.DifficultiesImprove_isLoaded then
        g_currentMission.DifficultiesImprove_isLoaded = true;
        g_isDevelopmentVersion = DifficultiesImprove.debug;

        local difficullties = { EASY = 1, NORMAL = 2, HARD = 3 };
        
        if g_currentMission.missionInfo.difficulty == difficullties.EASY then
            self:print("Game difficulty is EASY!");
            --200.000
            g_currentMission.missionStats.loanMax = 2000000;
            --50
            g_currentMission.missionStats.loanAnnualInterestRate = 100;
            --3
            EconomyManager.MAX_GREAT_DEMANDS = 5;
            --0.5
            EconomyManager.COST_MULTIPLIER[1] = 0.4;
            --2
            EconomyManager.PRICE_MULTIPLIER[1] = 2.2;
            --0.01
            EconomyManager.PER_DAY_LEASING_FACTOR = 0.01;
            --0.6
            EconomyManager.PRICE_DROP_MIN_PERCENT = 0.4;
            --1000
            EconomyManager.CONFIG_CHANGE_PRICE = 500;
            --0.05
            EconomyManager.DEFAULT_RUNNING_LEASING_FACTOR = 0.02;
            --0.05
            EconomyManager.DEFAULT_LEASING_DEPOSIT_FACTOR = 0.01;
            --1.2
            EconomyManager.DIRECT_SELL_MULTIPLIER = 1.5;
            --4
            EconomyManager.MAX_DAILYUPKEEP_MULTIPLIER = 3;
            --60.000
            FieldDefinition.PRICE_PER_HA = 40000;
            --5000
            g_currentMission.husbandries.cow.animalDesc.price = 2000;
            --40
		    g_currentMission.husbandries.cow.animalDesc.dailyUpkeep = 50;
            --0.02
            g_currentMission.husbandries.cow.animalDesc.birthRatePerDay = 0.1;
            --30
            g_currentMission.husbandries.cow.animalDesc.dirtFillLevelPerDay = 10;
            --3000
            g_currentMission.husbandries.pig.animalDesc.price = 500;
            --30
		    g_currentMission.husbandries.pig.animalDesc.dailyUpkeep = 25;
            --0.16666666666667
            g_currentMission.husbandries.pig.animalDesc.birthRatePerDay = 0.2;
            --30
            g_currentMission.husbandries.pig.animalDesc.dirtFillLevelPerDay = 5;
            --4000
            g_currentMission.husbandries.sheep.animalDesc.price = 100;
            --20
		    g_currentMission.husbandries.sheep.animalDesc.dailyUpkeep = 5;
            --0.025
            g_currentMission.husbandries.sheep.animalDesc.birthRatePerDay = 0.15;
            --30
            g_currentMission.husbandries.sheep.animalDesc.dirtFillLevelPerDay = 2;
            --1
            g_currentMission.missionInfo.buyPriceMultiplier = 0.9;
        end

        if g_currentMission.missionInfo.difficulty == difficullties.NORMAL then
            self:print("Game difficulty is NORMAL!");
            --200.000
            g_currentMission.missionStats.loanMax = 1000000;
            --100
            g_currentMission.missionStats.loanAnnualInterestRate = 200;
            --3
            EconomyManager.MAX_GREAT_DEMANDS = 3;
            --0.75
            EconomyManager.COST_MULTIPLIER[1] = 0.75;
            --1.5
            EconomyManager.PRICE_MULTIPLIER[1] = 1.5;
            --0.01
            EconomyManager.PER_DAY_LEASING_FACTOR = 0.02;
            --0.6
            EconomyManager.PRICE_DROP_MIN_PERCENT = 0.5;
            --1000
            EconomyManager.CONFIG_CHANGE_PRICE = 1500;
            --0.05
            EconomyManager.DEFAULT_RUNNING_LEASING_FACTOR = 0.04;
            --0.05
            EconomyManager.DEFAULT_LEASING_DEPOSIT_FACTOR = 0.035;
            --1.2
            EconomyManager.DIRECT_SELL_MULTIPLIER = 1.35;
            --4
            EconomyManager.MAX_DAILYUPKEEP_MULTIPLIER = 5;
            --60.000
            FieldDefinition.PRICE_PER_HA = 60000;
            --5000
            g_currentMission.husbandries.cow.animalDesc.price = 2500;
            --40
		    g_currentMission.husbandries.cow.animalDesc.dailyUpkeep = 60;
            --0.02
            g_currentMission.husbandries.cow.animalDesc.birthRatePerDay = 0.08;
            --30
            g_currentMission.husbandries.cow.animalDesc.dirtFillLevelPerDay = 20;
            --3000
            g_currentMission.husbandries.pig.animalDesc.price = 650;
            --30
		    g_currentMission.husbandries.pig.animalDesc.dailyUpkeep = 30;
            --0.16666666666667
            g_currentMission.husbandries.pig.animalDesc.birthRatePerDay = 0.18;
            --30
            g_currentMission.husbandries.pig.animalDesc.dirtFillLevelPerDay = 10;
            --4000
            g_currentMission.husbandries.sheep.animalDesc.price = 150;
            --20
		    g_currentMission.husbandries.sheep.animalDesc.dailyUpkeep = 10;
            --0.025
            g_currentMission.husbandries.sheep.animalDesc.birthRatePerDay = 0.12;
            --30
            g_currentMission.husbandries.sheep.animalDesc.dirtFillLevelPerDay = 4;
            --1
            g_currentMission.missionInfo.buyPriceMultiplier = 1.20;
        end

        if g_currentMission.missionInfo.difficulty == difficullties.HARD then
            self:print("Game difficulty is HARD!");
            --200.000
            g_currentMission.missionStats.loanMax = 500000;
            --150
            g_currentMission.missionStats.loanAnnualInterestRate = 300;
            --3
            EconomyManager.MAX_GREAT_DEMANDS = 1;
            --1
            EconomyManager.COST_MULTIPLIER[1] = 1.1;
            --1
            EconomyManager.PRICE_MULTIPLIER[1] = 0.9;
            --0.01
            EconomyManager.PER_DAY_LEASING_FACTOR = 0.03;
            --0.6
            EconomyManager.PRICE_DROP_MIN_PERCENT = 0.6;
            --1000
            EconomyManager.CONFIG_CHANGE_PRICE = 2500;
            --0.05
            EconomyManager.DEFAULT_RUNNING_LEASING_FACTOR = 0.06;
            --0.05
            EconomyManager.DEFAULT_LEASING_DEPOSIT_FACTOR = 0.055;
            --1.2
            EconomyManager.DIRECT_SELL_MULTIPLIER = 1.15;
            --4
            EconomyManager.MAX_DAILYUPKEEP_MULTIPLIER = 7;
            --60.000
            FieldDefinition.PRICE_PER_HA = 80000;
            --5000
            g_currentMission.husbandries.cow.animalDesc.price = 3000;
            --40
		    g_currentMission.husbandries.cow.animalDesc.dailyUpkeep = 70;
            --0.02
            g_currentMission.husbandries.cow.animalDesc.birthRatePerDay = 0.04;
            --30
            g_currentMission.husbandries.cow.animalDesc.dirtFillLevelPerDay = 30;
            --3000
            g_currentMission.husbandries.pig.animalDesc.price = 800;
            --30
		    g_currentMission.husbandries.pig.animalDesc.dailyUpkeep = 35;
            --0.16666666666667
            g_currentMission.husbandries.pig.animalDesc.birthRatePerDay = 0.15;
            --30
            g_currentMission.husbandries.pig.animalDesc.dirtFillLevelPerDay = 15;
            --4000
            g_currentMission.husbandries.sheep.animalDesc.price = 200;
            --20
		    g_currentMission.husbandries.sheep.animalDesc.dailyUpkeep = 15;
            --0.025
            g_currentMission.husbandries.sheep.animalDesc.birthRatePerDay = 0.1;
            --30
            g_currentMission.husbandries.sheep.animalDesc.dirtFillLevelPerDay = 8;
            --1
            g_currentMission.missionInfo.buyPriceMultiplier = 1.5;
        end
    else
        self:print("Error: " .. self.name .. " has been loaded already!");
    end
end

function DifficultiesImprove:deleteMap()
    g_currentMission.DifficultiesImprove_isLoaded = false;
end

function DifficultiesImprove:keyEvent(unicode, sym, modifier, isDown)
end

function DifficultiesImprove:mouseEvent(posX, posY, isDown, isUp, button)
end

function DifficultiesImprove:update(dt)
end

function DifficultiesImprove:draw()
end

addModEventListener(DifficultiesImprove)