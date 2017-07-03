--
-- Difficulties Improve
--
-- @author  TyKonKet
-- @date 22/12/2016
DifficultiesImprove = {};
DifficultiesImprove.name = "DifficultiesImprove";
DifficultiesImprove.debug = true;

function DifficultiesImprove:print(text, ...)
    if self.debug then
        local start = string.format("[%s(%s)] -> ", self.name, getDate("%H:%M:%S"));
        local ptext = string.format(text, ...);
        print(string.format("%s%s", start, ptext));
    end
end

function DifficultiesImprove:initialize(missionInfo, missionDynamicInfo, loadingScreen)
    self = DifficultiesImprove;
    self:print("initialize()");
end
g_mpLoadingScreen.loadFunction = Utils.prependedFunction(g_mpLoadingScreen.loadFunction, DifficultiesImprove.initialize);

function DifficultiesImprove:load(missionInfo, missionDynamicInfo, loadingScreen)
    self = DifficultiesImprove;
    self:print("load()");
    g_currentMission.loadMapFinished = Utils.appendedFunction(g_currentMission.loadMapFinished, self.loadMapFinished);
    g_currentMission.onStartMission = Utils.appendedFunction(g_currentMission.onStartMission, self.afterLoad);
    g_currentMission.missionInfo.saveToXML = Utils.appendedFunction(g_currentMission.missionInfo.saveToXML, self.saveSavegame);
end
g_mpLoadingScreen.loadFunction = Utils.appendedFunction(g_mpLoadingScreen.loadFunction, DifficultiesImprove.load);

function DifficultiesImprove:loadMap(name)
    self:print("loadMap(name:%s)", name);
    DifficultiesImprove.hasSeasons = g_seasons ~= nil;
    DifficultiesImprove.hasMRE = Vehicle.mrLoadFinished ~= nil;
    DifficultiesImprove.hasMRG = g_currentMission.mrGameplayDoChangeFillTypes ~= nil;
    self:loadSavegame();
    self:print("Seasons is %s!", DifficultiesImprove.hasSeasons);
    self:print("More Realistic Engine is %s!", DifficultiesImprove.hasMRE);
    self:print("More Realistic Gameplay is %s!", DifficultiesImprove.hasMRG);
    local difficullties = {EASY = 1, NORMAL = 2, HARD = 3};
    --EconomyManager.PRICE_MULTIPLIER = {2, 1.5, 1.0}
    EconomyManager.PRICE_MULTIPLIER = {2.2, 1.5, 0.9}
    --EconomyManager.COST_MULTIPLIER = {0.5, 0.75, 1.0}
    EconomyManager.COST_MULTIPLIER = {0.4, 0.75, 1.1}
    if g_currentMission.missionInfo.difficulty == difficullties.EASY then
        self:print("Game difficulty is EASY!");
        if not DifficultiesImprove.hasSeasons then
            --200.000
            g_currentMission.missionStats.loanMax = 2000000;
            --50
            g_currentMission.missionStats.loanAnnualInterestRate = 100;
        end
        --0.01
        EconomyManager.PER_DAY_LEASING_FACTOR = 0.01;
        --0.05
        EconomyManager.DEFAULT_RUNNING_LEASING_FACTOR = 0.02;
        --0.05
        EconomyManager.DEFAULT_LEASING_DEPOSIT_FACTOR = 0.01;
        --0.6
        EconomyManager.PRICE_DROP_MIN_PERCENT = 0.4;
        -- 0.08333
        EconomyManager.LIFETIME_OPERATINGTIME_RATIO = 0.07333;
        --1000
        EconomyManager.CONFIG_CHANGE_PRICE = 500;
        --1.2
        EconomyManager.DIRECT_SELL_MULTIPLIER = 1.5;
        if not DifficultiesImprove.hasSeasons then
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
        end
        if not DifficultiesImprove.hasMRE then
            --0.5
            g_currentMission.missionInfo.buyPriceMultiplier = 0.4;
            --2
            g_currentMission.missionInfo.sellPriceMultiplier = 2.1;
        end
    end
    if g_currentMission.missionInfo.difficulty == difficullties.NORMAL then
        self:print("Game difficulty is NORMAL!");
        if not DifficultiesImprove.hasSeasons then
            --200.000
            g_currentMission.missionStats.loanMax = 1000000;
            --100
            g_currentMission.missionStats.loanAnnualInterestRate = 200;
        end
        --0.01
        EconomyManager.PER_DAY_LEASING_FACTOR = 0.02;
        --0.05
        EconomyManager.DEFAULT_RUNNING_LEASING_FACTOR = 0.04;
        --0.05
        EconomyManager.DEFAULT_LEASING_DEPOSIT_FACTOR = 0.035;
        --0.6
        EconomyManager.PRICE_DROP_MIN_PERCENT = 0.5;
        -- 0.08333
        EconomyManager.LIFETIME_OPERATINGTIME_RATIO = 0.08333;
        --1000
        EconomyManager.CONFIG_CHANGE_PRICE = 1500;
        --1.2
        EconomyManager.DIRECT_SELL_MULTIPLIER = 1.35;
        if not DifficultiesImprove.hasSeasons then
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
        end
        if not DifficultiesImprove.hasMRE then
            --0.75
            g_currentMission.missionInfo.buyPriceMultiplier = 0.9;
            --1.5
            g_currentMission.missionInfo.sellPriceMultiplier = 1.6;
        end
    end
    if g_currentMission.missionInfo.difficulty == difficullties.HARD then
        self:print("Game difficulty is HARD!");
        if not DifficultiesImprove.hasSeasons then
            --200.000
            g_currentMission.missionStats.loanMax = 500000;
            --150
            g_currentMission.missionStats.loanAnnualInterestRate = 300;
        end
        --0.01
        EconomyManager.PER_DAY_LEASING_FACTOR = 0.03;
        --0.05
        EconomyManager.DEFAULT_RUNNING_LEASING_FACTOR = 0.06;
        --0.05
        EconomyManager.DEFAULT_LEASING_DEPOSIT_FACTOR = 0.055;
        --0.6
        EconomyManager.PRICE_DROP_MIN_PERCENT = 0.6;
        -- 0.08333
        EconomyManager.LIFETIME_OPERATINGTIME_RATIO = 0.09333;
        --1000
        EconomyManager.CONFIG_CHANGE_PRICE = 2500;
        --1.2
        EconomyManager.DIRECT_SELL_MULTIPLIER = 1.15;
        if not DifficultiesImprove.hasSeasons then
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
        end
        if not DifficultiesImprove.hasMRE then
            --1
            g_currentMission.missionInfo.buyPriceMultiplier = 1.2;
            --1
            g_currentMission.missionInfo.sellPriceMultiplier = 0.9;
        end
    end
end

function DifficultiesImprove:loadMapFinished()
    self = DifficultiesImprove;
    self:print("loadMapFinished()");
end

function DifficultiesImprove:afterLoad()
    self = DifficultiesImprove;
    self:print("afterLoad");
end

function DifficultiesImprove:loadSavegame()
    self:print("loadSavegame()");
end

function DifficultiesImprove:saveSavegame()
    self = DifficultiesImprove;
    self:print("saveSavegame()");
end

function DifficultiesImprove:deleteMap()
    self:print("deleteMap()");
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
