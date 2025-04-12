RegisterTableGoal(GOAL_redthrower105000_Battle, "redthrower105000_Battle")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_redthrower105000_Battle, true)

Goal.Initialize = function (_, arg1, _, _)
    arg1:GetStringIndexedNumber("HealLimit")
    arg1:SetStringIndexedNumber("HealLimit", 3)
    arg1:GetStringIndexedNumber("Heal_Flg")
    arg1:GetStringIndexedNumber("WarCry_Int")
    arg1:GetStringIndexedNumber("BackSlash_Int")
    arg1:GetStringIndexedNumber("Dash_Int")
    arg1:GetStringIndexedNumber("Atk_Cnt")
    arg1:SetStringIndexedNumber("WarCry_Int", 0)
    arg1:SetStringIndexedNumber("BackSlash_Int", 0)
    arg1:SetStringIndexedNumber("Dash_Int", 0)
    arg1:SetStringIndexedNumber("Atk_Cnt", 0)
    arg1:SetStringIndexedNumber("Heal_Flg", 0)
    arg1:EnableUnfavorableAttackCheck(0, 3000)
    arg1:EnableUnfavorableAttackCheck(0, 3001)
    arg1:EnableUnfavorableAttackCheck(0, 3002)
    arg1:EnableUnfavorableAttackCheck(0, 3003)
    arg1:EnableUnfavorableAttackCheck(0, 3004)
    arg1:EnableUnfavorableAttackCheck(0, 3008)
    arg1:EnableUnfavorableAttackCheck(0, 3009)
    arg1:EnableUnfavorableAttackCheck(0, 3010)
    arg1:EnableUnfavorableAttackCheck(0, 3011)
    arg1:EnableUnfavorableAttackCheck(0, 3012)
    arg1:EnableUnfavorableAttackCheck(0, 3013)
    arg1:EnableUnfavorableAttackCheck(0, 3016)
    arg1:EnableUnfavorableAttackCheck(0, 3017)
    arg1:EnableUnfavorableAttackCheck(0, 3019)
    arg1:EnableUnfavorableAttackCheck(0, 3020)
    arg1:EnableUnfavorableAttackCheck(0, 3021)
    arg1:EnableUnfavorableAttackCheck(0, 3022)
    arg1:EnableUnfavorableAttackCheck(0, 3023)
    arg1:EnableUnfavorableAttackCheck(0, 3024)
    arg1:EnableUnfavorableAttackCheck(0, 3027)
    arg1:EnableUnfavorableAttackCheck(0, 3028)
    arg1:EnableUnfavorableAttackCheck(0, 3029)
    arg1:EnableUnfavorableAttackCheck(0, 3030)
    arg1:EnableUnfavorableAttackCheck(0, 3031)
    arg1:EnableUnfavorableAttackCheck(0, 3032)
    arg1:EnableUnfavorableAttackCheck(0, 3033)
    arg1:EnableUnfavorableAttackCheck(0, 3034)
end

Goal.Activate = function (_, actor, goals)
    Init_Pseudo_Global(actor, goals)
    actor:SetStringIndexedNumber("Dist_SideStep", 5)
    actor:SetStringIndexedNumber("Dist_BackStep", 5)
    local probabilities = {}
    local acts = {}
    local f2_local0 = {}
    Common_Clear_Param(probabilities, acts, f2_local0)
    local distance = actor:GetDist(TARGET_ENE_0)
    actor:GetRandam_Int(1, 100)
    actor:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkAttr_doAdmirer)
    actor:GetEventRequest()
    actor:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    actor:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    actor:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5027)
    actor:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5028)
    actor:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5029)
    actor:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5030)
    actor:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5034)
    actor:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 14557)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5031)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5032)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 14557)
	actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 99906002)
    local f2_local1 = actor:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkAttr_doAdmirer)
    if f2_local1 == 1 and actor:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Kankyaku then
        if distance >= 5 then
            probabilities[44] = 100
            probabilities[12] = 10
        else
            probabilities[44] = 100
            probabilities[11] = 100
        end
    elseif f2_local1 == 1 and actor:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Torimaki then
        if distance >= 5 then
            probabilities[44] = 100
            probabilities[12] = 10
        else
            probabilities[44] = 100
            probabilities[11] = 100
        end
    elseif actor:HasSpecialEffectId(TARGET_SELF, 99906002) == true then
		if distance > 10 then
			probabilities[1] = 30
			probabilities[2] = 30
			probabilities[44] = 20
		elseif distance > 4 then
			probabilities[3] = 30
			probabilities[4] = 30
			probabilities[8] = 15
			probabilities[44] = 15
		else
			probabilities[5] = 20
			probabilities[6] = 20
			probabilities[7] = 20
			probabilities[8] = 10
			probabilities[44] = 10
		end
	else
		if distance > 10 then
			probabilities[44] = 30
		elseif distance > 4 then
			probabilities[8] = 30
			probabilities[9] = 20
			probabilities[10] = 20
		else
			probabilities[8] = 30
			probabilities[9] = 20
			probabilities[10] = 20
		end
	end
    probabilities[1] = SetCoolTime(actor, goals, 3039, 10, probabilities[1], 1)
    probabilities[2] = SetCoolTime(actor, goals, 3038, 1, probabilities[2], 1)
    probabilities[3] = SetCoolTime(actor, goals, 3037, 10, probabilities[3], 1)
    probabilities[4] = SetCoolTime(actor, goals, 3038, 10, probabilities[4], 1)
    probabilities[5] = SetCoolTime(actor, goals, 3000, 10, probabilities[5], 0)
	probabilities[6] = SetCoolTime(actor, goals, 3009, 10, probabilities[6], 0)
    probabilities[7] = SetCoolTime(actor, goals, 3001, 7, probabilities[7], 0)
    probabilities[8] = SetCoolTime(actor, goals, 3031, 1, probabilities[8], 0)
	probabilities[9] = SetCoolTime(actor, goals, 3032, 1, probabilities[9], 0)
	probabilities[10] = SetCoolTime(actor, goals, 3033, 1, probabilities[10], 0)
    acts[1] = REGIST_FUNC(actor, goals, redthrower105000_Act01)
    acts[2] = REGIST_FUNC(actor, goals, redthrower105000_Act02)
    acts[3] = REGIST_FUNC(actor, goals, redthrower105000_Act03)
    acts[4] = REGIST_FUNC(actor, goals, redthrower105000_Act04)
    acts[5] = REGIST_FUNC(actor, goals, redthrower105000_Act05)
    acts[6] = REGIST_FUNC(actor, goals, redthrower105000_Act06)
    acts[7] = REGIST_FUNC(actor, goals, redthrower105000_Act07)
    acts[8] = REGIST_FUNC(actor, goals, redthrower105000_Act08)
    acts[9] = REGIST_FUNC(actor, goals, redthrower105000_Act09)
    acts[10] = REGIST_FUNC(actor, goals, redthrower105000_Act10)
    acts[11] = REGIST_FUNC(actor, goals, redthrower105000_Act11)
    acts[12] = REGIST_FUNC(actor, goals, redthrower105000_Act12)
    acts[44] = REGIST_FUNC(actor, goals, redthrower105000_Act44)
    Common_Battle_Activate(actor, goals, probabilities, acts, REGIST_FUNC(actor, goals, redthrower105000_ActAfter_AdjustSpace), f2_local0)
end

function redthrower105000_Act01(actor, goals, _)
    local action = 3039
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function redthrower105000_Act02(actor, goals, _)
    local action = 3038
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function redthrower105000_Act03(actor, goals, _)
	local rand = actor:GetRandam_Int(1, 100)
    local action = 3037
    local success_distance = 999
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3038, TARGET_ENE_0, 999, 0, 0, 0, 0)
	if rand < 33 then
		goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3031, TARGET_ENE_0, 999, 0, 0, 0, 0)
	elseif rand < 66 then
		goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3032, TARGET_ENE_0, 999, 0, 0, 0, 0)
	else
		goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3033, TARGET_ENE_0, 999, 0, 0, 0, 0)
	end
	GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function redthrower105000_Act04(actor, goals, _)
	local rand = actor:GetRandam_Int(1, 100)
    local action = 3038
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    if rand < 33 then
		goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3031, TARGET_ENE_0, 999, 0, 0, 0, 0)
	elseif rand < 66 then
		goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3032, TARGET_ENE_0, 999, 0, 0, 0, 0)
	else
		goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3033, TARGET_ENE_0, 999, 0, 0, 0, 0)
	end
	GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function redthrower105000_Act05(actor, goals, _)
    local f9_local0 = 5
    local f9_local1 = 0
    local f9_local2 = 999
    local f9_local3 = actor:GetStringIndexedNumber("Dash_Int")
    local f9_local4 = 0
    local f9_local5 = 2
    local f9_local6 = 2
    Approach_Act_Flex(actor, goals, f9_local0, f9_local1, f9_local2, f9_local3, f9_local4, f9_local5, f9_local6)
	local rand = actor:GetRandam_Int(1, 100)
    local action = 3000
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
	GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function redthrower105000_Act06(actor, goals, _)
	local rand = actor:GetRandam_Int(1, 100)
    local action = 3009
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
	if rand < 33 then
		goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3031, TARGET_ENE_0, 999, 0, 0, 0, 0)
	elseif rand < 66 then
		goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3032, TARGET_ENE_0, 999, 0, 0, 0, 0)
	else
		goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3033, TARGET_ENE_0, 999, 0, 0, 0, 0)
	end
	GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function redthrower105000_Act07(actor, goals, _)
	local rand = actor:GetRandam_Int(1, 100)
    local action = 3001
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
	GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function redthrower105000_Act08(actor, goals, _)
	local rand = actor:GetRandam_Int(1, 100)
	local action = 3031
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
	GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function redthrower105000_Act09(actor, goals, _)
	local rand = actor:GetRandam_Int(1, 100)
	local action = 3032
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
	GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function redthrower105000_Act10(actor, goals, _)
	local rand = actor:GetRandam_Int(1, 100)
	local action = 3033
    local success_distance = 5 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
	GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

-- sidehops
function redthrower105000_Act11(arg0, goals, _)
    local rand = arg0:GetRandam_Int(1, 100)
	local action = 3032
    local success_distance = 5 - arg0:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    if arg0:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) then
        goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3034, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    else
        goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3035, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

-- front hop
function TwinglaiveDragonCultist_Act12(_, goals, _)
    goals:AddSubGoal(GOAL_COMMON_StepSafety, 3, 1, -1, -1, -1, TARGET_ENE_0, 0, 0, true)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function redthrower105000_Act44(arg0, goals, _)
    goals:AddSubGoal(GOAL_COMMON_SidewayMove, arg0:GetRandam_Float(2, 2.5), TARGET_ENE_0, arg0:GetRandam_Int(0, 1), arg0:GetRandam_Int(30, 45), true, true, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function redthrower105000_ActAfter_AdjustSpace(_, goals, _)
    goals:AddSubGoal(GOAL_redthrower105000_AfterAttackAct, 10)
end

Goal.Update = function (arg0, arg1, arg2)
    return Update_Default_NoSubGoal(arg0, arg1, arg2)
end

Goal.Terminate = function (_, _, _)
end

Goal.Interrupt = function (_, actor, goals)
    if actor:IsLadderAct(TARGET_SELF) then
        return false
    end
    local distance = actor:GetDist(TARGET_ENE_0)
    local random = actor:GetRandam_Int(1, 100)
    if actor:IsInterupt(INTERUPT_Damaged) then
        actor:SetStringIndexedNumber("Atk_Cnt", 0)
        if actor:HasSpecialEffectId(TARGET_SELF, 14570) then
            return false
        elseif actor:GetTimer(1) <= 0 and actor:HasSpecialEffectId(TARGET_SELF, 14555) == false and random < 80 then
            goals:ClearSubGoal()
            actor:SetTimer(1, 7)
            if random < 30 and actor:GetTimer(5) <= 0 and actor:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, -1, 5 + actor:GetMapHitRadius(TARGET_SELF)) then
                actor:SetTimer(5, 15)
                goals:ClearSubGoal()
				if actor:HasSpecialEffectId(TARGET_SELF, 99906002) == true then
					goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3001, TARGET_ENE_0, 5, 0, 0, 0, 0)
				end
                return true
            elseif random < 60 and actor:GetTimer(6) <= 0 and actor:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, -1, 5 + actor:GetMapHitRadius(TARGET_SELF)) then
                goals:ClearSubGoal()
                actor:SetTimer(6, 15)
                if actor:HasSpecialEffectId(TARGET_SELF, 14550) == false then
                    goals:AddSubGoal(GOAL_COMMON_SpinStep, 4, 6001, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
                elseif actor:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, -1, 3 + actor:GetMapHitRadius(TARGET_SELF)) and random < 50 then
                    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3024, TARGET_ENE_0, 5, 0, 0, 0, 0)
                else
                    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3024, TARGET_ENE_0, 5, 0, 0, 0, 0)
                end
                return true
            elseif random < 80 and actor:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 240, -1, 5 + actor:GetMapHitRadius(TARGET_SELF)) then
                goals:ClearSubGoal()
                if actor:HasSpecialEffectId(TARGET_SELF, 99906002) == true then
					goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3001, TARGET_ENE_0, 5, 0, 0, 0, 0)
				end
                return true
            end
        end
    end
    if actor:IsInterupt(INTERUPT_Shoot) and actor:HasSpecialEffectId(TARGET_SELF, 5025) then
        if actor:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 180) then
            goals:ClearSubGoal()
            goals:AddSubGoal(GOAL_COMMON_SpinStep, 4, 6003, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 0)
            return true
        elseif actor:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) then
            goals:ClearSubGoal()
            goals:AddSubGoal(GOAL_COMMON_SpinStep, 4, 6002, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 0)
            return true
        end
    end
    if actor:IsInterupt(INTERUPT_ActivateSpecialEffect) then
        if actor:HasSpecialEffectId(TARGET_SELF, 5026) then
            if actor:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 200, -1, 5.5) then
                goals:ClearSubGoal()
                if actor:HasSpecialEffectId(TARGET_SELF, 14550) and random >= 30 then
                    random = random - 30
                end
                if random > 50 then
                    goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 4, 3001, TARGET_ENE_0, 0, 0, 0, 0, 0)
                elseif random > 30 then
                    goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 4, 3007, TARGET_ENE_0, 0, 0, 0, 0, 0)
                else
                    goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 4, 3021, TARGET_ENE_0, 0, 0, 0, 0, 0)
                end
                return true
            elseif actor:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 200, -1, 15) then
                goals:ClearSubGoal()
                goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 4, 3007, TARGET_ENE_0, 0, 0, 0, 0, 0)
                return true
            elseif distance < 5 then
                goals:ClearSubGoal()
                actor:Replaning()
                return true
            end
        elseif actor:HasSpecialEffectId(TARGET_SELF, 5027) then
            if actor:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 200, -1, 5) then
                if random < 30 or actor:GetTimer(10) > 0 then
                    actor:SetTimer(10, 0)
                    goals:ClearSubGoal()
                    goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 4, 3002, TARGET_ENE_0, 0, 0, 0, 0, 0)
                    return true
                else
                    actor:SetTimer(10, 15)
                    actor:SetTimer(5, 10)
                    goals:ClearSubGoal()
                    goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 4, 3006, TARGET_ENE_0, 0, 0, 0, 0, 0)
                    return true
                end
            elseif actor:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 200, -1, 14) then
                actor:SetTimer(10, 15)
                actor:SetTimer(5, 10)
                goals:ClearSubGoal()
                goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 4, 3006, TARGET_ENE_0, 0, 0, 0, 0, 0)
                return true
            elseif actor:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_L, 200, -1, 3.5) then
                goals:ClearSubGoal()
                goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 4, 3013, TARGET_ENE_0, 0, 0, 0, 0, 0)
                return true
            elseif distance < 4 then
                actor:SetTimer(10, 0)
                goals:ClearSubGoal()
                goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 4, 3002, TARGET_ENE_0, 0, 0, 0, 0, 0)
                return true
            end
        elseif actor:HasSpecialEffectId(TARGET_SELF, 5028) then
            if actor:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 210, -1, 5 + actor:GetMapHitRadius(TARGET_SELF)) then
                if actor:HasSpecialEffectId(TARGET_SELF, 14550) and random > 20 then
                    goals:ClearSubGoal()
                    goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 4, 3008, TARGET_ENE_0, 0, 0, 0, 0, 0)
                    return true
                end
            elseif actor:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 210, -1, 15) then
                goals:ClearSubGoal()
                goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 4, 3009, TARGET_ENE_0, 0, 0, 0, 0, 0)
                return true
            elseif distance < 5.5 then
                goals:ClearSubGoal()
                if actor:HasSpecialEffectId(TARGET_SELF, 14550) then
                    goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 4, 3008, TARGET_ENE_0, 0, 0, 0, 0, 0)
                end
                return true
            else
                goals:ClearSubGoal()
                goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 4, 3009, TARGET_ENE_0, 0, 0, 0, 0, 0)
                return true
            end
        elseif actor:HasSpecialEffectId(TARGET_SELF, 5029) then
            if actor:HasSpecialEffectId(TARGET_SELF, 14550) == false then
                return false
            elseif actor:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_FR, 220, -1, 5.5 + actor:GetMapHitRadius(TARGET_SELF)) then
                goals:ClearSubGoal()
                goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 4, 3011, TARGET_ENE_0, 0, 0, 0, 0, 0)
                return true
            elseif actor:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_L, 180, -1, 4.5 + actor:GetMapHitRadius(TARGET_SELF)) then
                goals:ClearSubGoal()
                goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 4, 3013, TARGET_ENE_0, 0, 0, 0, 0, 0)
                return true
            end
        elseif actor:HasSpecialEffectId(TARGET_SELF, 5030) then
            if actor:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 200, -1, 6.5) then
                goals:ClearSubGoal()
                goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 4, 3004, TARGET_ENE_0, 0, 0, 0, 0, 0)
                return true
            elseif distance < 5 then
                goals:ClearSubGoal()
                actor:Replaning()
                return true
            end
        elseif actor:HasSpecialEffectId(TARGET_SELF, 5031) and actor:HasSpecialEffectId(TARGET_SELF, 14550) then
            if actor:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, -1, 6 + actor:GetMapHitRadius(TARGET_SELF)) then
                goals:ClearSubGoal()
                goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3023, TARGET_ENE_0, 999, 0, 120, 0, 0)
                goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3017, TARGET_ENE_0, 999, 0, 0, 0, 0)
                return true
            end
        elseif actor:HasSpecialEffectId(TARGET_SELF, 5032) then
            goals:ClearSubGoal()
            goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3008, TARGET_ENE_0, 999, 0, 120, 0, 0)
            return true
        elseif actor:HasSpecialEffectId(TARGET_SELF, 5034) then
            if distance < 2 or actor:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_B, 200, -1, -1) then
                actor:SetStringIndexedNumber("Atk_Cnt", 0)
                goals:ClearSubGoal()
                actor:Replaning()
                return true
            end
        elseif actor:HasSpecialEffectId(TARGET_SELF, 14557) then
            actor:SetStringIndexedNumber("Heal_Flg", 1)
            return true
        end
    end
    return false
end

RegisterTableGoal(GOAL_redthrower105000_AfterAttackAct, "redthrower105000_AfterAttackAct")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_redthrower105000_AfterAttackAct, true)

Goal.Update = function (arg0, arg1, arg2)
    return Update_Default_NoSubGoal(arg0, arg1, arg2)
end
