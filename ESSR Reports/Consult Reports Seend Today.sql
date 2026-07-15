SELECT 

j.journeyname AS JourneyName, 

CONVERT(DATE, s.eventdate) AS SendDate, 

COUNT(*) AS Sends 

FROM [_sent] AS s 

INNER JOIN [_journeyactivity] AS ja 

ON s.triggerersenddefinitionobjectid = ja.journeyactivityobjectid 

INNER JOIN [_journey] AS j 

ON ja.versionid = j.versionid 

WHERE ja.activitytype IN ('EMAIL', 'EMAILV2') 

AND j.journeyname IN ( 

'MCP Abandoned Cart Omni-Channel' 

, 'GLO_LifeCycle_Redeemed_Reward_Night' 

, 'GLO_LFC_Nurture_Tier_Maintain' 

, 'GLO_LFC_Q2MilestoneRewardsHighlight_1386000_A1_20240930' 

,'GLO_LFC_Q2MilestoneRewardsEducation_1386000_A1_20240930' 

,'GLO_LFC_Q2MilestoneRewardsNearly_1386000_A1_20240930' 

,'GLO_LFC_Lifecycle_Redeemed_Reward_Night_20260210' 

,'GLO_LFC_Educate_Evergreen App - A1 - Announcement - Launch' 

,'GLO_LFC_Educate_Evergreen App - A2 - Announcement - Reminder' 

,'GLO_LFC_Educate_Evergreen App - B1 - Booking Reminder' 

,'GLO_LFC_Educate_Evergreen App Offer Completion_T1 - V2' 

,'RS_GLO_LFC_WB2B22_897050_REG_journey' 

,'RS_GLO_LFC_WB2B22_897050_T2_COMPLETE_Journey' 

,'Newly_Elite_Diamond_20231017' 

,'Newly_Elite_Gold_20231017' 

,'Newly_Elite_Platinum_20231017' 

,'Newly_Elite_Silver_20231017' 

,'Voucher _issued_Deployment' 

,'Voucher_Reminder' 

,'MCP Abandoned Cart Omni-Channel' 

,'Achieved_Member_Choice_Issued_Deployment_2024' 

,'New_GLO_LFC_Milestone_Rewards_Cancelled_Journey' 

,'New_GLO_LFC_Milestone-Rewards_Redeemed_CSU' 

,'New_GLO_LFC_Milestone-Rewards_Redeemed_FAB' 

,'New_MemberChoice_fixed_5_25_Closed_Deployment'

,'GLO_LFC_1stStayOfferBook_1486100_B1_20250403'

,'GLO_LFC_Campaign_B_NextStay_10k_20kBkg_20262649_20260616'

,'GLO_LFC_PCSRP26L_20262701_20260518'

,'GLO_LFC_PCSRP26K_20262701_20260518'

) 

AND s.eventdate >= CAST(CONVERT(DATE, DATEADD(day, -1, GETDATE())) AS DATETIME) 

AND s.eventdate < CAST(CONVERT(DATE, GETDATE()) AS DATETIME) 

GROUP BY 

j.journeyname, 

CONVERT(DATE, s.eventdate) 

